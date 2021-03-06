DROP DATABASE IF EXISTS azienda1;
CREATE DATABASE azienda1;

DROP USER IF EXISTS 'tsw'@'localhost';
CREATE USER 'tsw'@'localhost' IDENTIFIED BY 'adminadmin';
GRANT ALL ON azienda1.* TO 'tsw'@'localhost';
USE azienda1;

DROP TABLE IF EXISTS azienda;
CREATE TABLE azienda (
  nome           varchar(20)    not NULL,
  citta           varchar(20)    not NULL,
  numdipendenti  int            not NULL,
  PIVA           varchar(16)    not NULL,
  primary key (PIVA)
);

DROP TABLE IF EXISTS  dipendenti;
CREATE TABLE dipendenti (
  nome        varchar(20)    not NULL,
  cognome     varchar(20)    not NULL,
  CF          varchar(16)    not NULL,
  stipendio   int(4)         not NULL,
  PIVA         varchar(16)   not NULL,
  primary key (CF),
  foreign key (PIVA) references azienda(PIVA)
);

DROP TABLE IF EXISTS macchine_agricole;
CREATE TABLE macchine_agricole (
  targa    varchar(10)         not NULL,
  modello  varchar(20)         not NULL,
  primary key (targa)
);

DROP TABLE IF EXISTS terreno;
CREATE TABLE terreno (
  dimensione     int   not NULL,
  cod_terreno    int   not NULL,
  PIVA           varchar(16)  not NULL,
  primary key (cod_terreno),
  foreign key (PIVA) references azienda(PIVA)
);

DROP TABLE IF EXISTS visite;
CREATE TABLE  visite (
  data_v       date    not NULL,
  prezzo       int     not NULL,
  numpersone   int     not NULL,
  ID           int     not NULL,
  PIVA        varchar(16)   not NULL,
  primary key (ID),
  foreign key (PIVA) references azienda(PIVA)
);

DROP TABLE IF EXISTS numero_telefono;
CREATE TABLE numero_telefono (
  numero      real          not NULL,
  CF          varchar(16)  not NULL,
  primary key (numero),
  foreign key (CF) references dipendenti(CF)
);

DROP TABLE IF EXISTS ruolo;
CREATE TABLE ruolo (
  manzione    varchar(20)    not NULL,
  CF          varchar(16)    not NULL,
  foreign key (CF) references dipendenti(CF)
);

DROP TABLE IF EXISTS categoria;
CREATE TABLE categoria (
categ varchar(15) not null,
primary key(categ)
);

DROP TABLE IF EXISTS negozio;
CREATE TABLE negozio (
  ragione_sociale    varchar(50)  not NULL,
  indirizzo varchar(30)          not NULL,
  ncivico int(4) not null,
  cap int(5) not null,
  PIVA      varchar(16)           not NULL,
  email    varchar(35)  not NULL,
  pwd       varchar(8)   not NULL,
  primary key (PIVA)
);
DROP TABLE IF EXISTS ordine;
CREATE TABLE ordine (
numero    int   not NULL,
PIVA    varchar(16) not NULL,
 primary key (numero),
 foreign key (PIVA) references negozio(PIVA)
);

DROP TABLE IF EXISTS prodotto;
CREATE TABLE prodotto (
 prezzo      float         not NULL,
 nomep        varchar(10) not NULL,
 SSN         varchar(9)     not NULL,
 disponibilità int(5)   not NULL,
 descrizione varchar(50) not NULL,
 categ varchar(10) not null,
 idfoto varchar(30) not null,
  primary key (SSN),
  foreign key (categ) references categoria(categ)
);

DROP TABLE IF EXISTS composto;
CREATE TABLE composto (

SSN      varchar(9) not NULL,
numero   int not NULL,
foreign key (SSN) references prodotto(SSN),
foreign key (numero) references ordine(numero)
);

DROP TABLE IF EXISTS produce;
CREATE TABLE produce (
cod_terreno int not NULL,
SSN char(9) not NULL,
foreign key(cod_terreno) references terreno(cod_terreno),
foreign key(SSN) references prodotto(SSN)
 );

 DROP TABLE IF EXISTS utilizza;
CREATE TABLE utilizza (
km real not NULL,
CF varchar(16) not NULL,
targa varchar(10) not NULL,
foreign key(CF) references dipendenti(CF),
foreign key(targa) references macchine_agricole(targa)
);

DROP TABLE IF EXISTS ara;
CREATE TABLE ara (
targa varchar(10) not NULL,
cod_terreno int not NULL,
foreign key(targa) references macchine_agricole(targa),
foreign key(cod_terreno) references terreno(cod_terreno)
);
DROP TABLE IF EXISTS spedizione;
CREATE TABLE spedizione (
 ID           int     not NULL,
 numero   int auto_increment not NULL,
 modalitaspedizione varchar(15) not null,
 costospedizione int not null,
 primary key (ID),
  foreign key (numero) references ordine(numero)
);

DROP TABLE IF EXISTS pagamento;
CREATE TABLE pagamento (
 ID           int     not NULL,
 num_pag      int auto_increment not NULL,
 modalitapagamento varchar(15) not null,
 primary key (num_pag),
 foreign key (ID) references spedizione(ID)
);

