-- crear la base de datos
CREATE DATABASE IF NOT EXISTS inmobiliaria
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_general_ci;

-- usar la base de datos
USE inmobiliaria;

-- Oficinas
CREATE TABLE oficinas (
    id_oficina INT AUTO_INCREMENT PRIMARY KEY,
    calle VARCHAR(50) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    fax VARCHAR(20)
);

--Empleados (relacion con oficina, oficina-empleado 1:N)
CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_oficina INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(120) NOT NULL,
    telefono VARCHAR(20),
    dni VARCHAR(20) UNIQUE NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    puesto VARCHAR(50) NOT NULL,
    salario_anual DECIMAL(12,2) NOT NULL CHECK (salario_anual > 0),
    fecha_ingreso DATE NOT NULL,
    CONSTRAINT fk_empleados_oficinas FOREIGN KEY (fk_id_oficina)
        REFERENCES oficinas(id_oficina)
);

--Propietarios (supertipo)
CREATE TABLE propietarios (
    id_propietario INT AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(120) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

-- Particulares (subtipo de propietarios 1:1)
CREATE TABLE particulares (
    fk_id_propietario INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    CONSTRAINT fk_particulares_propietarios FOREIGN KEY (fk_id_propietario)
        REFERENCES propietarios(id_propietario)
);

--Empresas (subtipo de propietarios 1:1)
CREATE TABLE empresas (
    fk_id_propietario INT PRIMARY KEY,
    nombre_comercial VARCHAR(50) NOT NULL,
    tipo_empresa VARCHAR(50),
    contacto VARCHAR(50) NOT NULL,
    CONSTRAINT fk_empresas_propietarios FOREIGN KEY (fk_id_propietario)
        REFERENCES propietarios(id_propietario)
);

--Inmuebles (relacion con propietario, propietario-inmuebles 1:N)
--          (relacion con empleado responsable, empleado-inmuebles 1:N)
CREATE TABLE inmuebles (
    id_inmueble INT AUTO_INCREMENT PRIMARY KEY,
    calle VARCHAR(50) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    tipo_inmueble VARCHAR(50) NOT NULL,
    numero_habitaciones INT NOT NULL CHECK (numero_habitaciones > 0),
    precio_mensual DECIMAL(10,2) NOT NULL CHECK (precio_mensual > 0),
    fk_id_propietario INT NOT NULL,
    fk_id_empleado_responsable INT,
    CONSTRAINT fk_inmuebles_propietarios FOREIGN KEY (fk_id_propietario)
        REFERENCES propietarios(id_propietario),
    CONSTRAINT fk_inmuebles_empleados FOREIGN KEY (fk_id_empleado_responsable)
        REFERENCES empleados(id_empleado)
);

--Inquilinos (relacion con empleado responsable, empleado-inquilinos 1:N)
CREATE TABLE inquilinos (
    id_inquilino INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(120) NOT NULL,
    telefono VARCHAR(20),
    tipo_inmueble_preferido VARCHAR(50) NOT NULL,
    importe_maximo_mensual DECIMAL(10,2) NOT NULL,
    fecha DATE NOT NULL,
    comentarios TEXT,
    fk_id_empleado_asignado INT NOT NULL,
    CONSTRAINT fk_inquilinos_empleados FOREIGN KEY (fk_id_empleado_asignado)
        REFERENCES empleados(id_empleado)
);

--Periodicos
CREATE TABLE periodicos (
    id_periodico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(120) NOT NULL,
    telefono VARCHAR(20),
    fax VARCHAR(20),
    contacto VARCHAR(50) NOT NULL
);

--Anuncios (relaciona inmuebles y periodicos)
CREATE TABLE anuncios (
    id_anuncio INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_inmueble INT NOT NULL,
    fk_id_periodico INT NOT NULL,
    fecha_publicacion DATE NOT NULL,
    coste_economico DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_anuncios_inmuebles FOREIGN KEY (fk_id_inmueble)
        REFERENCES inmuebles(id_inmueble),
    CONSTRAINT fk_anuncios_periodicos FOREIGN KEY (fk_id_periodico)
        REFERENCES periodicos(id_periodico)
);

--Visitas (relaciona inquilinos y inmuebles)
CREATE TABLE visitas (
    id_visita INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_inmueble INT NOT NULL,
    fk_id_inquilino INT NOT NULL,
    fecha DATE NOT NULL,
    comentarios TEXT,
    CONSTRAINT fk_visitas_inmuebles FOREIGN KEY (fk_id_inmueble)
        REFERENCES inmuebles(id_inmueble),
    CONSTRAINT fk_visitas_inquilinos FOREIGN KEY (fk_id_inquilino)
        REFERENCES inquilinos(id_inquilino)
);

--Inspecciones (relaciona empleados y inmuebles)
CREATE TABLE inspecciones (
    id_inspeccion INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_empleado INT NOT NULL,
    fk_id_inmueble INT NOT NULL,
    fecha DATE NOT NULL,
    comentarios TEXT,
    CONSTRAINT fk_inspecciones_empleados FOREIGN KEY (fk_id_empleado)
        REFERENCES empleados(id_empleado),
    CONSTRAINT fk_inspecciones_inmuebles FOREIGN KEY (fk_id_inmueble)
        REFERENCES inmuebles(id_inmueble)
);

--Contratos (une inquilino, inmueble y miembro de la plantilla que lo gestiona)
CREATE TABLE contratos (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_inmueble INT NOT NULL,
    fk_id_inquilino INT NOT NULL,
    fk_id_empleado INT NOT NULL,
    importe_mensual DECIMAL(10,2) NOT NULL CHECK (importe_mensual > 0),
    metodo_pago VARCHAR(50) NOT NULL,
    importe_deposito DECIMAL(10,2) NOT NULL CHECK (importe_deposito >= 0),
    deposito_realizado BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_inicio DATE NOT NULL,
    fecha_finalizacion DATE NOT NULL,
    duracion_meses INT NOT NULL CHECK (duracion_meses BETWEEN 3 AND 12),
    CONSTRAINT fk_contratos_inmuebles FOREIGN KEY (fk_id_inmueble)
        REFERENCES inmuebles(id_inmueble),
    CONSTRAINT fk_contratos_inquilinos FOREIGN KEY (fk_id_inquilino)
        REFERENCES inquilinos(id_inquilino),
    CONSTRAINT fk_contratos_empleados FOREIGN KEY (fk_id_empleado)
        REFERENCES empleados(id_empleado)
);

--Parientes (1:1 con empleado)
CREATE TABLE parientes (
    id_pariente INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_empleado INT UNIQUE NOT NULL,
    nombre VARCHAR(50),
    relacion VARCHAR(20),
    direccion VARCHAR(120),
    telefono VARCHAR(20),
    CONSTRAINT fk_parientes_empleados FOREIGN KEY (fk_id_empleado)
        REFERENCES empleados(id_empleado)
);

--Especializaciones de empleados (subtipos de empleados 1:1)
CREATE TABLE directores (
    fk_id_empleado INT PRIMARY KEY,
    fk_id_oficina INT UNIQUE NOT NULL,
    fecha_inicio_cargo DATE NOT NULL,
    pago_anual_vehiculo DECIMAL(12,2) NOT NULL,
    bonificacion_mensual DECIMAL(12,2),
    CONSTRAINT fk_directores_empleados FOREIGN KEY (fk_id_empleado)
        REFERENCES empleados(id_empleado),
    CONSTRAINT fk_directores_oficinas FOREIGN KEY (fk_id_oficina)
        REFERENCES oficinas(id_oficina)
);

CREATE TABLE administrativos (
    fk_id_empleado INT PRIMARY KEY,
    velocidad_escritura INT NOT NULL,
    CONSTRAINT fk_administrativos_empleados FOREIGN KEY (fk_id_empleado)
        REFERENCES empleados(id_empleado)
);

CREATE TABLE supervisores (
    fk_id_empleado INT PRIMARY KEY,
    CONSTRAINT fk_supervisores_empleados FOREIGN KEY (fk_id_empleado)
        REFERENCES empleados(id_empleado)
);
