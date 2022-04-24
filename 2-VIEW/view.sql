CREATE VIEW v_mhsdanminat AS
  SELECT mahasiswa.idMhs, mahasiswa.nama, minat.nama_minat
  FROM mahasiswa, minat, minat_mahasiswa
  WHERE
      mahasiswa.idMhs = minat_mahasiswa.idMhs
      AND
      minat.id_minat = minat_mahasiswa.id_minat;