

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class login extends HttpServlet {

        Connection dbconnection;
        ResultSet resultset;
       
 
     
        public void init(){
          ServletConfig config = getServletConfig();
          String driverClassName = config.getInitParameter("driverclassname");
          String dbURL = config.getInitParameter("dburl");
          String username = config.getInitParameter("username");
          String dbpassword = config.getInitParameter("dbpassword");
         
         try{          
               Class.forName(driverClassName);
               dbconnection = DriverManager.getConnection(dbURL, username, dbpassword);
             } catch (ClassNotFoundException ex) { 
               Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
           } catch (SQLException ex) {
               Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
           } 
        }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet login</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String u=request.getParameter("uname");
            String p=request.getParameter("pass");
            
            HttpSession session=request.getSession();
            session.setAttribute("uname",u);
            
            try{
                String q="select * from login where username='"+u+"' and password='"+p+"'";
                Statement stmt=dbconnection.createStatement();
                resultset=stmt.executeQuery(q);
                
                if(resultset.next()){
                     RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
                    rd.forward(request, response);
                }
                else{
                    
                    out.println("<div id=\"div3\" >Incorrect Username or Password!!!</div>");
                   
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.include(request, response);
                    
                }
            } catch (SQLException ex) {
                Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
