
// Source code is decompiled from a .class file using FernFlower decompiler.
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class CaseMstr extends HttpServlet {
  static final Logger LOGGER = LogManager.getLogger(CaseMstr.class);
  private static final long serialVersionUID = 8182213487409679104L;

  public CaseMstr() {
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  }

  private static Date getCurrentDate() {
    Date today = new Date();
    return new Date(today.getTime());
  }

  public synchronized JsonArray convertResponseInJsonArray(List dataList) throws Exception {
    String METHOD_NAME = "convertResponseInJsonArray";
    Gson gson = null;
    JsonElement element = null;
    JsonArray jsonArray = new JsonArray();

    try {
      if (dataList != null && !dataList.isEmpty()) {
        gson = new Gson();
        element = gson.toJsonTree(dataList, ArrayList.class);
        jsonArray = element.getAsJsonArray();
      }
    } catch (Exception var7) {
      LOGGER.info("Error At AddComment=" + var7.getMessage());
    }

    return jsonArray;
  }
}
