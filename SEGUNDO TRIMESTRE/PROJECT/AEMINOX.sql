create database AEMINOX;
use AEMINOX;

-- creacion de las tablas de base de datos AEMINOX

create table Empleado
(
IdEmpleado int(2) auto_increment not null,
Nombre varchar(20),
Apellido varchar(20),
Correo varchar(50),
Direccion varchar(30),
Telefono double ,
Cuidad varchar(15),
primary key(IdEmpleado) 
);

create table Usuario
(
IdUsuario int(2)auto_increment not null,
Usuario varchar(20),
Rol varchar(30),
Contraseña varchar(20),
primary key(IdUsuario)
);

create table Proveedor
(
IdProveedor int(2)auto_increment not null,
NombreEmpresa varchar(30),
Correo varchar(50),
Direccion varchar(30),
Ciudad char(15),
Telefono varchar(10) ,
primary key(IdProveedor)
);

create table MaterialesRequeridos
(
IdMaterialReque int(2)auto_increment not null,
DetalleMaterial varchar(60),
Cantidad char(2),
primary key(IdMaterialReque)
);

create table Material
(
IdMaterial int(2)auto_increment not null,
Descripcion varchar(50),
disponibilidad boolean,
primary key(IdMaterial)
);

create table Categoria
(
IdCategoria int(2)auto_increment not null,
NombreCategoria varchar(20),
primary key(IdCategoria)
);

create table Proveedor_Material
(
IdProveedor_Material int(2)auto_increment not null,
Precio double,
primary key(IdProveedor_Material)
);

create table Pedido_Material
(
IdPedido int(2)auto_increment not null,
Fecha varchar(10),
ValorTotal double,
primary key(IdPedido)
);

create table Detalle_Pedido
(
IdDetalle int(2)auto_increment not null,
Cantidad int (2),
Precio double ,
primary key(IdDetalle)
);

create table Movimientos
(
IdMovimiento int(2)auto_increment not null,
Fecha varchar(10),
Cantidad int(2),
TipoMovimiento int(2),
Detalle_Movimiento varchar(50),
primary key(IdMovimiento)
);
create table Reutilizar 
(
IdReutilizar int(2)auto_increment not null,
Fecha varchar(10),
Cantidad int(2),
Disponibilidad boolean,
primary key(IdReutilizar)
);
Desc Empleado;
desc Usuario;
desc Proveedor;
desc MaterialesRequeridos;
desc Material;
desc Categoria;
desc Proveedor_Material;
desc Pedido_Material;
desc Detalle_Pedido;
desc Movimientos;
desc Reutilizar;

-- En esta parte se hacen los alter y declaraciones de las tablas --

alter table Empleado add IdUsuario int(2);
alter table MaterialesRequeridos add IdEmpleado int(2);
alter table MaterialesRequeridos add IdMaterial int(2);
alter table Material add IdCategoria int(2);
alter table Reutilizar add IdMaterial int(2);
alter table Detalle_Pedido add Idmaterial int(2); 
alter table Movimientos add IdEmpleado int(2);
alter table Movimientos add IdMaterial int(2);
alter table Pedido_Material add IdEmpleado int(2);
alter table Pedido_Material add IdProveedor int(2);
alter table Proveedor_Material add IdProveedor int(2);
alter table Proveedor_Material add idMaterial int(2);

alter table Empleado add foreign key(IdUsuario) references Usuario(IdUsuario);
alter table Materialesrequeridos add foreign key(IdEmpleado) references Empleado(IdEmpleado);
alter table MaterialesRequeridos add foreign key(IdMaterial) references Material(IdMaterial);
alter table Material add foreign key(Idcategoria) references Categoria(IdCategoria);
alter table Reutilizar add foreign key(IdMaterial) references Material(IdMaterial);
alter table detalle_pedido add foreign key(Idmaterial) references Material(IdMaterial);
alter table movimientos add foreign key(IdEmpleado) references Empleado(IdEmpleado);
alter table movimientos add foreign key(idmaterial) references Material(Idmaterial);
alter table pedido_material add foreign key(IdEmpleado) references Empleado(IdEmpleado);
alter table Pedido_material add foreign key(IdProveedor) references Proveedor(IdProveedor);
alter table proveedor_material add foreign key(Idmaterial)references material(idmaterial);
alter table proveedor_material add foreign key(Idproveedor)references proveedor(Idproveedor);

-- Se agregan los insert de cada tabla -- 

