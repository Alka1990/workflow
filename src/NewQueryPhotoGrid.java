

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.vo.MidAssessmentVo;
import com.vo.NewQueryPhotoVo;
import com.workflow.connection.LoginDAO;

@WebServlet("/NewQueryPhotoGrid")
public class NewQueryPhotoGrid extends HttpServlet {
       
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static final Logger LOGGER = LogManager.getLogger(DispImageGrid.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String caseId = request.getParameter("caseId");
		    String typeOfRequest = request.getParameter("typeOfRequest");
		    HttpSession session = request.getSession();
		    String n = (String)session.getAttribute("userid");
		    request.setAttribute("username", n);
		    if(typeOfRequest.equals("Next Batch Required") || typeOfRequest.equals("Retainer") || typeOfRequest.equals("Repeat")) {
		    	List<NewQueryPhotoVo> newQueryPhotoVo = LoginDAO.getNewQueryPhotoGrid(caseId,typeOfRequest);
		    	request.setAttribute("NewQueryPhotoList", newQueryPhotoVo);
		    }
		    else if(typeOfRequest.equals("Mid Scan")) {
		    	 List<MidAssessmentVo> midAssessmentPhotoGrid = LoginDAO.getMidAssessmentPhotoGrid(caseId);
		 	     request.setAttribute("MidAssessmentPhotoGrid", midAssessmentPhotoGrid);
		    }
		    request.setAttribute("typeOfRequest", typeOfRequest);
		   
		    if(typeOfRequest.equals("Next Batch Required") || typeOfRequest.equals("Retainer") || typeOfRequest.equals("Repeat")) {
		    	 RequestDispatcher rd = request.getRequestDispatcher("DigiplanPhotoGrid.jsp");
				 rd.forward((ServletRequest)request, (ServletResponse)response);
		    }else  if(typeOfRequest.equals("Mid Scan")){
		    	 RequestDispatcher rd = request.getRequestDispatcher("DigiplanPhotoGrid.jsp");
				 rd.forward((ServletRequest)request, (ServletResponse)response);	
		    }
	}	
}