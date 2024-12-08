BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "ingredientes" (
	"id"	INTEGER,
	"nombre"	TEXT,
	"precio"	REAL,
	"calorias"	REAL,
	"inventario"	INTEGER,
	"es_vegetariano"	BOOLEAN,
	"sabor"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "productos" (
	"id"	INTEGER,
	"nombre"	TEXT,
	"precio_publico"	REAL,
	"rentabilidad"	REAL,
	"tipo_vaso"	TEXT,
	"volumen"	REAL,
	"ingrediente1_id"	INTEGER,
	"ingrediente2_id"	INTEGER,
	"ingrediente3_id"	INTEGER,
	"ventas_totales"	INTEGER,
	FOREIGN KEY("ingrediente1_id") REFERENCES "ingredientes"("id"),
	FOREIGN KEY("ingrediente3_id") REFERENCES "ingredientes"("id"),
	FOREIGN KEY("ingrediente2_id") REFERENCES "ingredientes"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "usuarios" (
	"id"	INTEGER,
	"usuario"	TEXT,
	"password"	TEXT,
	"es_admin"	BOOLEAN,
	"es_empleado"	BOOLEAN,
	"es_cliente"	BOOLEAN,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "ventas" (
	"id"	INTEGER,
	"producto_id"	INTEGER,
	"cantidad"	BLOB,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "ingredientes" VALUES (1,'Helado de fresa',2500.0,3.5,15,0,'Fresa');
INSERT INTO "ingredientes" VALUES (2,'Chispas de chocolate',2000.0,4.2,10,0,'Chocolate');
INSERT INTO "ingredientes" VALUES (3,'Mani Japones',2800.0,3.8,8,0,'Mani');
INSERT INTO "productos" VALUES (1,'Copa de Fresa',8500.0,2500.0,'Vaso mediano',NULL,1,2,3,NULL);
INSERT INTO "productos" VALUES (2,'Malteada de chocolate',17000.0,2000.0,'-',8.5,1,2,3,NULL);
INSERT INTO "productos" VALUES (3,'Galleta de helado',7500.0,2200.0,'-',6.5,1,2,3,NULL);
INSERT INTO "productos" VALUES (4,'Copa de chocolate',15000.0,8.6,'Vaso Familiar',NULL,1,2,3,NULL);
INSERT INTO "usuarios" VALUES (1,'admin','1234',1,'','');
INSERT INTO "usuarios" VALUES (2,'user1','12345','',1,'');
INSERT INTO "usuarios" VALUES (3,'Mario','45896','',1,'');
INSERT INTO "usuarios" VALUES (4,'Karen','25693','','',1);
INSERT INTO "usuarios" VALUES (5,'Mayra','35895','','',1);
COMMIT;
