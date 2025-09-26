-- ============================
-- TABLAS PRINCIPALES
-- ============================

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
    CONSTRAINT fk_curso_grupo FOREIGN KEY (fk_id_curso)
        REFERENCES cursos(id_curso)
);

CREATE TABLE horarios(
    id_horario SERIAL PRIMARY KEY,
    fk_id_grupo INT NOT NULL,
    dia_semana VARCHAR(20) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    CONSTRAINT fk_grupo_horario FOREIGN KEY (fk_id_grupo)
        REFERENCES grupos(id_grupo)
);

CREATE TABLE matriculas(
    id_matricula SERIAL PRIMARY KEY,
    fecha_matricula DATE NOT NULL,
    fk_id_estudiante INT NOT NULL,
    fk_id_curso INT NOT NULL,
    CONSTRAINT fk_estudiante_matricula FOREIGN KEY (fk_id_estudiante)
        REFERENCES estudiantes(id_estudiante),
    CONSTRAINT fk_curso_matricula FOREIGN KEY (fk_id_curso)
        REFERENCES cursos(id_curso)
);

-- ============================
-- NORMALIZACIÓN TIPOS DE EVALUACIÓN
-- ============================

CREATE TABLE tipos_evaluacion (
    id_tipo_evaluacion SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE evaluaciones(
    id_evaluacion SERIAL PRIMARY KEY,
    fk_id_profesor INT NOT NULL,
    fk_id_grupo INT NOT NULL,
    fecha_evaluacion DATE NOT NULL,
    fk_id_tipo_evaluacion INT NOT NULL,
    CONSTRAINT fk_profesor_evaluacion FOREIGN KEY (fk_id_profesor)
        REFERENCES profesores(id_profesor),
    CONSTRAINT fk_grupo_evaluacion FOREIGN KEY (fk_id_grupo)
        REFERENCES grupos(id_grupo),
    CONSTRAINT fk_tipo_evaluacion FOREIGN KEY (fk_id_tipo_evaluacion)
        REFERENCES tipos_evaluacion(id_tipo_evaluacion)
);

CREATE TABLE calificaciones(
    id_calificacion SERIAL PRIMARY KEY,
    puntaje NUMERIC(5,2) NOT NULL,
    fk_id_estudiante INT NOT NULL,
    fk_id_evaluacion INT NOT NULL,
    CONSTRAINT fk_calificacion_estudiante FOREIGN KEY (fk_id_estudiante)
        REFERENCES estudiantes(id_estudiante),
    CONSTRAINT fk_calificacion_evaluacion FOREIGN KEY (fk_id_evaluacion)
        REFERENCES evaluaciones(id_evaluacion)
);

-- ============================
-- NORMALIZACIÓN TIPOS DE RECURSOS
-- ============================

CREATE TABLE tipos_recurso (
    id_tipo_recurso SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE recursos_educativos(
    id_recurso SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fk_id_tipo_recurso INT NOT NULL,
    CONSTRAINT fk_recurso_tipo FOREIGN KEY (fk_id_tipo_recurso)
        REFERENCES tipos_recurso(id_tipo_recurso)
);

CREATE TABLE modulos(
    id_modulo SERIAL PRIMARY KEY,
    nombre_modulo VARCHAR(50) NOT NULL,
    descripcion TEXT,
    fk_id_curso INT NOT NULL,
    CONSTRAINT fk_modulo_curso FOREIGN KEY (fk_id_curso)
        REFERENCES cursos(id_curso)
);

CREATE TABLE modulos_recursos(
    id_modulo_recurso SERIAL PRIMARY KEY,
    fk_id_modulo INT NOT NULL,
    fk_id_recurso INT NOT NULL,
    CONSTRAINT fk_modulo_recurso_modulo FOREIGN KEY (fk_id_modulo)
        REFERENCES modulos(id_modulo),
    CONSTRAINT fk_modulo_recurso_recurso FOREIGN KEY (fk_id_recurso)
        REFERENCES recursos_educativos(id_recurso)
);
