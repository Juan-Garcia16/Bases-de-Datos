CREATE TABLE estudiantes(
    id_estudiante SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL
);

CREATE TABLE profesores(
    id_profesor SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    especialidad VARCHAR(50) NOT NULL
);

CREATE TABLE cursos(
    id_curso SERIAL PRIMARY KEY,
    fk_id_profesor INT NOT NULL,
    nombre_curso VARCHAR(50) NOT NULL,
    creditos INT NOT NULL,
    descripcion TEXT,
    CONSTRAINT fk_profesor_curso FOREIGN KEY (fk_id_profesor)
        REFERENCES profesores(id_profesor)
);  

CREATE TABLE grupos(
    id_grupo SERIAL PRIMARY KEY,
    nombre_grupo VARCHAR(50) NOT NULL,
    fk_id_curso INT NOT NULL,
    horario VARCHAR(100) NOT NULL,
    CONSTRAINT fk_curso_grupo FOREIGN KEY (fk_id_curso)
        REFERENCES cursos(id_curso)
);  

CREATE TABLE matriculas(
    id_matricula SERIAL PRIMARY KEY,
    fecha_matricula DATE NOT NULL,
    fk_id_estudiante int NOT NULL,
    fk_id_curso int NOT NULL,
    CONSTRAINT fk_estudiante_matricula FOREIGN KEY (fk_id_estudiante)
        REFERENCES estudiantes(id_estudiante),
    CONSTRAINT fk_curso_matricula FOREIGN KEY (fk_id_curso)
        REFERENCES cursos(id_curso)
);

CREATE TABLE evaluaciones(
    id_evaluacion SERIAL PRIMARY KEY,
    fk_id_profesor int NOT NULL,
    fecha_evaluacion DATE NOT NULL,
    --calificacion NUMERIC(5,2) NOT NULL,
    tipo_evaluacion VARCHAR(50) NOT NULL,
    CONSTRAINT fk_profesor_evaluacion FOREIGN KEY (fk_id_profesor)
        REFERENCES profesores(id_profesor)
);  

CREATE TABLE calificaciones(
    id_calificacion SERIAL PRIMARY KEY,
    puntaje NUMERIC(5,2) NOT NULL,
    fk_id_estudiante INT NOT NULL,
    fk_id_evaluacion INT NOT NULL,
    --calificacion NUMERIC(5,2) NOT NULL,
    CONSTRAINT fk_calificacion_estudiante FOREIGN KEY (fk_id_estudiante)
        REFERENCES estudiantes(id_estudiante),
    CONSTRAINT fk_calificacion_evaluacion FOREIGN KEY (fk_id_evaluacion)
        REFERENCES evaluaciones(id_evaluacion)
);

CREATE TABLE recursos_educativos(
    id_recurso SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    descripcion TEXT
);

CREATE TABLE modulos(
    id_modulo SERIAL PRIMARY KEY,
    fk_id_recurso INT NOT NULL,
    nombre_modulo VARCHAR(50) NOT NULL,
    descripcion TEXT,
    fk_id_curso INT NOT NULL,
    CONSTRAINT fk_modulo_curso FOREIGN KEY (fk_id_curso)
        REFERENCES cursos(id_curso),
    CONSTRAINT fk_modulo_recurso FOREIGN KEY (fk_id_recurso)
        REFERENCES recursos_educativos(id_recurso)
);
