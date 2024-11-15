
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.vo.PendingVO;
import com.vo.ViewVO;
import com.workflow.connection.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Profile extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(Profile.class);

  public Profile() {
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String n = request.getParameter("username");
    String nprofile = request.getParameter("profile");
    request.setAttribute("username", n);
    new ArrayList();
    String sDecision = "";
    if (request.getParameter("createButton") != null) {
      RequestDispatcher rd = request.getRequestDispatcher("Create.jsp");
      rd.forward(request, response);
    }

    RequestDispatcher rd;
    List pendingVO;
    if (request.getParameter("viewButton") != null) {
      try {
        pendingVO = LoginDAO.getCase(n);
        request.setAttribute("viewVOList", pendingVO);
        if (pendingVO.size() == 0) {
          out.println("No pending Case IDs found!");
        }

        rd = request.getRequestDispatcher("View.jsp");
        rd.include(request, response);
      } catch (ClassNotFoundException var24) {
        LOGGER.info("Error At AddComment=" + var24.getMessage());
      } catch (SQLException var25) {
        LOGGER.info("Error At AddComment=" + var25.getMessage());
      }
    }

    List stageList;
    if (request.getParameter("pendingButton") != null) {
      try {
        HttpSession session = request.getSession();
        String profile = (String) session.getAttribute("profile");
        stageList = LoginDAO.getCaseID(n, profile);
        request.setAttribute("pendingVOList", stageList);
        RequestDispatcher rd1 = request.getRequestDispatcher("Pending.jsp");
        rd1.forward(request, response);
      } catch (ClassNotFoundException var22) {
        LOGGER.info("Error At AddComment=" + var22.getMessage());
      } catch (SQLException var23) {
        LOGGER.info("Error At AddComment=" + var23.getMessage());
      }
    }

    if (request.getParameter("apendingButton") != null) {
      try {
        pendingVO = LoginDAO.getCaseIDapproved(n);
        request.setAttribute("pendingVOList", pendingVO);
        rd = request.getRequestDispatcher("APending.jsp");
        rd.forward(request, response);
      } catch (ClassNotFoundException var20) {
        LOGGER.info("Error At AddComment=" + var20.getMessage());
      } catch (SQLException var21) {
        LOGGER.info("Error At AddComment=" + var21.getMessage());
      }
    }

    if (request.getParameter("SearchButton") != null) {
      try {
        String caseId = request.getParameter("caseid");
        List<ViewVO> viewVO = LoginDAO.searchCase(caseId);
        new ArrayList();
        HttpSession session = request.getSession();
        String profile = (String) session.getAttribute("profile");
        stageList = LoginDAO.stageList(profile);
        String nxtstage = "";
        List<PendingVO> pendingVOList = new ArrayList();
        List<ViewVO> ViewVOList = new ArrayList();

        for (int i = 0; i < viewVO.size(); ++i) {
          nxtstage = ((ViewVO) viewVO.get(i)).getNext_stage();
          if (stageList.contains(nxtstage.toLowerCase())) {
            PendingVO pendingVO1 = new PendingVO();
            pendingVO1.setCaseid(((ViewVO) viewVO.get(i)).getCaseid());
            pendingVO1.setUserid(((ViewVO) viewVO.get(i)).getUserid());
            pendingVO1.setDecision(((ViewVO) viewVO.get(i)).getDecision());
            pendingVO1.setStatus(((ViewVO) viewVO.get(i)).getStatus());
            pendingVO1.setStage(((ViewVO) viewVO.get(i)).getStage());
            pendingVO1.setNext_stage(((ViewVO) viewVO.get(i)).getNext_stage());
            pendingVO1.setCraeted(((ViewVO) viewVO.get(i)).getCraeted());
            pendingVO1.setInitDate(((ViewVO) viewVO.get(i)).getInitDate());
            pendingVO1.setInituserid(((ViewVO) viewVO.get(i)).getInituserid());
            pendingVOList.add(pendingVO1);
          } else {
            ViewVO viewVO1 = new ViewVO();
            viewVO1.setCaseid(((ViewVO) viewVO.get(i)).getCaseid());
            viewVO1.setUserid(((ViewVO) viewVO.get(i)).getUserid());
            viewVO1.setDecision(((ViewVO) viewVO.get(i)).getDecision());
            viewVO1.setStatus(((ViewVO) viewVO.get(i)).getStatus());
            viewVO1.setStage(((ViewVO) viewVO.get(i)).getStage());
            viewVO1.setNext_stage(((ViewVO) viewVO.get(i)).getNext_stage());
            viewVO1.setCraeted(((ViewVO) viewVO.get(i)).getCraeted());
            viewVO1.setInitDate(((ViewVO) viewVO.get(i)).getInitDate());
            viewVO1.setInituserid(((ViewVO) viewVO.get(i)).getInituserid());
            ViewVOList.add(viewVO1);
          }
        }

        request.setAttribute("pendingVOList", pendingVOList);
        request.setAttribute("viewVOList", ViewVOList);
        RequestDispatcher rd1 = request.getRequestDispatcher("SearchDisplay.jsp");
        rd1.forward(request, response);
      } catch (ClassNotFoundException var26) {
        LOGGER.info("Error At AddComment=" + var26.getMessage());
      } catch (SQLException var27) {
        LOGGER.info("Error At AddComment=" + var27.getMessage());
      }
    }

    if (request.getParameter("UploadButton") != null) {
      try {
        pendingVO = LoginDAO.getCaseIDupload(n);
        request.setAttribute("pendingVOList", pendingVO);
        rd = request.getRequestDispatcher("Upload.jsp");
        rd.forward(request, response);
      } catch (Exception var19) {
        LOGGER.info("Error At AddComment=" + var19.getMessage());
      }
    }

    if (request.getParameter("DownloadButton") != null) {
      try {
        pendingVO = LoginDAO.getCaseIDDownload(n);
        request.setAttribute("pendingVOList", pendingVO);
        rd = request.getRequestDispatcher("Download.jsp");
        rd.forward(request, response);
      } catch (Exception var18) {
        var18.printStackTrace();
      }
    }

  }
}
