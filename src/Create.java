
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet({ "/Create" })
public class Create extends HttpServlet {
	static final Logger LOGGER = LogManager.getLogger(Create.class);
	private static final long serialVersionUID = 1L;

	public Create() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		String n = (String) session.getAttribute("userid");
		String nprofile = (String) session.getAttribute("profile");
		request.setAttribute("username", n);
		request.setAttribute("loginusername", n);
		List<String> declist = new ArrayList();
		String listofjs = "";
		String sDecision = "";

		try {
			declist = LoginDAO.getdecisionprofile();
			listofjs = LoginDAO.geteditables("workorder");
		} catch (ClassNotFoundException var12) {
			LOGGER.info("Error At AddComment=" + var12.getMessage());
		} catch (SQLException var13) {
			LOGGER.info("Error At AddComment=" + var13.getMessage());
		}

		for (int i = 0; i < ((List) declist).size(); ++i) {
			sDecision = sDecision + (String) ((List) declist).get(i) + "~";
		}

		sDecision = sDecision.substring(0, sDecision.length() - 1);
		request.setAttribute("sDecision", sDecision);
		request.setAttribute("currentstage", listofjs);
		String[] decArr = sDecision.split("~");

		for (int i = 0; i < decArr.length; ++i) {
		}

		RequestDispatcher rd = request.getRequestDispatcher("maindetails.jsp");
		rd.forward(request, response);
	}
}
