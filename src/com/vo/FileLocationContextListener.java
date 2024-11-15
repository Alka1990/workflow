// Source code is decompiled from a .class file using FernFlower decompiler.
package com.vo;

import java.io.File;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class FileLocationContextListener implements ServletContextListener {
  static final Logger logger = LogManager.getLogger("consoleLogger");
  static final Logger loggerErr = LogManager.getLogger("errorLogger");

  public FileLocationContextListener() {
  }

  public void contextInitialized(ServletContextEvent servletContextEvent) {
    try {
      String rootPath = "D://";
      logger.debug("rootpath in FileLocationContextListener:" + rootPath);
      ServletContext ctx = servletContextEvent.getServletContext();
      File file = new File(rootPath);
      if (!file.exists()) {
        file.mkdirs();
      }

      ctx.setAttribute("FILES_DIR", rootPath);
    } catch (Exception var5) {
      loggerErr.error("Exception in FileLocationContextListener: ", var5);
    }

  }

  public void contextDestroyed(ServletContextEvent servletContextEvent) {
  }
}
