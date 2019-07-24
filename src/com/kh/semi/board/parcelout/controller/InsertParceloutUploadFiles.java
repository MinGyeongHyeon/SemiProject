package com.kh.semi.board.parcelout.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.board.parcelout.model.service.UserBoardService;
import com.kh.semi.board.parcelout.model.vo.Attachment;
import com.kh.semi.board.parcelout.model.vo.UserBoard;
import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.user.model.vo.User;
import com.oreilly.servlet.MultipartRequest;


@WebServlet("/upload.po")
public class InsertParceloutUploadFiles extends HttpServlet {
   private static final long serialVersionUID = 1L;


   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	   System.out.println("서블릿호출?");

	   System.out.println(ServletFileUpload.isMultipartContent(request));


      if(ServletFileUpload.isMultipartContent(request)) {

    	  System.out.println("1111");


         int maxSize = 1024 * 1024 * 10;


         String root = request.getSession().getServletContext().getRealPath("/");



         String savePath = root + "parcelout_uploadFiles/";



         MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

         ArrayList<String> saveFiles = new ArrayList<String>();


         ArrayList<String> originFiles = new ArrayList<String>();

         Enumeration<String> files = multiRequest.getFileNames();

         while(files.hasMoreElements()) {

        	System.out.println("2222");
            String name = files.nextElement();



            saveFiles.add(multiRequest.getFilesystemName(name));

            originFiles.add(multiRequest.getOriginalFileName(name));

         }


         String multiTitle = multiRequest.getParameter("title");
         String multiContent = multiRequest.getParameter("content");
         int starRev = Integer.parseInt(multiRequest.getParameter("starRev")) ;

         System.out.println("별점이 몇점 나오냐  ? : " + starRev);

         int uno = ((User) (request.getSession().getAttribute("loginUser"))).getUserNo();



         UserBoard b = new UserBoard();
         b.setbNm(multiTitle);;
         b.setbCon(multiContent);
         b.setuNo(uno);
         b.setStarRev(starRev);


         ArrayList<Attachment> fileList = new ArrayList<Attachment>();


         for(int i = originFiles.size() - 1; i >= 0;  i--) {
        	 System.out.println("3333");
            Attachment at = new Attachment();
            at.setFilePath(savePath);
            at.setOriginNm(originFiles.get(i));
            at.setChangeNm(saveFiles.get(i));

            fileList.add(at);
         }



         int result = new UserBoardService().insertOutuploadFiles(b, fileList);

         System.out.println("경현선생님 결과값  : " + result);

         if(result > 0) {
            response.sendRedirect(request.getContextPath() + "/selectOutList.tn");

         }else {
            //실패시 저장된 사진 삭제
            for(int i = 0; i < saveFiles.size(); i++) {
               File failedFile = new File(savePath + saveFiles.get(i));
               failedFile.delete();


            }


         }


      }

   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      doGet(request, response);

   }

}