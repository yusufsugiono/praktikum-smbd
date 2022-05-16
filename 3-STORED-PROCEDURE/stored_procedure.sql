DELIMITER //
CREATE PROCEDURE showMhs()
BEGIN
  SELECT * FROM mahasiswa;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE showMhsByGender
(
  IN gender VARCHAR(1)
)
BEGIN
  SELECT * FROM mahasiswa
  WHERE jKelamin = gender;
END //
DELIMITER;

DELIMITER //
CREATE PROCEDURE countMhs
(
  OUT jml_mhs INT(3)
)
BEGIN
  SELECT COUNT(idMhs)
  INTO jml_mhs
  FROM mahasiswa;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE countMhsByGender
(
  IN gender VARCHAR(1),
  OUT jml INT(3)
)
BEGIN
  SELECT COUNT(idMhs)
  INTO jml
  FROM mahasiswa
  WHERE jKelamin = gender;
END //
DELIMITER ;