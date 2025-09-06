-- Tabla: Oficinas
CREATE TABLE oficinas (
    id_oficina SERIAL PRIMARY KEY,
    calle VARCHAR(50) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    fax VARCHAR(20)
);

-- Tabla base
CREATE TABLE empleados (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(120) NOT NULL,
    telefono VARCHAR(20),
    dni VARCHAR(20) UNIQUE NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    puesto VARCHAR(50) NOT NULL,
    salario_anual NUMERIC(12,2) NOT NULL CHECK (salario_anual > 0),
    fecha_ingreso DATE NOT NULL
);

-- Tabla director (hereda de empleados)
CREATE TABLE directores (
    id_empleado INT PRIMARY KEY REFERENCES empleados(id_empleado),
    fecha_inicio_cargo DATE NOT NULL,
    pago_anual_vehiculo NUMERIC(12,2) NOT NULL,
    bonificacion_mensual NUMERIC(12,2)
);

-- Tabla supervisor (hereda de empleados)
CREATE TABLE supervisores (
    id_empleado INT PRIMARY KEY REFERENCES empleados(id_empleado)
    -- Aquí podrías poner atributos exclusivos de supervisor si los hubiera
);

-- Tabla administrativo (hereda de empleados)
CREATE TABLE administrativos (
    id_empleado INT PRIMARY KEY REFERENCES empleados(id_empleado),
    velocidad_escritura INT NOT NULL
);

-- Tabla: Parientes
CREATE TABLE parientes (
    id_pariente SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    relacion VARCHAR(20),
    direccion VARCHAR(120),
    telefono VARCHAR(20)
);

-- Tabla: Inmuebles
CREATE TABLE inmuebles (
    id_inmueble SERIAL PRIMARY KEY,
    calle VARCHAR(50) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    tipo_inmueble VARCHAR(50) NOT NULL,
    numero_habitaciones INT NOT NULL CHECK (numero_habitaciones > 0),
    precio_mensual NUMERIC(10,2) NOT NULL CHECK (precio_mensual > 0)
);

-- Tabla base: Propietarios
-- direccion y telefono son atributos comunes de particular y empresa
CREATE TABLE propietarios (
    id_propietario SERIAL PRIMARY KEY,
    direccion VARCHAR(120) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

-- Subtipo: Particular (hereda de propietario)
CREATE TABLE particulares (
    id_propietario INT PRIMARY KEY REFERENCES propietarios(id_propietario),
    nombre VARCHAR(50) NOT NULL
);

-- Subtipo: Empresa (hereda de propietario)
CREATE TABLE empresas (
    id_propietario INT PRIMARY KEY REFERENCES propietarios(id_propietario),
    nombre_comercial VARCHAR(50) NOT NULL,
    tipo_empresa VARCHAR(50),
    contacto VARCHAR(50) NOT NULL
);

-- Tabla: Inquilinos (clientes)
CREATE TABLE inquilinos (
    id_inquilino SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(120) NOT NULL,
    telefono VARCHAR(20),
    tipo_inmueble_preferido VARCHAR(50) NOT NULL,
    importe_maximo_mensual NUMERIC(10,2) NOT NULL,
    fecha DATE NOT NULL,
    comentarios TEXT,
    empleado_asignado INT REFERENCES empleados(id_empleado) NOT NULL,
);

-- Tabla: Visitas
CREATE TABLE visitas (
    id_visita SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    comentarios TEXT
);

-- Tabla: Publicidad de Inmuebles
CREATE TABLE anuncios (
    id_anuncio SERIAL PRIMARY KEY,
    fecha_publicacion DATE NOT NULL,
    coste_economico NUMERIC(10,2) NOT NULL
);

-- Tabla: Periódicos
CREATE TABLE periodicos (
    id_periodico SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(120) NOT NULL,
    telefono VARCHAR(20),
    fax VARCHAR(20),
    contacto VARCHAR(50) NOT NULL
);

-- Tabla: Contratos de alquiler
CREATE TABLE contratos (
    id_contrato SERIAL PRIMARY KEY,
    importe_mensual NUMERIC(10,2) NOT NULL CHECK (importe_mensual > 0),
    metodo_pago VARCHAR(50) NOT NULL,
    importe_deposito NUMERIC(10,2) NOT NULL CHECK (importe_deposito >= 0),
    deposito_realizado BOOLEAN NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_finalizacion DATE NOT NULL,
    duracion_meses INT NOT NULL CHECK (duracion_meses BETWEEN 3 AND 12),
    miembro_plantilla INT REFERENCES empleados(id_empleado) NOT NULL
);

-- Tabla: Inspecciones
CREATE TABLE inspecciones (
    id_inspeccion SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    comentarios TEXT
);
