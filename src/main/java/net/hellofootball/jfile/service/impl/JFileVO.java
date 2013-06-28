package net.hellofootball.jfile.service.impl;

import java.util.Date;
import java.util.List;

import net.hellofootball.jfile.service.JFileDetails;

public class JFileVO implements JFileDetails {
	
	private String fileId = null; 
	 
	private String fileSeq = null; 
 
	private String fileName = null; 
 
	private long fileSize = -1; 

	private String fileMask = null; 
 
	private String downloadCount = null; 
 
	private String downloadExpireDate = null; 
 
	private String downloadLimitCount = null; 
 
	private String regDate = null; 
	
	private String useSecurity = null;
	
	private String uploadMode = "db";		
 
	private String deleteYn;
	
	private List<Object> fileSeqs;
	
	public List<Object> getFileSeqs() {
		return fileSeqs;
	}
	public void setFileSeqs(List<Object> fileSeqs) {
		this.fileSeqs = fileSeqs;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	/**
	 * @return fileId 파일 아이디
	 */
	public String getFileId() { 
		return fileId; 
	}	 
	/**
	 * @return fileSeq 파일 순번
	 */
	public String getFileSeq() { 
		return fileSeq; 
	}	 
	/**
	 * @return fileName 파일명
	 */
	public String getFileName() { 
		return fileName; 
	}	 

	/**
	 * @return fileSize 파일 사이즈
	 */
	public long getFileSize() { 
		return fileSize; 
	}	 
	/**
	 * @return fileMask 파일 마스크
	 */
	public String getFileMask() { 
		return fileMask; 
	}	 
 
	/**
	 * @return downloadCount 다운로드 카운트
	 */
	public String getDownloadCount() { 
		return downloadCount; 
	}	 
	
	/**
	 * @return downloadLimitCount 다운로드 제한 횟수
	 */
	public String getDownloadLimitCount() { 
		return downloadLimitCount; 
	}	 
	
	/**
	 * @param fileId 파일 아이디
	 */
	public void setFileId( String fileId) { 
		this.fileId = fileId; 
	} 
	/**
	 * @param fileSeq 파일 순번
	 */
	public void setFileSeq( String fileSeq) { 
		this.fileSeq = fileSeq; 
	} 
	/**
	 * @param fileSeq 파일명
	 */

	public void setFileName( String fileName) { 
		this.fileName = fileName; 
	} 

	/**
	 * @param fileSize 파일 사이즈
	 */
	public void setFileSize( long fileSize) { 
		this.fileSize = fileSize; 
	} 
	/**
	 * @param fileSize 파일 마스킹
	 */

	public void setFileMask( String fileMask) { 
		this.fileMask = fileMask; 
	} 

	/**
	 * @param downloadCount 다운로드 횟수
	 */

	public void setDownloadCount( String downloadCount) { 
		this.downloadCount = downloadCount; 
	} 

	/**
	 * @param downloadLimitCount 다운로드 제한 횟수
	 */
	public void setDownloadLimitCount( String downloadLimitCount) { 
		this.downloadLimitCount = downloadLimitCount; 
	} 

	
	public String getDownloadExpireDate() {
		return downloadExpireDate;
	}
	public void setDownloadExpireDate(String downloadExpireDate) {
		this.downloadExpireDate = downloadExpireDate;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUseSecurity() {
		return useSecurity;
	}
	public void setUseSecurity(String useSecurity) {
		this.useSecurity = useSecurity;
	}
	public String getUploadMode() {
		return uploadMode;
	}
	public void setUploadMode(String uploadMode) {
		this.uploadMode = uploadMode;
	} 
	
	public boolean isImage() {
		return 	("bmp". equals(getExtension()) ||
			     "gif". equals(getExtension()) ||
		         "jpg". equals(getExtension()) ||
		         "jpeg".equals(getExtension()) ||
		         "png". equals(getExtension())
		) ;
	}

	public String getExtension() {
		if(fileName == null)
			return null;
		return  fileName.lastIndexOf(".") > -1 ? fileName.substring(fileName.lastIndexOf(".")+1) : null; 
	}
	
	@Override
	public String toString() {
		return "JFileVO [fileId=" + fileId + ", fileSeq=" + fileSeq
				+ ", fileName=" + fileName + ", fileSize=" + fileSize
				+ ", fileMask=" + fileMask + ", downloadCount=" + downloadCount
				+ ", downloadExpireDate=" + downloadExpireDate
				+ ", downloadLimitCount=" + downloadLimitCount + ", regDate="
				+ regDate + ", useSecurity=" + useSecurity + ", uploadMode="
				+ uploadMode + ", deleteYn=" + deleteYn + ", fileSeqs="
				+ fileSeqs + "]";
	}
}
