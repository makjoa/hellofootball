package net.hellofootball.util.jfile.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.hellofootball.util.jfile.service.JFileDetails;

import org.springframework.util.CollectionUtils;

 public interface AttachFileDao {
	/**
	 * 첨부파일 정보를 저장한다.
	 * @param fileId 파일 아이디.
	 * @param fileName 파일 명.
	 * @param fileSize 파일 사이즈.
	 * @param maskingFileName 마스킹 파일명.
	 * @param expireDate 폐기 일자.
	 * @param limitCount 첨부파일 제한 갯수.
	 */
	 void addAttachFile(JFileDetails fileVo);

	/**
	 * 파일아이디와 파일 시퀀스로 첨부 파일 정보를 조회한다.
	 * @param fileId 파일 아이디.
	 * @param fileSeq 파일 시퀀스.
	 * @return JFileVO 첨부파일 정보. 
	 */
	
	 JFileVO selectAttachFile(final String fileId, final String fileSeq);

	/**
	 * 파일아이디로 첨부파일 정보를 조회한다.
	 * @param fileId 파일 아이디.
	 * @return List<JFileVO> 첨부파일 목록 정보.
	 */

	 List<JFileDetails> selectAttachFiles(final String fileId);

	/**
	 * 파일아이디로 삭제여부 컬럼을 변경한다.
	 * @param fileId 파일 아이디.
	 * @param deleteYn 삭제 여부.
	 */
	
	 void updateAttachFileDeleteYnByFileId(final String fileId, final String deleteYn);

	/**
	 * 파일 아이디로 파일 다운로드시 다운로드 건수를 변경한다.
	 * @param fileId 파일 아이디.
	 */

	 void updateAttachFileDownloadCount(final String fileId);

	/**
	 * 파일 아이디와 파일 시퀀스로 다운로드 건수를 변경한다.
	 * @param fileId 파일 아이디.
	 * @param fileSeq 파일 시퀀스.
	 */
	
	 void updateAttachFileDownloadCount(final String fileId, final String fileSeq);

	/**
	 * 파일 아이디와 파일 시퀀스로 첨부파일 정보를 삭제한다.
	 * @param fileId 파일 아이디.
	 * @param fileSeqs 파일 시퀀스 목록.
	 */
	
	 void removeAttachFile(final String fileId, final List<Object> fileSeqs);

	/**
	 * 파일 아이디로 파일 시퀀스 목록을 조회한다.
	 * @param fileId 파일아이디.
	 * @return Object[] 파일 시퀀스 목록.
	 */
	 
	 Object[] getAttachFileSeqs(String fileId);
	 
	/**
	 * 파일 아이디와 파일 시퀀스로 파일삭제여부를 변경한다.
	 * @param fileId 파일 아이디.
	 * @param fileSeqs 파일 시퀀스 목록.
	 * @param deleteYn 파일 삭제 여부.
	 */
	
	 void updateAttachFileDeleteYn(final String fileId, final Object[] fileSeqs, final String deleteYn);

	/**
	 * 파일 아이디와 파일 시퀀스 목록으로 첨부파일 목록이 존재하는 지 여부를 조회한다.
	 * @param fileId 파일 아이디.
	 * @param fileSeqs 파일 시퀀스 목록.
	 * @return isExistingAttachFileInfo 파일목록 존재 여부.
	 */
	
	 boolean isExistingAttachFileInfo(final String fileId, final List<Object> fileSeqs);

	/**
	 * 파일 아이디와 파일 시퀀스로 다운로드한 건수를 변경한다.
	 * @param fileId 파일 아이디.
	 * @param fileSeq 파일 시퀀스.
	 */
	
	 void updateAttachFileDownloadCountBySequence(final String fileId, final String fileSeq);

	/**
	 * 파일아이디로 다운로드 한 건수를 변경한다.
	 * @param fileId 파일아이디.
	 */
	 
	 void updateAttachFileDownloadCountByFileId(String fileId);
}