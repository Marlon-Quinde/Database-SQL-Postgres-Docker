

-- Tarea con countryLanguage

-- Crear la tabla de language

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;


-- Table Definition
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT 	nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);


-- Empezar con el select para confirmar lo que vamos a actualizar
SELECT DISTINCT cl."language"  FROM countrylanguage cl order by cl."language"  ASC

-- Actualizar todos los registros
INSERT INTO "language" ("name")
SELECT DISTINCT cl."language"  FROM countrylanguage cl order by cl."language"  ASC;


-- Cambiar tipo de dato en languagecode - languagecode por int4
ALTER TABLE countrylanguage
ALTER COLUMN languagecode TYPE int4
USING languagecode::integer;

ALTER TABLE "language"
ALTER COLUMN code TYPE int4
USING code::integer;

-- Crear el forening key y constraints de no nulo el language_code
ALTER TABLE countrylanguage
ALTER languagecode SET NOT NULL;


-- Revisar lo creado