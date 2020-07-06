CREATE TABLE pracownik (
	id INT PRIMARY KEY auto_increment,
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
	id INT PRIMARY KEY auto_increment,
	nazwa_stanowiska VARCHAR(50),
	opis VARCHAR(200),
	wyplata_na_danym_stanowisku DOUBLE
);

CREATE TABLE adres (
id INT PRIMARY KEY auto_increment,
ulica_numer_domu_mieszkania VARCHAR(50),
kod_pocztowy VARCHAR(6),
miejscowosc VARCHAR(50)
);

CREATE TABLE pracownik (
	id INT PRIMARY KEY auto_increment,
	imie VARCHAR(50),
	nazwisko VARCHAR(50)
);
