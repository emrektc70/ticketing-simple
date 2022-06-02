/* Testé sous MySQL 5.x */

drop table if exists T_COMMENTAIRE;
drop table if exists T_TICKET;

create table T_TICKET (
  TIC_ID integer primary key auto_increment,
  TIC_DATE datetime not null,
  TIC_TITRE varchar(100) not null,
  TIC_CONTENU varchar(400) not null,
  URG_ID integer not null,
  ETAT_ID integer not null
/*constraint fk_tic_urg foreign key(URG_ID) references T_URGENCE(URG_ID) */
) ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

create table T_COMMENTAIRE (
  COM_ID integer primary key auto_increment,
  COM_DATE datetime not null,
  COM_AUTEUR varchar(100) not null,
  COM_CONTENU varchar(200) not null,
  TIC_ID integer not null,
  constraint fk_com_tic foreign key(TIC_ID) references T_TICKET(TIC_ID)
) ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;


insert into T_TICKET(TIC_DATE, TIC_TITRE, TIC_CONTENU, URG_ID) values
(NOW(), 'Panne site Web', 'Bonjour tout le monde ! le site web du client T.Simon est tombé en panne.',2 );
insert into T_TICKET(TIC_DATE, TIC_TITRE, TIC_CONTENU, URG_ID) values
(NOW(), 'Finir logiciel d un client', 'Il faut finir le plus rapidement possible le logiciel de frais du client M.potier.',2 );


insert into T_COMMENTAIRE(COM_DATE, COM_AUTEUR, COM_CONTENU, TIC_ID) values
(NOW(), 'A. Nonyme', 'Bravo pour ce début', 2);
insert into T_COMMENTAIRE(COM_DATE, COM_AUTEUR, COM_CONTENU, TIC_ID) values
(NOW(), 'Moi', 'Merci ! Je vais continuer sur ma lancée', 2);



