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
        
        
        /*
        La primera vez que ejecutamos la aplicacion con el servidor detenido
        hace la connecion pero...
        la segunda vez, me indica que la base de datos ya sido creada y me 
        brinca un error seguido de una pantalla blanca.

        Eso es porque al iniciar conexión con la base de datos, no lo estoy
        cerrando, por ello, me brinca el error que ya tengo una base de datos.

        El objeto que me devuelve de la base de datos me viene
        como PUBLIC
        
        La ruta de la conexion con la base de datos es la misma ruta que del String de la 
        clase de Conexion.
        En mi proyecto ya tengo la bse de datos creada con una tabla, asi que me va a mostrar
        la misma tabla en teoria.
        */
        
        //Intentemos crea el modelo que tenia en entidad relacion
        //intentare subir con la nueva tabla creada github LA TABLA AUN QUEDA AHI
        //Cuando se esta ejecutando el h2, git no puede sobre-escribir por falta de permisos
            //es como cuando eliminas un archivo pero que no puede hacerlo por tener un
            //programa abierto
        
    }

}
