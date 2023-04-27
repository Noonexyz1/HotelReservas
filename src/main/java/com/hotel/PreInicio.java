package com.hotel;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "PreInicio", urlPatterns = {"/"})
public class PreInicio extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        Conexion con = new Conexion();
      
        // Set response content type
        response.setContentType("text/html");

        // Actual logic goes here.
        PrintWriter out = response.getWriter();
        try {
            out.println("<h1>" + con.getConexion().getSchema().concat("asdfasdfasdf") + "</h1>");
            
            
            //redirigimos a la ventana de bienvenida
            //response.sendRedirect("bienvenida.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(PreInicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

}
