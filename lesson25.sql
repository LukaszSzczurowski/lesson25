CREATE TABLE pracownik (
	id BIGINT PRIMARY KEY auto_increment,
	imie VARCHAR(20),
	nazwisko VARCHAR(50) NOT NULL,
	wyplata DECIMAL(8, 2),
	data_urodzenia DATE,
	stanowisko VARCHAR(50)
);

INSERT INTO pracownik (imie, nazwisko, wyplata, data_urodzenia, stanowisko)
VALUES 	('Lukasz', 'Zagrobelny', 2345.3, '2010-03-10', 'Dyrektor'),
		('Maria', 'Osiłek', 9002.33, '1956-01-12', 'Księgowa'),
        ('Dorota', 'Patalach', 5679.3, '1980-10-03', 'Specjalista'),
        ('Karol', 'Tekstura', 10000, '1999-09-08', 'Starszy Specjalista'),
        ('Michal', 'Wismowski', 6500, '1976-03-05', 'Vice Dyrektor'),
        ('Małgorzata', 'Kotebska', 3450, '1990-09-03', 'Prezes');

SELECT * 
FROM pracownik;

SELECT * 
FROM pracownik 
ORDER BY nazwisko;

SELECT *
FROM pracownik
WHERE stanowisko  = 'Prezes';

SELECT *
FROM pracownik
WHERE data_urodzenia  <= '1990-07-06';

UPDATE pracownik
SET wyplata = wyplata * 1.1 
WHERE id = 3;

SELECT wyplata * 1.1 AS premia_10
FROM pracownik
WHERE stanowisko = 'Prezes';

DELETE 
FROM pracownik 
ORDER BY data_urodzenia DESC
LIMIT 1;

DROP TABLE pracownik;

CREATE TABLE stanowisko (
	id BIGINT PRIMARY KEY auto_increment,
	nazwa_stanowiska VARCHAR(50),
	opis VARCHAR(200),
	wyplata_na_danym_stanowisku DECIMAL
);

CREATE TABLE adres (
id BIGINT PRIMARY KEY auto_increment,
ulica_numer_domu_mieszkania VARCHAR(50),
kod_pocztowy VARCHAR(6),
miejscowosc VARCHAR(50)
);

CREATE TABLE pracownik (
	id BIGINT PRIMARY KEY auto_increment,
	imie VARCHAR(50),
	nazwisko VARCHAR(50),
    id_adres BIGINT,
    FOREIGN KEY (id_adres) REFERENCES adres(id),
    id_stanowisko BIGINT,
    FOREIGN KEY (id_stanowisko) REFERENCES stanowisko(id)
);

drop table pracownik;

INSERT INTO stanowisko(nazwa_stanowiska, opis, wyplata_na_danym_stanowisku) VALUES
('Kierownik', 'Kieruje zasobami', 7277),
('Specjalista', 'Marketing i reklama', 8500);

SELECT * FROM stanowisko;

INSERT INTO adres(ulica_numer_domu_mieszkania, kod_pocztowy, miejscowosc) VALUES
('Kwiatowa 27', '11-552', 'Opole'),
('Liliowa 8/22', '03-001', 'Lublin');

SELECT * FROM adres;

INSERT INTO pracownik(imie, nazwisko, id_adres, id_stanowisko) VALUES
('Lukasz', 'Rozwalka', 1, 1),
('Ania', 'Kowalska', 2, 2),
('Ola', 'Opel', 1, 2);

SELECT * FROM pracownik;

SELECT *
FROM pracownik p
JOIN adres a JOIN stanowisko s ON p.id_adres = a.id AND p.id_stanowisko = s.id;

SELECT SUM(wyplata_na_danym_stanowisku) AS suma_wyplat_wszystkich_pracowników
FROM stanowisko;

SELECT *
FROM pracownik p JOIN adres a ON p.id_adres = a.id 
WHERE kod_pocztowy = '11-552';
