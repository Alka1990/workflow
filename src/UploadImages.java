// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
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

@WebServlet({"/UploadImages"})
public class UploadImages extends HttpServlet {
   static final Logger LOGGER = LogManager.getLogger(UploadImages.class);
   private boolean isMultipart;
   private String filePath;
   private String tempPath;
   private int maxFileSize = 5632000;
   private int maxMemSize = 1126400;
   private File file;
   private static final SimpleDateFormat sdf1 = new SimpleDateFormat("dd.MM.yyyy");

   public UploadImages() {
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      this.doPost(request, response);
   }

   public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
      PrintWriter out = res.getWriter();
      new Properties();
      InputStream input = null;
      new Timestamp(System.currentTimeMillis());
      ServletContext context = this.getServletContext();
      String path = context.getRealPath("/WEB-INF/resources/data32watts.properties");
      FileReader reader = new FileReader(path);
      Properties p = new Properties();
      p.load(reader);
      this.filePath = p.getProperty("uploadImagesFolder");
      this.isMultipart = ServletFileUpload.isMultipartContent(req);
      System.out.println("hi multipart = " + this.isMultipart);
      req.setAttribute("isMultipart", this.isMultipart);
      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setRepository(new File(this.filePath));
      ServletFileUpload upload = new ServletFileUpload(factory);
      String case_id = null;
      String id = null;
      String folder_name = "";
      String doctor_name = "";
      String patient_name = "";
      String clinic_name = "";
      String options = "";
      String loginUser = (String)req.getSession().getAttribute("userid");
      String str = "";
      String fullpath = "";
      String timeStamp = (new SimpleDateFormat("dd.MM.yyyy.HH.mm.ss")).format(new Date());

      try {
         List fileItems = upload.parseRequest(req);
         Iterator<FileItem> i = fileItems.iterator();
         String[] columns = new String[]{"upper_img", "lower_img", "front_img", "left_img", "right_img", "simple_img", "simle_img", "side_img", "pdf_doc", "ppf_doc", "tpr_doc"};
         String[] values = new String[11];
         int count = 0;
         Connection con = null;
         con = LoginDAO.getConnectionDetails();

         FileItem fi;
         String itemname;
         while(i.hasNext()) {
            ++count;
            fi = (FileItem)i.next();
            if (fi.isFormField()) {
               itemname = fi.getFieldName();
               if (itemname.equals("case_id")) {
                  case_id = fi.getString();
               }

               if (itemname.equals("doctor_name")) {
                  doctor_name = fi.getString();
               }

               if (itemname.equals("patient_name")) {
                  patient_name = fi.getString();
               }

               if (itemname.equals("clinic_name")) {
                  clinic_name = fi.getString();
               }

               if (itemname.equals("options")) {
                  options = fi.getString();
               }
            } else {
               itemname = fi.getName();
               if (itemname != "") {
                  values[count - 6] = itemname;
                  str = String.valueOf(this.filePath) + case_id + '_' + timeStamp;
                  System.out.println("path : " + str);
                  fullpath = str;
                  this.file = new File(str);
                  str = this.file.getAbsolutePath();
                  System.out.println("str check : " + str);
                  if (!this.file.exists()) {
                     this.file.mkdir();
                  }

                  if (itemname.lastIndexOf("\\") >= 0) {
                     str = String.valueOf(str) + '/' + itemname.substring(itemname.lastIndexOf("\\"));
                     this.file = new File(str);
                  } else {
                     str = String.valueOf(str) + '/' + itemname.substring(itemname.lastIndexOf("\\") + 1);
                     this.file = new File(str);
                  }

                  fi.write(this.file);
               }
            }
         }

         try {
            fi = null;
            Statement st = con.createStatement();
            folder_name = "'" + folder_name + "'";
            itemname = "insert into uploadsimages(case_id,doctor_name,patient_name,clinic_name,options,user_id,file_path,date";

            int j;
            for(j = 0; j < columns.length; ++j) {
               itemname = String.valueOf(itemname) + "," + columns[j];
            }

            itemname = String.valueOf(itemname) + ") values('" + case_id + "','" + doctor_name + "','" + patient_name + "','" + clinic_name + "','" + options + "','" + loginUser + "','" + fullpath + "',now() ";

            for(j = 0; j < values.length; ++j) {
               if (values[j] != null) {
                  itemname = String.valueOf(itemname) + ",'" + values[j] + "'";
               } else {
                  itemname = String.valueOf(itemname) + "," + values[j];
               }
            }

            itemname = String.valueOf(itemname) + ")";
            PreparedStatement ps = con.prepareStatement(itemname);
            System.out.println("ps path and file == " + ps.toString());
            int row = ps.executeUpdate();
            if (row > 0) {
               out.println("<script type=\"text/javascript\">");
               out.println("alert('Photo Uploaded Successfully');");
               out.println("location='Case_Stage';");
               out.println("</script>");
            } else {
               out.println("<script type=\"text/javascript\">");
               out.println("alert('Error occur while uploading photos);");
               out.println("location='Case_Stage';");
               out.println("</script>");
            }
         } catch (Exception var39) {
            LOGGER.info("Error At " + this.getClass().getSimpleName() + " Message1 " + var39.getMessage());
            var39.printStackTrace();
         } finally {
            con.close();
         }
      } catch (Exception var41) {
         var41.printStackTrace();
         LOGGER.info("Error At " + this.getClass().getSimpleName() + " Message2 " + var41.getMessage());
      }

   }
}
