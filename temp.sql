BEGIN
EXECUTE IMMEDIATE 'CREATE TABLE
"Proveedor" (
    "Id" NUMBER(10) GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL,
    "Nombre" NVARCHAR2(2000),
    CONSTRAINT "PK_Proveedor" PRIMARY KEY ("Id")
)';
END;


BEGIN
EXECUTE IMMEDIATE 'CREATE TABLE
"Producto" (
    "Id" NUMBER(10) GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL,
    "Nombre" NVARCHAR2(2000),
    "Categoria" NVARCHAR2(2000),
    "Id_ProveedorId" NUMBER(10),
    CONSTRAINT "PK_Producto" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_Producto_Proveedor_Id_ProveedorId" FOREIGN KEY ("Id_ProveedorId") REFERENCES "Proveedor" ("Id")
)';
END;


DESCRIBE "Producto";
DESCRIBE "Proveedor";

INSERT INTO "Proveedor" VALUES(1,'Suli');
INSERT INTO "Proveedor" VALUES(2,'Maggi');
INSERT INTO "Proveedor" VALUES(3,'Mahler');
INSERT INTO "Proveedor" VALUES(4,'GreatValue');
INSERT INTO "Proveedor" VALUES(5,'Cañareal');
INSERT INTO "Proveedor" VALUES(6,'Delmonte');

INSERT INTO "Producto" VALUES(1,'Servilletas','Cocina',1);
INSERT INTO "Producto" VALUES(2,'Arroz','cocina',1);
INSERT INTO "Producto" VALUES(3,'Maizena','comida',2);
INSERT INTO "Producto" VALUES(4,'Maseca','comida',3);
INSERT INTO "Producto" VALUES(5,'Aceite','comida',4);
INSERT INTO "Producto" VALUES(6,'Aceite','comida',6);
INSERT INTO "Producto" VALUES(7,'Azucar','comida',4);



/*SCRIPT PARA PRUEBA DE API CON IMAGENES V1*/
CREATE TABLE PRODUCTO(
CODIGO_PRODUCTO RAW(16),
NOMBRE VARCHAR2(50),
PRECIO NUMBER(8,2)
);

BEGIN
FOR X IN 1..100 LOOP
    INSERT INTO "Producto" VALUES(SYS_GUID(),'PROD_' || X, X*3.5);
END LOOP;
END;


SELECT * FROM "PRODUCTO";
SELECT * FROM "Producto";


COMMIT;