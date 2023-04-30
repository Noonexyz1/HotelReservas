CREATE TABLE empleado (
  id_empleado INT AUTO_INCREMENT PRIMARY KEY,

  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  telefono VARCHAR(20),
  email VARCHAR(100),
  direccion VARCHAR(100),
  puesto VARCHAR(50) NOT NULL,
  fecha_contratacion DATE NOT NULL,
  salario DECIMAL(10, 2) NOT NULL

);


CREATE TABLE habitacion (
    id_habitacion INT AUTO_INCREMENT PRIMARY KEY,

    fk_tarifa INT,
    fk_servicio INT,


    numero INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255),
    capacidad INT NOT NULL,
    disponible BOOLEAN NOT NULL,
    fecha_ultima_mantenimiento DATE,
    observaciones VARCHAR(255),


    FOREIGN KEY (fk_tarifa) REFERENCES tarifa(id_tarifa),
    FOREIGN KEY (fk_servicio) REFERENCES servicio(id_servicio)

);


CREATE TABLE empleado_huesped (
    id_emp_hues INT AUTO_INCREMENT PRIMARY KEY,

    fk_empleado INT,
    fk_huesped INT,

    
    fecha_atencion DATE,
    fecha_llegada DATE,
    fecha_salida DATE,

    FOREIGN KEY (fk_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (fk_huesped) REFERENCES huesped(id_huesped)

);

CREATE TABLE huesped (
  id_huesped INT AUTO_INCREMENT PRIMARY KEY,

  nombre VARCHAR(50) NOT NULL,
  apellidos VARCHAR(50) NOT NULL,
  correo_electronico VARCHAR(50),
  
  nacionalidad VARCHAR(50),
  direccion VARCHAR(100),
  ciudad VARCHAR(50),
  pais VARCHAR(50),
  codigo_postal VARCHAR(10)

);





CREATE TABLE reserva (
   id_reserva INT AUTO_INCREMENT PRIMARY KEY,

    fk_huesped INT,
    fk_comentario INT,
    fk_habitacion INT,
    fk_pago INT,

    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,

    FOREIGN KEY (fk_huesped) REFERENCES huesped(id_habitacion),
    FOREIGN KEY (fk_comentario) REFERENCES comentario(id_comentario),
    FOREIGN KEY (fk_habitacion) REFERENCES habitacion(id_habitacion),
    FOREIGN KEY (fk_pago) REFERENCES pago(id_pago)

);



CREATE TABLE tarifa (
  id_tarifa INT PRIMARY KEY AUTO_INCREMENT,
  tipo VARCHAR(50) NOT NULL,
  precio DOUBLE NOT NULL,
  descripcion VARCHAR(255)
);


CREATE TABLE servicio (
  id_servicio INT PRIMARY KEY,
  nombre_servicio VARCHAR(50) NOT NULL,
  precio_servicio DECIMAL(10, 2) NOT NULL

);

CREATE TABLE comentario (
  id_comentario INT PRIMARY KEY,
  comentario TEXT NOT NULL,
  fecha_comentario DATE NOT NULL
);


CREATE TABLE Pago (
  id_pago INT PRIMARY KEY AUTO_INCREMENT,
  fecha DATE NOT NULL,
  monto DECIMAL(10,2) NOT NULL,
  tipo_pago VARCHAR(50) NOT NULL

);



INSERT INTO habitacion (numero, tipo, capacidad, precio) 
VALUES (101, 'Individual', 1, 50.00), 
       (102, 'Doble', 2, 80.00), 
       (103, 'Suite', 4, 150.00);




