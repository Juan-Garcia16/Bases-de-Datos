-- 1) Oficinas
CREATE TABLE oficinas (
    id_oficina SERIAL PRIMARY KEY,
    calle VARCHAR(50) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    fax VARCHAR(20)
);

-- 2) Empleados (relacionado con oficina)
CREATE TABLE empleados (
    id_empleado SERIAL PRIMARY KEY,
    id_oficina INT NOT NULL REFERENCES oficinas(id_oficina),
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(120) NOT NULL,
    telefono VARCHAR(20),
    dni VARCHAR(20) UNIQUE NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    puesto VARCHAR(50) NOT NULL,
    salario_anual NUMERIC(12,2) NOT NULL CHECK (salario_anual > 0),
    fecha_ingreso DATE NOT NULL
);

-- 3) Propietarios (padre)
CREATE TABLE propietarios (
    id_propietario SERIAL PRIMARY KEY,
    direccion VARCHAR(120) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

-- 4) Particulares (subtipo)
CREATE TABLE particulares (
    id_propietario INT PRIMARY KEY REFERENCES propietarios(id_propietario),
    nombre VARCHAR(50) NOT NULL
);

-- 5) Empresas (subtipo)
CREATE TABLE empresas (
    id_propietario INT PRIMARY KEY REFERENCES propietarios(id_propietario),
    nombre_comercial VARCHAR(50) NOT NULL,
    tipo_empresa VARCHAR(50),
    contacto VARCHAR(50) NOT NULL
);

-- 6) Inmuebles (relacionado con propietario y empleado responsable)
CREATE TABLE inmuebles (
    id_inmueble SERIAL PRIMARY KEY,
    calle VARCHAR(50) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    tipo_inmueble VARCHAR(50) NOT NULL,
    numero_habitaciones INT NOT NULL CHECK (numero_habitaciones > 0),
    precio_mensual NUMERIC(10,2) NOT NULL CHECK (precio_mensual > 0),
    propietario_id INT NOT NULL REFERENCES propietarios(id_propietario),
    empleado_responsable INT REFERENCES empleados(id_empleado)  -- empleado que gestiona el inmueble (hasta 20 por empleado)
);

-- 7) Inquilinos (clientes)
-- NOTE: 'fecha' y 'comentarios' corresponden a la entrevista inicial
CREATE TABLE inquilinos (
    id_inquilino SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(120) NOT NULL,
    telefono VARCHAR(20),
    tipo_inmueble_preferido VARCHAR(50) NOT NULL,
    importe_maximo_mensual NUMERIC(10,2) NOT NULL,
    fecha DATE NOT NULL,         -- fecha entrevista inicial
    comentarios TEXT,            -- comentarios entrevista inicial
    empleado_asignado INT NOT NULL REFERENCES empleados(id_empleado) -- empleado asignado al posible inquilino
);

-- 8) Periódicos
CREATE TABLE periodicos (
    id_periodico SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(120) NOT NULL,
    telefono VARCHAR(20),
    fax VARCHAR(20),
    contacto VARCHAR(50) NOT NULL
);

-- 9) Anuncios (une inmuebles y periódicos)
CREATE TABLE anuncios (
    id_anuncio SERIAL PRIMARY KEY,
    id_inmueble INT NOT NULL REFERENCES inmuebles(id_inmueble),
    id_periodico INT NOT NULL REFERENCES periodicos(id_periodico),
    fecha_publicacion DATE NOT NULL,
    coste_economico NUMERIC(10,2) NOT NULL
);

-- 10) Visitas (une inquilinos e inmuebles)
CREATE TABLE visitas (
    id_visita SERIAL PRIMARY KEY,
    id_inmueble INT NOT NULL REFERENCES inmuebles(id_inmueble),
    id_inquilino INT NOT NULL REFERENCES inquilinos(id_inquilino),
    fecha DATE NOT NULL,
    comentarios TEXT
);

-- 11) Inspecciones (relaciona empleado e inmueble)
CREATE TABLE inspecciones (
    id_inspeccion SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL REFERENCES empleados(id_empleado), -- empleado que realizó la inspección
    id_inmueble INT NOT NULL REFERENCES inmuebles(id_inmueble),
    fecha DATE NOT NULL,
    comentarios TEXT
);

-- 12) Contratos (une inquilino, inmueble y miembro de la plantilla que lo formalizó)
CREATE TABLE contratos (
    id_contrato SERIAL PRIMARY KEY,
    id_inmueble INT NOT NULL REFERENCES inmuebles(id_inmueble),
    id_inquilino INT NOT NULL REFERENCES inquilinos(id_inquilino),
    miembro_plantilla INT NOT NULL REFERENCES empleados(id_empleado), -- empleado que formalizó
    importe_mensual NUMERIC(10,2) NOT NULL CHECK (importe_mensual > 0),
    metodo_pago VARCHAR(50) NOT NULL,
    importe_deposito NUMERIC(10,2) NOT NULL CHECK (importe_deposito >= 0),
    deposito_realizado BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_inicio DATE NOT NULL,
    fecha_finalizacion DATE NOT NULL,
    duracion_meses INT NOT NULL CHECK (duracion_meses BETWEEN 3 AND 12)
);

-- 13) Parientes (1:1 con empleado)
CREATE TABLE parientes (
    id_pariente SERIAL PRIMARY KEY,
    empleado_id INT UNIQUE NOT NULL REFERENCES empleados(id_empleado), -- vínculo 1:1 con empleado
    nombre VARCHAR(50) NOT NULL,
    relacion VARCHAR(20),
    direccion VARCHAR(120),
    telefono VARCHAR(20) NOT NULL
);

-- 14) Especializaciones de empleados (tablas hijas)
CREATE TABLE directores (
    id_empleado INT PRIMARY KEY REFERENCES empleados(id_empleado),
    id_oficina INT UNIQUE NOT NULL REFERENCES oficinas(id_oficina), -- cada oficina tiene 1 director
    fecha_inicio_cargo DATE NOT NULL,
    pago_anual_vehiculo NUMERIC(12,2) NOT NULL,
    bonificacion_mensual NUMERIC(12,2)
);

CREATE TABLE administrativos (
    id_empleado INT PRIMARY KEY REFERENCES empleados(id_empleado),
    velocidad_escritura INT NOT NULL
);

-- Nota: no hay atributos exclusivos en tu diseño para supervisores, dejamos la tabla simple
CREATE TABLE supervisores (
    id_empleado INT PRIMARY KEY REFERENCES empleados(id_empleado)
    -- si más adelante quieres añadir 'administrativo_responsable' o similar, lo podemos añadir aquí
);
