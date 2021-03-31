

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class marksadd extends HttpServlet {

 
     Connection con;
        ResultSet rs;
       
 
     
      @Override
        public void init(){
          ServletConfig config = getServletConfig();
          String driverClassName = config.getInitParameter("driverclassname");
          String dbURL = config.getInitParameter("dburl");
          String username = config.getInitParameter("username");
          String dbpassword = config.getInitParameter("dbpassword");
         
         try{          
               Class.forName(driverClassName);
         
              con = DriverManager.getConnection(dbURL, username, dbpassword);
             } catch (ClassNotFoundException ex) { 
               Logger.getLogger(insert.class.getName()).log(Level.SEVERE, null, ex);
           } catch (SQLException ex) {
               Logger.getLogger(insert.class.getName()).log(Level.SEVERE, null, ex);
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
            out.println("<title>Servlet marksadd</title>");            
            out.println("</head>");
            out.println("<body>");
            
            int roll = Integer.parseInt(request.getParameter("rn"));
            
            int m1 = Integer.parseInt(request.getParameter("marks1"));
            int m2 = Integer.parseInt(request.getParameter("marks2"));
            int m3 = Integer.parseInt(request.getParameter("marks3"));
            int m4 = Integer.parseInt(request.getParameter("marks4"));
            int m5 = Integer.parseInt(request.getParameter("marks5"));
                    
            try{
                 
                String q = "insert into marks values(?,?,?,?,?,?)" ;
                PreparedStatement p = con.prepareStatement(q);
                
                p.setInt(1,roll);
                p.setInt(2,m1);
                p.setInt(3,m2);
                p.setInt(4,m3);
                p.setInt(5,m4);
                p.setInt(6,m5);     
                
               p.executeUpdate();
               
               response.sendRedirect("main.jsp");
               
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
