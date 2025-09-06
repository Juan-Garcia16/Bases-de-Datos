-- Tabla: Oficinas
CREATE TABLE Oficina (
    id_oficina SERIAL PRIMARY KEY,
    calle VARCHAR(100),
    numero VARCHAR(10),
    ciudad VARCHAR(50),
    telefono VARCHAR(20),
    fax VARCHAR(20)
);

-- Tabla base
CREATE TABLE Empleado (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    telefono VARCHAR(20),
    dni VARCHAR(20),
    fecha_nacimiento DATE,
    puesto VARCHAR(50),
    salario_anual NUMERIC(12,2),
    fecha_ingreso DATE
);

-- Tabla director (hereda de empleados)
CREATE TABLE Director (
    id_empleado INT PRIMARY KEY REFERENCES empleados(id_empleado),
    fecha_inicio_cargo DATE,
    pago_anual_vehiculo NUMERIC(12,2),
    bonificacion_mensual NUMERIC(12,2)
);

-- Tabla supervisor (hereda de empleados)
CREATE TABLE Supervisor (
    id_empleado INT PRIMARY KEY REFERENCES empleados(id_empleado)
    -- Aquí podrías poner atributos exclusivos de supervisor si los hubiera
);

-- Tabla administrativo (hereda de empleados)
CREATE TABLE Administrativo (
    id_empleado INT PRIMARY KEY REFERENCES empleados(id_empleado),
    velocidad_escritura INT
);

-- Tabla: Parientes
CREATE TABLE Pariente (
    id_pariente SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    relacion VARCHAR(50),
    direccion VARCHAR(150),
    telefono VARCHAR(20)
);

-- Tabla: Inmuebles
CREATE TABLE Inmueble (
    id_inmueble SERIAL PRIMARY KEY,
    calle VARCHAR(100),
    numero VARCHAR(10),
    ciudad VARCHAR(50),
    tipo_inmueble VARCHAR(50),
    numero_habitaciones INT,
    precio_mensual NUMERIC(10,2)
);

-- Tabla base: Propietarios
CREATE TABLE Propietario (
    id_propietario SERIAL PRIMARY KEY,
    direccion VARCHAR(150),
    telefono VARCHAR(20)
);

-- Subtipo: Particular (hereda de propietario)
CREATE TABLE Particular (
    id_propietario INT PRIMARY KEY REFERENCES propietarios(id_propietario),
    nombre VARCHAR(100) NOT NULL
);

-- Subtipo: Empresa (hereda de propietario)
CREATE TABLE Empresa (
    id_propietario INT PRIMARY KEY REFERENCES propietarios(id_propietario),
    nombre_comercial VARCHAR(100) NOT NULL,
    tipo_empresa VARCHAR(50),
    contacto VARCHAR(100)
);


-- Tabla: Inquilinos (clientes)
CREATE TABLE Inquilino (
    id_inquilino SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    telefono VARCHAR(20),
    tipo_inmueble_preferido VARCHAR(50),
    importe_maximo_mensual NUMERIC(10,2)
);

-- Tabla: Visitas
CREATE TABLE Visita (
    id_visita SERIAL PRIMARY KEY,
    fecha DATE,
    comentarios TEXT
);

-- Tabla: Publicidad de Inmuebles
CREATE TABLE Anuncio (
    id_anuncio SERIAL PRIMARY KEY,
    fecha_publicacion DATE,
    coste_economico NUMERIC(10,2)
);

-- Tabla: Periódicos
CREATE TABLE Periodico (
    id_periodico SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    telefono VARCHAR(20),
    fax VARCHAR(20),
    contacto VARCHAR(100)
);

-- Tabla: Contratos de alquiler
CREATE TABLE Contrato (
    id_contrato SERIAL PRIMARY KEY,
    importe_mensual NUMERIC(10,2),
    metodo_pago VARCHAR(50),
    importe_deposito NUMERIC(10,2),
    deposito_realizado BOOLEAN,
    fecha_inicio DATE,
    fecha_finalizacion DATE,
    duracion_meses INT
);

-- Tabla: Inspecciones
CREATE TABLE Inspeccion (
    id_inspeccion SERIAL PRIMARY KEY,
    fecha DATE,
    comentarios TEXT
);