DROP TABLE IF EXISTS fattura;
CREATE TABLE fattura (
 data        date     not NULL,
num_pag     int    not NULL,
numero      int auto_increment     not NULL,
primary key (numero),
foreign key (num_pag) references pagamento(num_pag)
);

INSERT INTO categoria VALUES
('ortaggi');
INSERT INTO categoria VALUES
('frutta');
INSERT INTO categoria VALUES
('FruttaSecca');
INSERT INTO categoria VALUES
('vino');
INSERT INTO categoria VALUES
('olio');
INSERT INTO categoria VALUES
('semi');
INSERT INTO categoria VALUES
('verdura');


INSERT INTO azienda VALUES
('Azienda&co','Napoli',1000,'IT12359971632');


INSERT INTO negozio VALUES
('FRUTTASHOP','via lambiase','44','84013','12232565478','alex@gmail.com','cavese12');

INSERT INTO dipendenti VALUES
  ('Mario','Rossi','RSSMR00S53A509E',1500,'IT12359971632');
INSERT INTO dipendenti VALUES
  ('Alessandro','Verdi','VRDAS98O84I603E',2000,'IT12359971632');
INSERT INTO dipendenti VALUES
  ('Marco','Bianchi','BNCMR02M33O819N',1800,'IT12359971632');
INSERT INTO dipendenti VALUES
  ('Carlo','Neri','NRCRL68P57I619A',1500,'IT12359971632');
  INSERT INTO dipendenti VALUES
  ('Nicola','Ferrara','FRRNC99O89I129C',1800,'IT12359971632');
INSERT INTO dipendenti VALUES
  ('Roberta','Esposito','SPTRB66S93P987R',2100,'IT12359971632');

INSERT INTO ruolo VALUES
  ('contadino','RSSMR00S53A509E');
INSERT INTO ruolo VALUES
  ('agronomo','VRDAS98O84I603E');
INSERT INTO ruolo VALUES
  ('commericale','BNCMR02M33O819N');
INSERT INTO ruolo VALUES
  ('agricoltore','NRCRL68P57I619A');
  INSERT INTO ruolo VALUES
  ('commericale','FRRNC99O89I129C');
INSERT INTO ruolo VALUES
  ('viticoltore','SPTRB66S93P987R');

INSERT INTO macchine_agricole VALUES
('AA 000 XX','trattore');
INSERT INTO macchine_agricole VALUES
('AV 568 SA','aratro');
INSERT INTO macchine_agricole VALUES
('SA 741 OA','rullo compattatore');
INSERT INTO macchine_agricole VALUES
('CT 233 SW','sarchiatrice');

INSERT INTO terreno VALUES
(4,13,'IT12359971632');
INSERT INTO terreno VALUES
(1,11,'IT12359971632');
INSERT INTO terreno VALUES
(3,20,'IT12359971632');
INSERT INTO terreno VALUES
(2,3,'IT12359971632');

INSERT INTO visite VALUES
('2020-02-12',20,30,141166,'IT12359971632');
INSERT INTO visite VALUES
('2020-06-05',20,15,183300,'IT12359971632');
INSERT INTO visite VALUES
('2020-08-20',20,18,028970,'IT12359971632');
INSERT INTO visite VALUES
('2020-09-14',20,10,697840,'IT12359971632');


INSERT INTO numero_telefono VALUES
(3362534339,'RSSMR00S53A509E');
INSERT INTO numero_telefono VALUES
(3335655698,'VRDAS98O84I603E');
INSERT INTO numero_telefono VALUES
(3483283734,'BNCMR02M33O819N');
INSERT INTO numero_telefono VALUES
(3465684001,'NRCRL68P57I619A');
INSERT INTO numero_telefono VALUES
(3387139665,'SPTRB66S93P987R');




INSERT INTO prodotto VALUES
(3,'pomodoro',654008935,10,'pomodorino giallo','ortaggi','pomodorinogiallo');
INSERT INTO prodotto VALUES
(1,'patata',125987635,5,'patate novelle','ortaggi','patate');
INSERT INTO prodotto VALUES
(3,'melanzane',539512508,100,'melanzana cima di viola','ortaggi','melanzana');
INSERT INTO prodotto VALUES
(2,'lattuga',147963258,20,'lattuga iceberg','ortaggi','lattuga');
INSERT INTO prodotto VALUES
(4,'uva',159638257,33,'uva armonera del Cilento','frutta','uva');

INSERT INTO ordine VALUES
(1,12232565478);
INSERT INTO composto VALUES
('147963258',1);

INSERT INTO produce VALUES
(13,147963258);
INSERT INTO produce VALUES
(11,159638257);
INSERT INTO produce VALUES
(3,654008935);
INSERT INTO produce VALUES
(20,539512508);

INSERT INTO utilizza VALUES
(10000,'RSSMR00S53A509E','AA 000 XX');
INSERT INTO utilizza VALUES
(15000,'NRCRL68P57I619A','AV 568 SA');
INSERT INTO utilizza VALUES
(13500,'SPTRB66S93P987R','SA 741 OA');

INSERT INTO ara VALUES
('AA 000 XX',13);
INSERT INTO ara VALUES
('AV 568 SA',11);
INSERT INTO ara VALUES
('CT 233 SW',3);
INSERT INTO ara VALUES
('SA 741 OA',20);




