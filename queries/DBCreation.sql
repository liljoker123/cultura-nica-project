CREATE TABLE persona(
id_persona serial primary key,
p_nombre text,
s_nombre text,
p_apellido text,
s_apellido text,
fecha_nac  date,
edad numeric,
nivel_academico text,
tutor_id integer);


CREATE TABLE usuario(
id_usuario serial primary key,
id_persona integer references (id_persona),
usuario text,
password varchar(12),
tipo_usuario text);

CREATE TABLE numero(
id_numero serial primary key,
id_persona integer references persona(id_persona),
numero numeric,
operador text);


CREATE TABLE artista(
id_art serial primary key,
id_persona integer references persona(id_persona),
nombre_trab text,
link text,
desc_trab text,
valor_monetario money,
trayectoria text);

CREATE TABLE cazatalento(
id_cazatalen serial primary key,
id_persona integer references persona(id_perona),
experiencia text,
red_contactos text,
actividad_laboral text);

CREATE TABLE premios(
id_premios serial primary key,
id_art integer references artista(id_art),
nombre_premio varchar(40),
descripcion text,
fecha_premiacion date);


CREATE TABLE obras(
id_obras serial primary key,
id_art integer references artista(id_art),
id_categorias integer references categorias(id_categorias),
talento varchar(30),
concepto text,
contexto text,
referencia text);


CREATE TABLE categorias(
id_categorias serial primary key,
nombre varchar (40),
descripcion text);


CREATE TABLE detalles_de_obras(
id_detalles serial primary key,
id_obras integer references obras(id_obras),
plataforma varchar(30),
fecha_publicacion date);


CREATE TABLE eventos(
id_eventos serial primary key,
eventos_asistidos text,
reconocimientos_ganados text,
lugares_visitados text);

CREATE TABLE art_evento(
id_artev serial primary key,
id_art integer references artista(id_art),
id_eventos integer references eventos(id_eventos))

