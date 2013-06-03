package net.hellofootball.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hellofootball.domain.Attachment;

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

	@RequestMapping(value = "/form")	
	public String form(Model model, Attachment attachment)  {
		return "../../resources/editor/pages/trex/file";
	}
	@RequestMapping(value = "")
	public String upload(MultipartHttpServletRequest request, Model model) throws IOException {		
				
		System.out.println(request);
		
		MultipartFile file = request.getFile(ATTACHMENT_FILE_INPUT_NAME);
		

		System.out.println(file.getOriginalFilename());
		System.out.println(file.getSize());
		System.out.println(file.getName());
		System.out.println(file.getContentType());
		String path = request.getRealPath( "/user_files/");
		System.out.println("Path: " + path);
		System.out.println("Path: " + request.getRequestURI());
        InputStream inputStream = null;
        OutputStream outputStream = null;
        try {
            inputStream = file.getInputStream();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        try {
            outputStream = new FileOutputStream(path +"/" + file.getOriginalFilename());
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        int readBytes = 0;
        byte[] buffer = new byte[8192];
        try {
            while ((readBytes = inputStream.read(buffer, 0, 8192)) != -1) {
                        outputStream.write(buffer, 0, readBytes);
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        try {
            outputStream.close();
            inputStream.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }		
		model.addAttribute("url", path +"/" + file.getOriginalFilename());
		model.addAttribute("filesize", file.getSize());
		model.addAttribute("type", file.getContentType());
		model.addAttribute("filename", file.getOriginalFilename());
		
		return "jsonView";
	}

}
