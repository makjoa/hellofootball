package net.hellofootball.jfile.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import net.hellofootball.jfile.GlovalVariables;
import net.hellofootball.jfile.security.service.CipherService;
import net.hellofootball.jfile.service.JFile;
import net.hellofootball.jfile.utils.SpringUtils;
import net.hellofootball.jfile.utils.ZipUtils;

/**
 *  클래스
 * @author 정호열
 * @since 2010.10.17
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일        수정자       수정내용
 *  -------       --------    ---------------------------
 *   2010.10.17   정호열       최초 생성
 *
 * </pre>
 */
public class JfileDownloadView extends AbstractView {

	/** DownloadView 명. */
	public static final String NAME = "jfileDownload";
	
	/** DownloadView 모델 명. */
	public static final String MODELNAME = "downloadFile";

	/**
	 * 생성자.
	 */
	public JfileDownloadView() {
		setContentType("application/octet-stream");
	}
	
	/**
	 * 파일을 다운로드 한다.
	 */
	
	@Override
	protected void renderMergedOutputModel(Map model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Object obj = model.get(MODELNAME);		
		response.setContentType(getContentType());		
		if(obj != null && obj.getClass().isArray()) {
			JFile[] files = (JFile[])obj;
			setResponseHeader(request, response, "all.zip", -1);
			ZipUtils.createZipJFile(files, response.getOutputStream());
		}else{
			File file = (File)obj;			
			setResponseHeader(request, response, (file instanceof JFile) ? ((JFile)file).getOriginalFileName() : file.getName(), (int)file.length());			
			OutputStream out = response.getOutputStream();			
			if (file instanceof JFile && ("true".equalsIgnoreCase(((JFile)file).getUseSecurity()))) {
				CipherService service = (CipherService)SpringUtils.getBean(GlovalVariables.CIPHER_SERVICE_BEAN_NAME);
				service.decrypt(new FileInputStream(file), out);
			}else {
				FileInputStream fin = new FileInputStream(file);
				try {
					FileCopyUtils.copy(fin, out);
				} catch (Exception e) {
					System.out.println("파일 다운로드 취소");
				}
				finally {
					fin.close();
				}
			}
		}
	}
	
	/**
	 * HttpServletResponse 헤더 정보를 세팅한다.
	 * @param request 요청 객체.
	 * @param response 응답 객체.
	 * @param fileName 파일 명
	 * @param contentLength 파일 사이즈.
	 * @throws UnsupportedEncodingException 인코딩 예외 발생 처리 객체.
	 */
	private void setResponseHeader(HttpServletRequest request, HttpServletResponse response, String fileName, int contentLength) throws UnsupportedEncodingException {
		String Agent = request.getHeader("USER-AGENT");
		if(fileName == null) {
			fileName = "NoImage";
		}
		if(contentLength != -1)
			response.setContentLength(contentLength);
		if (Agent.indexOf("MSIE") >= 0) {
			int i = Agent.indexOf('M', 2);
			String IEV = Agent.substring(i + 5, i + 8);
			if (IEV.equalsIgnoreCase("5.5")) {
				response.setHeader("Content-Disposition", "filename=\"" +  getEncoding(fileName)+"\"");
			} else {
				response.setHeader("Content-Disposition", "attachment;filename=\"" + getEncoding(fileName)+"\"");
			}
		} else {			
			response.setHeader("Content-Disposition", "attachment;filename=\"" + getEncoding(fileName)+"\"");
		}
		response.setHeader("Content-Transfer-Encoding", "binary");
	}

	private String getEncoding(String fileName)
			throws UnsupportedEncodingException {
		return new String(fileName.getBytes("euc-kr"), "8859_1");
	}
}