insert into Empleado(idusuario,Nombre, Apellido, Correo, Direccion, Telefono, Cuidad)
values
('1','Edgar','Polania','aeminox.edgar@gmail','cll 68 # 18 h 56','3214584756','Bogotá D.C'),
('2','Carlos iguaran','Escobar','aeminox.carlor@gmail.com','cll 56 # 14 h 56','3214587754','Bogotá D.C'),
('3','Edwin milano','Ortiz','Eaeminox.edwin@gmail.com','cll 70 # 19 c 65','3201458798','Bogotá D.C'),
('4','Jhonny','pesillo','aeminox.jhonny@gmail.com','dig 68 # 34 h 56','3054786521','Bogotá D.C'),
('5','Solangie','Cruz','aeminox.solangie@gmail.com','cll 68sur # 18 b 72','3145879865','Bogotá D.C'),
('6','Ricardo','Cano','aeminox.reicardo@gmail.com','AV 68 #72 c 56','3214567898','Bogotá D.C'),
('7','Oscar','Mendivelso','aeminox.Oscar@gmail.com','cll 19 # 14 b 56','3214587731','Bogotá D.C'),
('8','Daniel','Diaz','aeminox.daniel@gmail.com','cll 100 # 17 c 65','312548963','Bogotá D.C'),
('9','Andres','Perez','aeminox.andres@gmail.com','cll 170 # 20 h 36','325478125','Bogotá D.C'),
('10','Nicolas','valencia','aeminox.nicolas@gmail.com','Dig 63sur 15 d 45','3502146581','Bogotá D.C');

insert into Usuario ( Usuario, Rol, Contraseña)
values
('Edgar29','Empleado','123456'),
('Carlos02','Empleado','123456'),
('EdwinM45','Empleado','123456'),
('Jhonny12','Empleado','123456'),
('Solangie01','Administrador','123456'),
('Ricard20','Empleado','123456'),
('Oscar55','Empleado','123456'),
('Daniel','Empleado','123456'),
('Andres','Empleado','123456'),
('Nicolas','Empleado','123456');

insert into Proveedor (NombreEmpresa, Correo, Direccion, Ciudad, Telefono)
values
('AcerosCompany','companyAceros@hotmail.com','dig 100 # 45-65','Bogotá','3215478'),
('MaderasAceros','MaderasAceros@hotmail.com','cll 63 # 21-80','Bogotá','3215478'),
('Distribuidorametal','distribuidorametal@hotmail.com','dig 170 # 68-65','Bogotá','3215651');

insert into Material (Descripcion, disponibilidad)
values
('Acero Inoxidable','1'),
('Aluminio','1'),
('Metal Pesado','1'),
('Acero','0'),
('Soldadura','1'),
('Discos de Corte','1'),
('Tubos de Acero','1'),
('Barras de metal','0'),
('Acero Inoxidable','1'),    
('perfiles de Hierro','1'),
('troqueles de Aluminio','0');

insert into MaterialesRequeridos(idempleado, idmaterial, DetalleMaterial, Cantidad)
values
('1','1','Aluminio','1'),
('2','2','Metal Pesado','2'),
('3','3','Acero','20'),
('4','4','Soldadura','20'),
('7','5','Discos de Corte','5'),
('2','6','Tubos de Acero','6'),
('6','6','Barras de metal','3'),
('7','7','Acero Inoxidable','2'),
('9','8','perfiles de Hierro','1'),
('10','9','troqueles de Aluminio','4');

insert into categoria(NombreCategoria)
values
('Aceros'),
('Hierro'),
('Acero inoxidable'),
('Materiales de uso');

insert into material(Idcategoria, Descripcion, disponibilidad)
values
('1','Perfiles de acero','1'),
('2','Perfiles gruesos de hierro','1'),
('3','Laminas de acero inoxidable','0'),
('4','Discos de corte 3 " ','1'),
('1','Acero laminas','0'),
('4','Soldadura','1'),
('3','Tubos de acero inoxidable','1'),
('1','Tubos de acero','0'),
('2','Cubos de hierro','0'),
('4','Tuercas aceradas ','1'),
('3','discosd de acero inoxidable','1');

insert into Reutilizar(Idmaterial,Fecha,Cantidad, Disponibilidad)
values
('1','2019-05-12','2','1'),
('6','2019-05-14','5','1'),
('8','2019-05-16','1','1'),
('9','2019-05-20','3','0'),
('2','2019-06-12','4','1');

insert into detalle_pedido(Idmaterial, Cantidad, Precio)
values
('1','2','60000'),
('2','3','25000'),
('3','8','70000'),
('4','6','35000'),
('5','1','45650'),
('6','2','25470');

insert into movimientos(Idmaterial,idempleado,Fecha,Cantidad,TipoMovimiento,Detalle_Movimiento)
values
('1','1','2019-03-10','2','0','Se movio de la bodega'),
('2','2','2019-04-02','1','1','Añadio a inventario'),
('3','1','2019-05-01','4','1','Añadio a inventario'),
('4','3','2019-06-30','3','1','Añadio a inventario'),
('5','4','2019-07-26','7','0','Se movio de la bodega'),
('6','6','2019-08-16','5','1','Añadio a inventario');

insert into Pedido_material(idempleado,idproveedor,Fecha,ValorTotal)
values
('5','1','2019-08-16','150000'),
('5','3','2019-08-16','25000'),
('5','2','2019-08-16','64500'),
('5','2','2019-08-16','35470'),
('5','1','2019-08-16','95800'),
('5','3','2019-08-16','45600');

insert into Proveedor_material(Idmaterial,idproveedor,precio)
values
('1','1','56120'),
('2','1','35470'),
('3','2','98500'),
('4','2','45200'),
('5','3','110000'),
('6','3','65870');





