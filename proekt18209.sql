
CREATE TABLE `hora` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tri_imena` varchar(255) DEFAULT NULL,
  `nomer_na_lichna_karta` bigint DEFAULT NULL,
  `adres` varchar(255) DEFAULT NULL,
  `pol` enum('jena','muj') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

INSERT INTO `hora` VALUES (1,'Vladislav Dimitrov Dimitrov',123456,'ul \"Neofit Rilski\"','muj'),(2,'Georgi Georgiev Georgiev',456789,'ul\"Perusha\"','muj'),(3,'Mariq Ignatova Petrova',753159,'il\"Vuzrajdane\"','jena'),(4,'Venelin Venelinov Venelinov',123789,'ul\"Grigiriva\"','muj'),(5,'Plamena Petrova Dimitrova',123654,'ul\"Burdo\"','jena'),(6,'Viktoriq Viktorova Dimitrova',789456,'ul\"Georgivski\"','jena');

CREATE TABLE `oborudvane` (
  `id` int NOT NULL AUTO_INCREMENT,
  `razmer` decimal(10,0) DEFAULT NULL,
  `nomer` decimal(10,0) DEFAULT NULL,
  `tip_drehi` enum('qke','greika') DEFAULT NULL,
  `duljina` decimal(10,0) DEFAULT NULL,
  `cvqt` varchar(45) DEFAULT NULL,
  `godina_na_zakopuvane` int DEFAULT NULL,
  `tip_obuvki` enum('skiorski','snoubordistki') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

INSERT INTO `oborudvane` VALUES (1,45,20,'qke',40,'bql',2022,'skiorski'),(2,22,30,'greika',50,'cheren',2021,'snoubordistki'),(3,33,40,'qke',60,'cherven',2020,'skiorski'),(4,44,50,'greika',10,'lilav',2019,'snoubordistki'),(5,55,25,'qke',15,'rozov',2028,'skiorski');

CREATE TABLE `schupeno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kak_eschupeno` varchar(255) DEFAULT NULL,
  `ot_kogo_e_schupeno` varchar(255) DEFAULT NULL,
  `platena_globa` decimal(10,2) DEFAULT NULL,
  `hora_id` int NOT NULL,
  `oborudvane_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_schupeno_hora1_idx` (`hora_id`),
  KEY `fk_schupeno_oborudvane1_idx` (`oborudvane_id`),
  CONSTRAINT `fk_schupeno_hora1` FOREIGN KEY (`hora_id`) REFERENCES `hora` (`id`),
  CONSTRAINT `fk_schupeno_oborudvane1` FOREIGN KEY (`oborudvane_id`) REFERENCES `oborudvane` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

INSERT INTO `schupeno` VALUES (1,'padane ','Vladislav Dimitrov Dimitrov',300.00,1,1),(2,'bluskane','Grigor Dimitrov Venelinov',400.00,2,2),(3,'hluzgane','Plamen Dimitrov Petrov',500.00,3,3);

CREATE TABLE `zaemaniq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `v_kolko_chasa` datetime DEFAULT NULL,
  `za_kolko_vreme` datetime DEFAULT NULL,
  `na_kakva_cena` decimal(10,2) DEFAULT NULL,
  `ot_kogo` varchar(255) DEFAULT NULL,
  `oborudvane_id` int NOT NULL,
  `hora_id` int NOT NULL,
  PRIMARY KEY (`id`,`hora_id`),
  KEY `fk_zaemaniq_oborudvane_idx` (`oborudvane_id`),
  KEY `fk_zaemaniq_hora1_idx` (`hora_id`),
  CONSTRAINT `fk_zaemaniq_hora1` FOREIGN KEY (`hora_id`) REFERENCES `hora` (`id`),
  CONSTRAINT `fk_zaemaniq_oborudvane` FOREIGN KEY (`oborudvane_id`) REFERENCES `oborudvane` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `zaemaniq` VALUES (1,'2022-05-03 10:30:20','2022-05-04 11:30:10',300.00,'Vladislav Dimitrov Dimitrov',1,2);


