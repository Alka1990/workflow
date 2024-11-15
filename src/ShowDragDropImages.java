
// Source code is decompiled from a .class file using FernFlower decompiler.
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/ShowDragDropImages" })
public class ShowDragDropImages extends HttpServlet {
    private static final long serialVersionUID = 1L;
    static final Logger LOGGER = LogManager.getLogger(ShowDragDropImages.class);

    public ShowDragDropImages() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String caseId = request.getParameter("caseId");
        HttpSession session = request.getSession();
        RequestDispatcher rd = request.getRequestDispatcher("showimages.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doGet(request, response);
    }
}