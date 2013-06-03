package net.hellofootball.domain;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.multipart.MultipartFile;

public class Attachment {
	public static final String ATTACHMENT_DOWNLOAD_PREFIX = "/attachments";

	public static final String[] IMAGE_EXTENSIONS = { "jpg", "jpeg", "gif", "png" };

	private MultipartFile file;
	
	private String id;

	private String user;
	
	private String originalFilename;

	private String extension;

	private Date createdDate;

	public Attachment() {
		// no op;
	}

	public Attachment(String id) {
		setId(id);
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getId() {
		return id;
	}
	
	public void setUploader(String user) {
		this.user = user;
	}
	
	public String getUploader() {
		return user;
	}

	public void setOriginalFilename(String originalFilename) {
		String tempExtension = FilenameUtils.getExtension(originalFilename);
		if (StringUtils.isBlank(tempExtension)) {
			throw new IllegalArgumentException(originalFilename + " 파일의 확장자를 판단 할 수 없음.");
		}

		this.originalFilename = originalFilename;
		this.extension = tempExtension.toLowerCase();
	}
	
	public String getOriginalFilename() {
		return originalFilename;
	}
	
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getCreatedDate() {
		return this.createdDate;
	}

	public String getExtension() {
		return extension;
	}
	
	public String getCreatedDateYearMonth() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		return sdf.format(getCreatedDate());
	}
	
	public String getFilePath(String attachmentRootDir) {
		return String.format("/%s/%s/%s", attachmentRootDir, getCreatedDateYearMonth(), getId());
	}
	
	public boolean isImage() {
		if (ArrayUtils.contains(IMAGE_EXTENSIONS, getExtension())) {
			return true;
		}
		return false;
	}
	
	public Map<String, Object> toMap() {
		Map<String, Object> values = new HashMap<String, Object>();
		values.put("id", getId());
		values.put("originalFileName", getOriginalFilename());
		values.put("createdDate", getCreatedDate());
		return values;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
}
