
-- Tabla de coordenadas en mapa
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS ubicacion;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE ubicacion (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    latitud varchar(100) NOT NULL,
    longitud varchar(100) DEFAULT NULL

) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Tabla para Almacenar Domicilios de todo el sistema
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS direccion;
SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE direccion (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    calle varchar(20) NOT NULL,
    no_interior varchar(20) NOT NULL,
    no_exterior varchar(20) NOT NULL,
    colonia varchar(300) DEFAULT NULL,
    delegacion varchar(20) NOT NULL,
    estado varchar(20) NOT NULL,
    cp varchar(30) DEFAULT NULL

) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Tabla de vendedores
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS vendedor;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE vendedor (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(100) NOT NULL,
    primer_apellido varchar(100) NOT NULL,
    segundo_apellido varchar(100) DEFAULT NULL,

    direccion_id int NOT NULL,
    CONSTRAINT vendedor_direccion FOREIGN KEY (direccion_id) REFERENCES direccion(id) ON DELETE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Clientes: Emula el ERP de la EMPRESA...
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS cliente;
SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE cliente (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(100) NOT NULL,
    primer_apellido varchar(100) NOT NULL,
    segundo_apellido varchar(100) DEFAULT NULL,
    telefono_fijo varchar(20) NOT NULL,
    telefono_movil varchar(20) NOT NULL,
    empresa varchar(30) DEFAULT NULL,

    direccion_id int NOT NULL,
    CONSTRAINT cliente_direccion FOREIGN KEY (direccion_id) REFERENCES direccion(id) ON DELETE CASCADE

    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- Espectaculares
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS espectacular;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE espectacular (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

    ubicacion_id int NOT NULL,
    CONSTRAINT espectacular_ubicacion FOREIGN KEY (ubicacion_id) REFERENCES ubicacion(id) ON DELETE CASCADE,

    tipo varchar(100) DEFAULT NULL,
    importancia ENUM('VIP', 'VIA PRIMARIA', 'VIA SECUNDARIA') DEFAULT 'VIA PRIMARIA',
    estado ENUM('DISPONIBLE', 'RENTADO') DEFAULT 'DISPONIBLE',
    tamanio varchar(100) DEFAULT NULL,
    costo_renta decimal(10,2) DEFAULT 0.0,
    fecha_inicial date DEFAULT NULL,
    fecha_final date DEFAULT NULL,

    cliente_id INT NOT NULL,
    CONSTRAINT espectacular_clientes FOREIGN KEY (cliente_id) REFERENCES cliente(id) ON DELETE CASCADE,

    vendedor_id INT NOT NULL,
    CONSTRAINT espectacular_vendedor FOREIGN KEY (vendedor_id) REFERENCES vendedor(id) ON DELETE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=latin1;


