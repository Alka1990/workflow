
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
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/SaveImages" })
public class SaveImages extends HttpServlet {
  private static final long serialVersionUID = 1L;
  static final Logger LOGGER = LogManager.getLogger(SaveImages.class);
  String UPLOAD_DIRECTORY = "";

  public SaveImages() {
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.uploadImg(request, response);
  }

  protected void uploadImg(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    boolean case_id = false;
    int case_id1 = Integer.parseInt(request.getParameter("case_id") == null ? "0" : request.getParameter("case_id"));
    System.out.println("uploadImg()............" + case_id1);
    UUID uniqueKey = UUID.randomUUID();
    ServletContext context = this.getServletContext();
    String path = context.getRealPath("/WEB-INF/resources/data32watts.properties");
    FileReader reader = new FileReader(path);
    Properties p = new Properties();
    p.load(reader);
    this.UPLOAD_DIRECTORY = p.getProperty("uploadImagesFolder");
    System.out.println("Planning_Type==333366=============" + this.UPLOAD_DIRECTORY);
    if (ServletFileUpload.isMultipartContent(request)) {
      try {
        List<FileItem> multiparts = (new ServletFileUpload(new DiskFileItemFactory())).parseRequest(request);
        Iterator var11 = multiparts.iterator();

        while (var11.hasNext()) {
          FileItem item = (FileItem) var11.next();
          if (!item.isFormField()) {
            String name = (new File(item.getName())).getName();
            System.out.println("name : " + name);
            File dir = new File(String.valueOf(this.UPLOAD_DIRECTORY) + "/" + case_id1 + "_" + uniqueKey);
            if (dir.exists()) {
              System.out.println("folder is already exist in the path ");
            } else {
              dir.mkdir();
            }

            item.write(new File(dir + File.separator + name));
          }
        }

        request.setAttribute("message", "File Uploaded Successfully");
      } catch (Exception var14) {
        request.setAttribute("message", "File Upload Failed due to " + var14);
      }
    } else {
      request.setAttribute("message", "Sorry this Servlet only handles file upload request");
    }

    response.sendRedirect("Dashboard");
  }
}
