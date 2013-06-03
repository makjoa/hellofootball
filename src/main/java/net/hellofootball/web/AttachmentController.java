package net.hellofootball.web;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

@Controller
@RequestMapping("/attachments")
public class AttachmentController {
	public static final String ATTACHMENT_FILE_INPUT_NAME = "file";

	public static final long EXPIRE_MILLIS = 31556926000L; // 1year


	@RequestMapping(value = "")
	public String upload(MultipartHttpServletRequest request, Model model) throws IOException {		
				
		//System.out.println(multipartFile.getOriginalFilename());
		
		MultipartFile file = request.getFile(ATTACHMENT_FILE_INPUT_NAME);
		
		model.addAttribute("url", file.getOriginalFilename());
		model.addAttribute("filesize", file.getSize());
		model.addAttribute("filename", file.getName());
		System.out.println(file.getOriginalFilename());
		System.out.println(file.getSize());
		System.out.println(file.getName());
		System.out.println(file.getContentType());
		
		File tempfile =new File(request.getRealPath("/upload"), file.getOriginalFilename()); //파일 생성후 
		System.out.println(tempfile);
		return "../../resources/editor/pages/trex/file";
	}

}
