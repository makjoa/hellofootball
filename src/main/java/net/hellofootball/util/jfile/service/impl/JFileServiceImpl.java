package net.hellofootball.util.jfile.service.impl;

import java.io.File;
import java.util.Collection;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import net.hellofootball.util.jfile.GlovalVariables;
import net.hellofootball.util.jfile.JProperties;
import net.hellofootball.util.jfile.service.JFile;
import net.hellofootball.util.jfile.service.JFileDetails;
import net.hellofootball.util.jfile.service.JFileService;
import net.hellofootball.util.jfile.service.template.JFileUploadModeFactory;
import net.hellofootball.util.jfile.service.template.JFileUploadModeTemplate;

@Service
public class JFileServiceImpl implements JFileService {

	/** 로거 */
	protected Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private AttachFileDao dao;
	
	private Object EMPTY_OBJECT = "";
	
	public String getFileId(String fileId, Object fileSeq) {		
		initializeAttachFileStatus(fileId, fileSeq);		
		return JFileUploadModeFactory.INSTANCE.getUploadType(JFileService.DB_MODE).getHandler().getFileId(fileId);
	}
	
	private void initializeAttachFileStatus(String fileId, Object fileSeq) {
		if(StringUtils.hasText(fileId))
			updateAttachFileDeleteYnByFileId(fileId, "N");
		
		if(fileSeq != null && !EMPTY_OBJECT.equals(fileSeq))
			updateAttachFileDeleteYn(fileId, fileSeq.getClass().isArray() ? (Object[])fileSeq : new Object[]{fileSeq}, "Y");
	}
	
	public void addAttachFile(JFileDetails fileVo) {
		dao.addAttachFile(fileVo);
	}

	public void updateAttachFileDeleteYn(String fileId, Object[] fileSeqs, String yn) {
		dao.updateAttachFileDeleteYn(fileId, fileSeqs, yn);
	}

	public void updateAttachFileDeleteYnByFileId(String fileId, String deleteYn) {
		dao.updateAttachFileDeleteYnByFileId(fileId, deleteYn);
	}

	public void updateAttachFileDownloadCount(String fileId) {
		dao.updateAttachFileDownloadCount(fileId);
	}

	public void updateAttachFileDownloadCount(String fileId, String fileSeq) {
		dao.updateAttachFileDownloadCount(fileId, fileSeq);
	}

	public void updateAttachFileDownloadCountBySequence(String fileId, String fileSeq) {
		dao.updateAttachFileDownloadCountBySequence(fileId, fileSeq);
	}
	
	public void updateAttachFileDownloadCountByFileId(String fileId) {
		dao.updateAttachFileDownloadCountByFileId(fileId);
	}
	
	public void removeAttachFile(String fileId, List<Object> fileSeqs) {
		dao.removeAttachFile(fileId, fileSeqs);
	}
	
	public boolean isExistingAttachFileInfo(String fileId, List<Object> fileSeqs) {
		if(fileId == null || fileSeqs == null)
			return false;
		return dao.isExistingAttachFileInfo(fileId, fileSeqs);
	}
	
	public JFileVO getAttachFile(String fileId, String fileSeq) {
		return dao.selectAttachFile(fileId, fileSeq);
	}
	public Object[] getAttacheFileSeqs(String fileId) {
		return dao.getAttachFileSeqs(fileId);
	}

	public List<JFileDetails> getAttachFiles(String fileId) {
		return dao.selectAttachFiles(fileId);
	}

	public void upload(Collection<MultipartFile> multipartFiles, JFileVO fileVo) {		
		if(multipartFiles == null)
			return;		
		for (final MultipartFile file : multipartFiles) {
			upload(file, fileVo);
        }
	}
	
	private void upload(MultipartFile multipartFile, JFileVO fileVo) {
		JFileUploadModeFactory.INSTANCE.getUploadType(fileVo.getUploadMode()).getHandler().upload(multipartFile, fileVo);
		if(JFileService.DB_MODE.equalsIgnoreCase(fileVo.getUploadMode())) {
			addAttachFile(fileVo);
		}
	}
	
	public void executeAfterUploadCompleted(String fileId) {
		Object[] fileSeqs = getAttacheFileSeqs(fileId);
		if(fileSeqs == null || fileSeqs.length == 0)
			return;
		
		/** 파일을 삭제한다. */
		if(fileSeqs != null) {
			JFileUploadModeTemplate upload = JFileUploadModeFactory.INSTANCE.getUploadType(JFileService.DB_MODE).getHandler();
			for(int i=0; i<fileSeqs.length; i++) {
				JFileDetails fileInfo = getAttachFile(fileId, (String)fileSeqs[i]);
				upload.deleteJFiles(fileInfo, JProperties.getString(GlovalVariables.DEFAULT_FILE_UPLOAD_PATH_KEY), JFileService.DB_MODE);
			}
		}		
		/** 파일업로드 이력테이블(J_ATTACHFILE) 에서 삭제할 파일 목록을 삭제한다. */
		@SuppressWarnings("unchecked")	
		List<Object> list = CollectionUtils.arrayToList(fileSeqs);
		removeAttachFile(fileId, list);
	}
	
	public JFile getFile(String fileId, String fileSeq, String useSecurity) {
		JFileUploadModeTemplate upload = JFileUploadModeFactory.INSTANCE.getUploadType(JFileService.DB_MODE).getHandler();
		return upload.getJFile(getAttachFile(fileId, fileSeq), useSecurity, JProperties.getString(GlovalVariables.DEFAULT_FILE_UPLOAD_PATH_KEY));
	}
	
	public JFile[] getFiles(String fileId, String useSecurity) {
		JFileUploadModeTemplate upload = JFileUploadModeFactory.INSTANCE.getUploadType(JFileService.DB_MODE).getHandler();		
		return upload.getFiles(getAttachFiles(fileId), JProperties.getString(GlovalVariables.DEFAULT_FILE_UPLOAD_PATH_KEY), useSecurity, JFileService.DB_MODE);
	}
	
	public JFile getFileBySequence(String fileId, String fileSeq, String useSecurity) {
		JFileUploadModeTemplate upload = JFileUploadModeFactory.INSTANCE.getUploadType(JFileService.DB_MODE).getHandler();
		return upload.getJFile(getAttachFile(fileId, fileSeq), useSecurity, JProperties.getString(GlovalVariables.DEFAULT_FILE_UPLOAD_PATH_KEY));
	}
}
