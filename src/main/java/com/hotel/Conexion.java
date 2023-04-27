
package com.hotel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    
    private Connection conexion;
    private final String URL = "jdbc:h2:../src/main/resources/database/hotelreservas"; // URL de la base de datos

    public Conexion() {
        try {
            Class.forName("org.h2.Driver"); // Carga el driver de H2
            conexion = DriverManager.getConnection(URL, "sa", ""); // Establece la conexión
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public Connection getConexion() throws SQLException {
        if (conexion == null || conexion.isClosed()) {
            // Aquí se establece la conexión a la base de datos
            conexion = DriverManager.getConnection(URL, "sa", "");
        }
        return conexion;
    }

    public void cerrarConexion() {
        try {
            conexion.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
