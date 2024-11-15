// Source code is decompiled from a .class file using FernFlower decompiler.
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({"/Upload"})
public class Upload extends HttpServlet {
   private static final long serialVersionUID = 1L;
   static final Logger LOGGER = LogManager.getLogger(Upload.class);
   String UPLOAD_DIRECTORY = "";
   private boolean isMultipart;
   private String filePath;
   private String tempPath;
   private int maxFileSize = 5632000;
   private int maxMemSize = 1126400;
   private File file;

   public Upload() {
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.getWriter().append("Served at: ").append(request.getContextPath());
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      UUID uniqueKey = UUID.randomUUID();
      int case_id = 0;
      int test = 1000000000;
      int case_id1 = Integer.parseInt(request.getParameter("case_id") == null ? "0" : request.getParameter("case_id"));
      System.out.println("upload case_id............" + case_id1);
      ServletContext context = this.getServletContext();
      String path = context.getRealPath("/WEB-INF/resources/data32watts.properties");
      FileReader reader = new FileReader(path);
      Properties p = new Properties();
      p.load(reader);
      this.UPLOAD_DIRECTORY = p.getProperty("uploadImagesFolder");
      String value = "";
      ServletFileUpload.isMultipartContent(request);
      ServletFileUpload upload = new ServletFileUpload();
      FileItemIterator iter = null;

      try {
         iter = upload.getItemIterator(request);

         while(iter.hasNext()) {
            FileItemStream item = null;
            item = iter.next();
            if (item.isFormField()) {
               String name = item.getFieldName();
               value = Streams.asString(item.openStream());
               System.out.println("value " + value);
            } else {
               System.out.println("Nothing");
            }
         }
      } catch (FileUploadException var20) {
         var20.printStackTrace();
      }

      if (ServletFileUpload.isMultipartContent(request)) {
         try {
            System.out.println("check 1");
            List<FileItem> multiparts = (new ServletFileUpload(new DiskFileItemFactory())).parseRequest(request);
            Iterator var15 = multiparts.iterator();

            while(var15.hasNext()) {
               FileItem item = (FileItem)var15.next();
               System.out.println("check 2");
               if (!item.isFormField()) {
                  String name = (new File(item.getName())).getName();
                  System.out.println("name : " + name);
                  String path1 = String.valueOf(this.UPLOAD_DIRECTORY) + "/" + case_id1 + "_" + uniqueKey;
                  File dir = new File(path1);
                  if (dir.exists()) {
                     System.out.println("folder is already exist in the path ");
                  } else {
                     dir.mkdir();
                  }

                  item.write(new File(dir + File.separator + name));
               }
            }

            request.setAttribute("message", "File Uploaded Successfully");
         } catch (Exception var19) {
            request.setAttribute("message", "File Upload Failed due to " + var19);
         }
      } else {
         request.setAttribute("message", "Sorry this Servlet only handles file upload request");
      }

      response.sendRedirect("Dashboard");
   }
}
