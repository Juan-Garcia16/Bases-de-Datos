-- Crear la base de datos
CREATE DATABASE lista_utp
    WITH ENCODING 'UTF8'
    LC_COLLATE = 'es_CO.UTF-8'
    LC_CTYPE = 'es_CO.UTF-8'
    TEMPLATE template0;

-- Conectarse a la base de datos (hazlo manualmente o en pgAdmin)
\c lista_utp;

-- Tabla: lista de estudiantes
CREATE TABLE lista (
    matricula VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ex1 NUMERIC(5,2) NOT NULL,
    ex2 NUMERIC(5,2) NOT NULL,
    ex3 NUMERIC(5,2) NOT NULL
);

-- Tabla: promedios
CREATE TABLE promedio (
    matricula VARCHAR(20) PRIMARY KEY,
    promedio NUMERIC(5,2) NOT NULL,
    CONSTRAINT fk_promedio_lista FOREIGN KEY (matricula)
        REFERENCES lista(matricula)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Tabla: profesores
CREATE TABLE profesores (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL
);

-- Tabla: materias
CREATE TABLE materias (
    codigo VARCHAR(10) PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);

-- Tabla: días
CREATE TABLE dias (
    id_dia SERIAL PRIMARY KEY,
    dia VARCHAR(20) NOT NULL
);

-- Tabla: clases (relación profesor–materia–salón–horario–día)
CREATE TABLE clases (
    id_clase SERIAL PRIMARY KEY,
    codigo_profesor VARCHAR(10) NOT NULL,
    codigo_materia VARCHAR(10) NOT NULL,
    salon VARCHAR(20) NOT NULL,
    horario VARCHAR(50) NOT NULL,
    id_dia INT NOT NULL,
    FOREIGN KEY (codigo_profesor) REFERENCES profesores(codigo),
    FOREIGN KEY (codigo_materia) REFERENCES materias(codigo),
    FOREIGN KEY (id_dia) REFERENCES dias(id_dia)
);
