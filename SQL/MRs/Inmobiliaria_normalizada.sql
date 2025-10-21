-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS inmobiliaria
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_general_ci;

-- Usar la base de datos
USE inmobiliaria;

-- Puestos (normaliza empleados.puesto)
CREATE TABLE puestos (
    id_puesto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_puesto VARCHAR(50) UNIQUE NOT NULL
);

-- Tipos de Inmuebles (normaliza inmueble.tipo_inmueble)
CREATE TABLE tipos_inmuebles (
    id_tipo_inmueble INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo VARCHAR(50) UNIQUE NOT NULL
);

-- Relaciones de Parientes (normaliza parientes.relacion)
CREATE TABLE relaciones_parientes (
    id_relacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre_relacion VARCHAR(30) UNIQUE NOT NULL
);

-- Ciudades (normaliza oficina.ciudad e imbueble.ciudad)
CREATE TABLE ciudades (
    id_ciudad INT AUTO_INCREMENT PRIMARY KEY,
    nombre_ciudad VARCHAR(50) UNIQUE NOT NULL
);

-- Metodos de Pago (normaliza contratos.metodo_pago)
CREATE TABLE metodos_pago (
    id_metodo_pago INT AUTO_INCREMENT PRIMARY KEY,
    nombre_metodo VARCHAR(50) UNIQUE NOT NULL
);

-- Oficinas
CREATE TABLE oficinas (
    id_oficina INT AUTO_INCREMENT PRIMARY KEY,
    calle VARCHAR(50) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    fk_id_ciudad INT NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    fax VARCHAR(20),
    CONSTRAINT fk_oficinas_ciudades FOREIGN KEY (fk_id_ciudad)
        REFERENCES ciudades(id_ciudad)
);

-- Empleados
CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_oficina INT NOT NULL,
    fk_id_puesto INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(120) NOT NULL,
    telefono VARCHAR(20),
    dni VARCHAR(20) UNIQUE NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    salario_anual DECIMAL(12,2) NOT NULL CHECK (salario_anual > 0),
    fecha_ingreso DATE NOT NULL,
    CONSTRAINT fk_empleados_oficinas FOREIGN KEY (fk_id_oficina)
        REFERENCES oficinas(id_oficina),
    CONSTRAINT fk_empleados_puestos FOREIGN KEY (fk_id_puesto)
        REFERENCES puestos(id_puesto)
);

-- Propietarios (supertipo)
CREATE TABLE propietarios (
    id_propietario INT AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(120) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

-- Particulares (subtipo)
CREATE TABLE particulares (
    fk_id_propietario INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    CONSTRAINT fk_particulares_propietarios FOREIGN KEY (fk_id_propietario)
        REFERENCES propietarios(id_propietario)
);

-- Empresas (subtipo)
CREATE TABLE empresas (
    fk_id_propietario INT PRIMARY KEY,
    nombre_comercial VARCHAR(50) NOT NULL,
    tipo_empresa VARCHAR(50),
    contacto VARCHAR(50) NOT NULL,
    CONSTRAINT fk_empresas_propietarios FOREIGN KEY (fk_id_propietario)
        REFERENCES propietarios(id_propietario)
);

-- Inmuebles
CREATE TABLE inmuebles (
    id_inmueble INT AUTO_INCREMENT PRIMARY KEY,
    calle VARCHAR(50) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    fk_id_ciudad INT NOT NULL,
    fk_id_tipo_inmueble INT NOT NULL,
    numero_habitaciones INT NOT NULL CHECK (numero_habitaciones > 0),
    precio_mensual DECIMAL(10,2) NOT NULL CHECK (precio_mensual > 0),
    fk_id_propietario INT NOT NULL,
    fk_id_empleado_responsable INT,
    CONSTRAINT fk_inmuebles_propietarios FOREIGN KEY (fk_id_propietario)
        REFERENCES propietarios(id_propietario),
    CONSTRAINT fk_inmuebles_empleados FOREIGN KEY (fk_id_empleado_responsable)
        REFERENCES empleados(id_empleado),
    CONSTRAINT fk_inmuebles_tipos FOREIGN KEY (fk_id_tipo_inmueble)
        REFERENCES tipos_inmuebles(id_tipo_inmueble),
    CONSTRAINT fk_inmuebles_ciudades FOREIGN KEY (fk_id_ciudad)
        REFERENCES ciudades(id_ciudad)
);

-- Inquilinos
CREATE TABLE inquilinos (
    id_inquilino INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(120) NOT NULL,
    telefono VARCHAR(20),
    fk_id_tipo_inmueble_preferido INT NOT NULL,
    importe_maximo_mensual DECIMAL(10,2) NOT NULL,
    fecha DATE NOT NULL,
    comentarios TEXT,
    fk_id_empleado_asignado INT NOT NULL,
    CONSTRAINT fk_inquilinos_empleados FOREIGN KEY (fk_id_empleado_asignado)
        REFERENCES empleados(id_empleado),
    CONSTRAINT fk_inquilinos_tipo FOREIGN KEY (fk_id_tipo_inmueble_preferido)
        REFERENCES tipos_inmuebles(id_tipo_inmueble)
);

-- Periodicos
CREATE TABLE periodicos (
    id_periodico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(120) NOT NULL,
    telefono VARCHAR(20),
    fax VARCHAR(20),
    contacto VARCHAR(50) NOT NULL
);

-- Anuncios
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

-- Visitas
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

-- Inspecciones
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

-- Contratos
CREATE TABLE contratos (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_inmueble INT NOT NULL,
    fk_id_inquilino INT NOT NULL,
    fk_id_empleado INT NOT NULL,
    importe_mensual DECIMAL(10,2) NOT NULL CHECK (importe_mensual > 0),
    fk_id_metodo_pago INT NOT NULL,
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
        REFERENCES empleados(id_empleado),
    CONSTRAINT fk_contratos_metodos FOREIGN KEY (fk_id_metodo_pago)
        REFERENCES metodos_pago(id_metodo_pago)
);

-- Parientes
CREATE TABLE parientes (
    id_pariente INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_empleado INT UNIQUE NOT NULL,
    nombre VARCHAR(50),
    fk_id_relacion INT,
    direccion VARCHAR(120),
    telefono VARCHAR(20),
    CONSTRAINT fk_parientes_empleados FOREIGN KEY (fk_id_empleado)
        REFERENCES empleados(id_empleado),
    CONSTRAINT fk_parientes_relaciones FOREIGN KEY (fk_id_relacion)
        REFERENCES relaciones_parientes(id_relacion)
);

-- Especializaciones de empleados
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
