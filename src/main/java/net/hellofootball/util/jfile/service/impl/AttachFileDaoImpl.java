package net.hellofootball.util.jfile.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import net.hellofootball.util.jfile.service.JFileDetails;

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
@Component
public class AttachFileDaoImpl extends SqlSessionDaoSupport implements AttachFileDao {
	
	/**
	 * 첨부파일 정보를 저장한다.
	 * @param fileId 파일 아이디.
	 * @param fileName 파일 명.
	 * @param fileSize 파일 사이즈.
	 * @param maskingFileName 마스킹 파일명.
	 * @param expireDate 폐기 일자.
	 * @param limitCount 첨부파일 제한 갯수.
	 */
	@Override
	public void addAttachFile(JFileDetails fileVo) {
		getSqlSession().insert("AttachFileDAO.addAttachFile", fileVo);
	}

	/**
	 * 파일아이디와 파일 시퀀스로 첨부 파일 정보를 조회한다.
	 * @param fileId 파일 아이디.
	 * @param fileSeq 파일 시퀀스.
	 * @return JFileVO 첨부파일 정보. 
	 */
	
	@SuppressWarnings({ "serial" })
	@Override
	public JFileVO selectAttachFile(final String fileId, final String fileSeq) {
		return (JFileVO) getSqlSession().selectOne("AttachFileDAO.getAttachFileToMap", new HashMap<String, Object>(){{
			put("fileId", fileId);
			put("fileSeq", fileSeq);
		}});
	}

	/**
	 * 파일아이디로 첨부파일 정보를 조회한다.
	 * @param fileId 파일 아이디.
	 * @return List<JFileVO> 첨부파일 목록 정보.
	 */
	@SuppressWarnings({ "unchecked", "serial"})
	@Override
	public List<JFileDetails> selectAttachFiles(final String fileId) {
		return getSqlSession().selectList("AttachFileDAO.getAttachFileToMap", new HashMap<String, Object>(){{
			put("fileId", fileId);
		}});
	}

	/**
	 * 파일아이디로 삭제여부 컬럼을 변경한다.
	 * @param fileId 파일 아이디.
	 * @param deleteYn 삭제 여부.
	 */
	@SuppressWarnings({ "serial" })
	public void updateAttachFileDeleteYnByFileId(final String fileId, final String deleteYn) {
		getSqlSession().update("AttachFileDAO.updateAttachFileDeleteYnByFileId", new HashMap<String, Object>(){{
			put("fileId", fileId);
			put("deleteYn", deleteYn);
		}});
	}

	/**
	 * 파일 아이디로 파일 다운로드시 다운로드 건수를 변경한다.
	 * @param fileId 파일 아이디.
	 */
	@SuppressWarnings({ "serial" })
	@Override
	public void updateAttachFileDownloadCount(final String fileId) {
		getSqlSession().update("AttachFileDAO.updateAttachFileDownloadCount", new HashMap<String, Object>(){{
			put("fileId", fileId);
		}});
	}

	/**
	 * 파일 아이디와 파일 시퀀스로 다운로드 건수를 변경한다.
	 * @param fileId 파일 아이디.
	 * @param fileSeq 파일 시퀀스.
	 */
	@SuppressWarnings({ "serial" })
	@Override
	public void updateAttachFileDownloadCount(final String fileId, final String fileSeq) {
		getSqlSession().update("AttachFileDAO.updateAttachFileDownloadCount", new HashMap<String, Object>(){{
			put("fileId", fileId);
			put("fileSeq", fileSeq);
		}});
	}

	/**
	 * 파일 아이디와 파일 시퀀스로 첨부파일 정보를 삭제한다.
	 * @param fileId 파일 아이디.
	 * @param fileSeqs 파일 시퀀스 목록.
	 */
	@SuppressWarnings({"serial" })
	@Override
	public void removeAttachFile(final String fileId, final List<Object> fileSeqs) {
		if(fileSeqs != null) {
			for(Object o : fileSeqs) {
				System.out.println("fileSeq : "+o);
			}
		}
		getSqlSession().delete("AttachFileDAO.removeAttachFile", new HashMap<String, Object>(){{
			put("fileId", fileId);
			put("fileSeqs", fileSeqs);
		}});
	}

	/**
	 * 파일 아이디로 파일 시퀀스 목록을 조회한다.
	 * @param fileId 파일아이디.
	 * @return Object[] 파일 시퀀스 목록.
	 */
	@Override
	public Object[] getAttachFileSeqs(String fileId) {
		@SuppressWarnings("unchecked")
		List<Object> list = getSqlSession().selectList("AttachFileDAO.getAttachFileSeqs", fileId);
		return list != null ? list.toArray() : null;
	}

	/**
	 * 파일 아이디와 파일 시퀀스로 파일삭제여부를 변경한다.
	 * @param fileId 파일 아이디.
	 * @param fileSeqs 파일 시퀀스 목록.
	 * @param deleteYn 파일 삭제 여부.
	 */
	@SuppressWarnings({"serial" })
	@Override
	public void updateAttachFileDeleteYn(final String fileId, final Object[] fileSeqs, final String deleteYn) {
		if(fileId == null || fileSeqs == null)
			return;
		getSqlSession().update("AttachFileDAO.updateAttachFileDeleteYn", new HashMap<String, Object>(){{
			put("fileId", fileId);
			put("fileSeqs", CollectionUtils.arrayToList(fileSeqs));
			put("deleteYn", deleteYn);
		}});
	}

	/**
	 * 파일 아이디와 파일 시퀀스 목록으로 첨부파일 목록이 존재하는 지 여부를 조회한다.
	 * @param fileId 파일 아이디.
	 * @param fileSeqs 파일 시퀀스 목록.
	 * @return isExistingAttachFileInfo 파일목록 존재 여부.
	 */
	@SuppressWarnings({"serial"})
	@Override
	public boolean isExistingAttachFileInfo(final String fileId, final List<Object> fileSeqs) {
		Map<String, Object> paramMap = new HashMap<String, Object>(){{
			put("fileId", fileId);
			put("fileSeqs", fileSeqs);
		}};
		return getSqlSession().selectList("AttachFileDAO.isExistingAttachFileInfo", paramMap).size() != 0;
	}

	/**
	 * 파일 아이디와 파일 시퀀스로 다운로드한 건수를 변경한다.
	 * @param fileId 파일 아이디.
	 * @param fileSeq 파일 시퀀스.
	 */
	@SuppressWarnings({"serial"})
	@Override
	public void updateAttachFileDownloadCountBySequence(final String fileId, final String fileSeq) {
		getSqlSession().update("AttachFileDAO.updateAttachFileDownloadCountBySequence", new HashMap<String ,Object>(){{
			put("fileId", fileId);
			put("fileSeq", fileSeq);
		}});
	}

	/**
	 * 파일아이디로 다운로드 한 건수를 변경한다.
	 * @param fileId 파일아이디.
	 */
	@Override
	public void updateAttachFileDownloadCountByFileId(String fileId) {
		getSqlSession().update("AttachFileDAO.updateAttachFileDownloadCountByFileId", fileId);
	}
}
