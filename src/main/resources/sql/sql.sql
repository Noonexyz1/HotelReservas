CREATE TABLE habitacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255),
    capacidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    disponible BOOLEAN NOT NULL,
    fecha_ultima_mantenimiento DATE,
    observaciones VARCHAR(255)
);


CREATE TABLE reserva (
   id INT AUTO_INCREMENT PRIMARY KEY,
   fecha_inicio DATE NOT NULL,
   fecha_fin DATE NOT NULL,
   id_habitacion INT NOT NULL,
   id_huesped INT NOT NULL,
   precio DECIMAL(10, 2) NOT NULL,
   CONSTRAINT fk_habitacion
      FOREIGN KEY (id_habitacion)
      REFERENCES habitacion(id),
   CONSTRAINT fk_huesped
      FOREIGN KEY (id_huesped)
      REFERENCES huesped(id)
);


CREATE TABLE huesped (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellidos VARCHAR(50) NOT NULL,
  correo_electronico VARCHAR(50),
  telefono VARCHAR(20),
  fecha_nacimiento DATE,
  nacionalidad VARCHAR(50),
  direccion VARCHAR(100),
  ciudad VARCHAR(50),
  pais VARCHAR(50),
  codigo_postal VARCHAR(10),
  tipo_documento VARCHAR(20),
  numero_documento VARCHAR(20),
  fecha_llegada DATE,
  fecha_salida DATE,
  habitacion_id INT,
  FOREIGN KEY (habitacion_id) REFERENCES habitaciones(id)
);


CREATE TABLE usuario (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  correo VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(100) NOT NULL,
  fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ultima_conexion TIMESTAMP,
  activo BOOLEAN NOT NULL DEFAULT true,
  rol VARCHAR(20) NOT NULL
);



CREATE TABLE tarifa (
  id INT PRIMARY KEY AUTO_INCREMENT,
  tipo VARCHAR(50) NOT NULL,
  precio DOUBLE NOT NULL,
  descripcion VARCHAR(255),
  fecha_inicio DATE,
  fecha_fin DATE
);


CREATE TABLE servicio (
  id_servicio INT PRIMARY KEY,
  nombre_servicio VARCHAR(50) NOT NULL,
  precio_servicio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE comentario (
  id_comentario INT PRIMARY KEY,
  id_huesped INT NOT NULL,
  id_habitacion INT NOT NULL,
  comentario TEXT NOT NULL,
  fecha_comentario DATE NOT NULL,
  FOREIGN KEY (id_huesped) REFERENCES huesped(id_huesped),
  FOREIGN KEY (id_habitacion) REFERENCES habitacion(id_habitacion)
);


CREATE TABLE Pago (
  id INT PRIMARY KEY AUTO_INCREMENT,
  fecha DATE NOT NULL,
  monto DECIMAL(10,2) NOT NULL,
  tipo_pago VARCHAR(50) NOT NULL,
  reserva_id INT NOT NULL,
  FOREIGN KEY (reserva_id) REFERENCES Reserva(id)
);



INSERT INTO habitacion (numero, tipo, capacidad, precio) 
VALUES (101, 'Individual', 1, 50.00), 
       (102, 'Doble', 2, 80.00), 
       (103, 'Suite', 4, 150.00);




