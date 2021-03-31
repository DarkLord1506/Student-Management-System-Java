

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
import java.sql.*;
import javax.servlet.RequestDispatcher;

public class insert extends HttpServlet {

        Connection con;
        ResultSet rs;
       
 
     
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
            out.println("<title>Servlet insert</title>");            
            out.println("</head>");
            out.println("<body>");
            try{
                String name=request.getParameter("name");
                int rollno=Integer.parseInt(request.getParameter("rno"));
                String fname=request.getParameter("fname");
                String mname=request.getParameter("mname");
                int age=Integer.parseInt(request.getParameter("age"));
                String address=request.getParameter("address");
                Date dob=Date.valueOf(request.getParameter("dob"));
                String pass = request.getParameter("pword");
                
                String q="insert into students values(?,?,?,?,?,?,?)";
                String q1="insert into login1 values(?,?)";
                PreparedStatement p1 = con.prepareStatement(q1);
                PreparedStatement p=con.prepareStatement(q);
                
                p1.setInt(1, rollno);
                p1.setString(2, pass);
                
                p.setString(1,name);
                p.setInt(2, rollno);
                p.setString(3,fname);
                p.setString(4,mname);
                p.setInt(5,age);
                p.setString(6,address);
                p.setDate(7,dob);
                
                p.executeUpdate();
                p1.executeUpdate();
                
               
                     
            } catch (SQLException ex) {
                Logger.getLogger(insert.class.getName()).log(Level.SEVERE, null, ex);
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
