package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!--\n");
      out.write("  Licensed to the Apache Software Foundation (ASF) under one or more\n");
      out.write("  contributor license agreements.  See the NOTICE file distributed with\n");
      out.write("  this work for additional information regarding copyright ownership.\n");
      out.write("  The ASF licenses this file to You under the Apache License, Version 2.0\n");
      out.write("  (the \"License\"); you may not use this file except in compliance with\n");
      out.write("  the License.  You may obtain a copy of the License at\n");
      out.write("\n");
      out.write("      http://www.apache.org/licenses/LICENSE-2.0\n");
      out.write("\n");
      out.write("  Unless required by applicable law or agreed to in writing, software\n");
      out.write("  distributed under the License is distributed on an \"AS IS\" BASIS,\n");
      out.write("  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n");
      out.write("  See the License for the specific language governing permissions and\n");
      out.write("  limitations under the License.\n");
      out.write("-->\n");
      out.write("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\n");
      out.write("   \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("    <title>Apache Tomcat</title>\n");
      out.write("    <style type=\"text/css\">\n");
      out.write("    /*<![CDATA[*/\n");
      out.write("    body {\n");
      out.write("        color: #000;\n");
      out.write("        background-color: #fff;\n");
      out.write("        color: #333;\n");
      out.write("        font-family: Arial, \"Times New Roman\", Times, serif;\n");
      out.write("        margin: 0;\n");
      out.write("        padding: 10px;\n");
      out.write("        min-width: 700px;\n");
      out.write("    }\n");
      out.write("    img {\n");
      out.write("       border: none;\n");
      out.write("    }\n");
      out.write("    a:link, a:visited {\n");
      out.write("        color: blue;\n");
      out.write("    }\n");
      out.write("    code {\n");
      out.write("        display: block;\n");
      out.write("        font-size: 120%;\n");
      out.write("        color: #090;\n");
      out.write("        margin: 0.5em 0.5em 0;\n");
      out.write("    }\n");
      out.write("    h1, h2 {\n");
      out.write("        font-size: 110%;\n");
      out.write("        margin-top: 0;\n");
      out.write("    }\n");
      out.write("    p#footer {\n");
      out.write("        text-align: right;\n");
      out.write("        font-size: 80%;\n");
      out.write("    }\n");
      out.write("    div#header {\n");
      out.write("        min-width: 700px;\n");
      out.write("    }\n");
      out.write("    div#header h1 {\n");
      out.write("        margin: 0;\n");
      out.write("    }\n");
      out.write("    div.fl {\n");
      out.write("        float: left;\n");
      out.write("    }\n");
      out.write("    div.fr {\n");
      out.write("        float: right;\n");
      out.write("    }\n");
      out.write("    #content div.fl {\n");
      out.write("        width: 20%;\n");
      out.write("        margin-right: 2%;\n");
      out.write("    }\n");
      out.write("    div#main {\n");
      out.write("        float: left;\n");
      out.write("        width: 77%;\n");
      out.write("    }\n");
      out.write("    .clear {\n");
      out.write("        display: block;\n");
      out.write("        clear: both;\n");
      out.write("    }\n");
      out.write("    .panel {\n");
      out.write("        border: 2px solid #000;\n");
      out.write("        background-color: #FFDC75;\n");
      out.write("        padding: 0 0 20px;\n");
      out.write("        margin: 0 0 20px;\n");
      out.write("    }\n");
      out.write("    .panel h3 {\n");
      out.write("        border-bottom: 2px solid #000;\n");
      out.write("        background-color: #D2A41C;\n");
      out.write("        margin: 0 0 2px;\n");
      out.write("        padding: 4px 4px 2px;\n");
      out.write("        font: normal 110% Verdana, \"Times New Roman\", Times, serif;\n");
      out.write("        font-style: italic;\n");
      out.write("    }\n");
      out.write("    .panel p {\n");
      out.write("        margin: 0;\n");
      out.write("        padding: 2px 4px 0;\n");
      out.write("    }\n");
      out.write("    /*]]>*/\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<!-- Header -->\n");
      out.write("<div id=\"header\">\n");
      out.write("    <div class=\"fl\">\n");
      out.write("        <img src=\"tomcat.gif\" alt=\"The Mighty Tomcat - MEOW!\"/>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"fl\">\n");
      out.write("        <h1>Apache Tomcat ");
      out.print(request.getServletContext().getServerInfo() );
      out.write("</h1>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"fr\">\n");
      out.write("        <img src=\"asf-logo-wide.gif\" alt=\"The Apache Software Foundation\"/>\n");
      out.write("    </div>\n");
      out.write("    <span class=\"clear\"></span>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<div id=\"content\">\n");
      out.write("    <div class=\"fl\">\n");
      out.write("        <div class=\"panel\">\n");
      out.write("            <h3>Administration</h3>\n");
      out.write("            <p><a href=\"/manager/status\">Status</a></p>\n");
      out.write("            <p><a href=\"/manager/html\">Tomcat Manager</a></p>\n");
      out.write("            <p><a href=\"/host-manager/html\">Host Manager</a></p>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"panel\">\n");
      out.write("            <h3>Documentation</h3>\n");
      out.write("            <p><a href=\"RELEASE-NOTES.txt\">Release Notes</a></p>\n");
      out.write("            <p><a href=\"/docs/changelog.html\">Change Log</a></p>\n");
      out.write("            <p><a href=\"/docs\">Tomcat Documentation</a></p>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"panel\">\n");
      out.write("            <h3>Tomcat Online</h3>\n");
      out.write("            <p><a href=\"http://tomcat.apache.org/\">Home Page</a></p>\n");
      out.write("            <p><a href=\"http://tomcat.apache.org/faq/\">FAQ</a></p>\n");
      out.write("            <p><a href=\"http://tomcat.apache.org/bugreport.html\">Bug Database</a></p>\n");
      out.write("            <p><a href=\"http://issues.apache.org/bugzilla/buglist.cgi?bug_status=UNCONFIRMED&amp;bug_status=NEW&amp;bug_status=ASSIGNED&amp;bug_status=REOPENED&amp;bug_status=RESOLVED&amp;resolution=LATER&amp;resolution=REMIND&amp;resolution=---&amp;bugidtype=include&amp;product=Tomcat+7&amp;cmdtype=doit&amp;order=Importance\">Open Bugs</a></p>\n");
      out.write("            <p><a href=\"http://mail-archives.apache.org/mod_mbox/tomcat-users/\">Users Mailing List</a></p>\n");
      out.write("            <p><a href=\"http://mail-archives.apache.org/mod_mbox/tomcat-dev/\">Developers Mailing List</a></p>\n");
      out.write("            <p><a href=\"irc://irc.freenode.net/#tomcat\">IRC</a></p>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"panel\">\n");
      out.write("            <h3>Miscellaneous</h3>\n");
      out.write("            <p><a href=\"http://localhost:8080/examples/servlets/\">Servlets Examples</a></p>\n");
      out.write("            <p><a href=\"http://localhost:8080/examples/jsp/\">JSP Examples</a></p>\n");
      out.write("            <p><a href=\"http://java.sun.com/products/jsp\">Sun's Java Server Pages Site</a></p>\n");
      out.write("            <p><a href=\"http://java.sun.com/products/servlet\">Sun's Servlet Site</a></p>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <div id=\"main\">\n");
      out.write("        <h2>If you're seeing this page via a web browser, it means you've setup Tomcat successfully. Congratulations!</h2>\n");
      out.write("        <p>Now join the Tomcat Announce mailing list, which is a low volume mailing list for releases, security vulnerabilities and other project announcements.</p>\n");
      out.write("        <ul>\n");
      out.write("            <li><strong><a href=\"mailto:announce-subscribe@tomcat.apache.org\">announce-subscribe@tomcat.apache.org</a> for important announcements.</strong></li>\n");
      out.write("        </ul>\n");
      out.write("        <p>As you may have guessed by now, this is the default Tomcat home page. It can be found on the local filesystem at: \n");
      out.write("            <code>$CATALINA_HOME/webapps/ROOT/index.html</code></p>\n");
      out.write("        <p>where &quot;$CATALINA_HOME&quot; is the root of the Tomcat installation directory. If you're seeing this page, and you don't think you should be, then you're either a user who has arrived at new installation of Tomcat, or you're an administrator who hasn't got his/her setup quite right. Providing the latter is the case, please refer to the <a href=\"/docs\">Tomcat Documentation</a> for more detailed setup and administration information than is found in the INSTALL file.</p>\n");
      out.write("        <p><strong>NOTE: For security reasons, using the manager webapp is restricted to users with role \"manager-gui\".</strong>\n");
      out.write("            Users are defined in: <code>$CATALINA_HOME/conf/tomcat-users.xml</code></p>\n");
      out.write("        <p>Included with this release are a host of sample Servlets and JSPs (with associated source code), extensive documentation, and an introductory guide to developing web applications.</p>\n");
      out.write("        <p>Tomcat mailing lists are available at the Tomcat project web site:</p>\n");
      out.write("        <ul>\n");
      out.write("            <li><strong><a href=\"mailto:users@tomcat.apache.org\">users@tomcat.apache.org</a></strong> for general questions related to configuring and using Tomcat</li>\n");
      out.write("            <li><strong><a href=\"mailto:dev@tomcat.apache.org\">dev@tomcat.apache.org</a></strong> for developers working on Tomcat</li>\n");
      out.write("        </ul>\n");
      out.write("        <p>Thanks for using Tomcat!</p>\n");
      out.write("        <p id=\"footer\">\n");
      out.write("            <img src=\"tomcat-power.gif\" width=\"77\" height=\"80\" alt=\"Powered by Tomcat\"/><br/>\n");
      out.write("            &nbsp;\n");
      out.write("            Copyright &copy; 1999-2010 Apache Software Foundation<br/>\n");
      out.write("            All Rights Reserved\n");
      out.write("        </p>\n");
      out.write("    </div>\n");
      out.write("    <span class=\"clear\"></span>\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
