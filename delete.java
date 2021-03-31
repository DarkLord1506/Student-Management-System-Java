

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class delete extends HttpServlet {

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
            out.println("<title>Servlet delete</title>");            
            out.println("</head>");
            out.println("<body>");
            int roll = Integer.parseInt(request.getParameter("rno"));
            try{
                
               
                String q="delete from students where rollno="+roll;
                String q1="delete from marks where rollno="+roll;
                String q2="delete from subjects where rollno="+roll;
                String q3="delete from login1 where rollno="+roll;
                
                PreparedStatement p=con.prepareStatement(q);       
                PreparedStatement p1=con.prepareStatement(q1); 
                PreparedStatement p2=con.prepareStatement(q2); 
                PreparedStatement p3=con.prepareStatement(q3); 
                
                p.executeUpdate();
                p1.executeUpdate();
                p2.executeUpdate();
                p3.executeUpdate();

            
                     
            } catch (SQLException ex) {
                Logger.getLogger(update.class.getName()).log(Level.SEVERE, null, ex);
            }
             response.sendRedirect("main.jsp");
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
