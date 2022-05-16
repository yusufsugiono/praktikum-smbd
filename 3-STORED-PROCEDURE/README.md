# Modul 3 - Stored Procedure

Pada modul 2, fokus materi yaitu mengenai Stored Procedure, dan yang akan kita lakukan adalah:

1. Membuat dan Memanggil Stored Procedure

2. Menghapus Stored Procedure

3. Menampilkan Daftar Stored Procedure

4. Menampilkan Struktur Stored Procedure

## Membuat dan Memanggil Stored Procedure

### Tanpa parameter

Kita dapat membuat stored procedure tanpa menambahkan parameter apapun ke dalamnya. Pada contoh berikut ini kita akan membuat stored procedure untuk menampilkan seluruh data pada tabel mahasiswa.

```sql
DELIMITER //
CREATE PROCEDURE showMhs()
BEGIN
  SELECT * FROM mahasiswa;
END //
DELIMITER ;
```

Untuk memanggilnya dapat menggunakan perintah `CALL` seperti berikut ini.

```sql
CALL showMhs();
```

### Parameter IN

Stored Procedure juga dapat berisi parameter untuk dimasukkan dan dieksekusi pada querynya. Berikut ini adalah contoh stored procedure untuk menampilkan data mahasiswa berdasarkan jenis kelamin tertentu.

```sql
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
```

Untuk menjalankannya, dapat menggunakan perintah berikut.

```sql
-- Menampilkan data mahasiswa berjenis kelamin laki-laki
CALL showMhsByGender('L');

-- Menampilkan data mahasiswa berjenis kelamin perempuan
CALL showMhsByGender('P');
```

### Parameter OUT

Parameter OUT digunakan untuk menyimpan keluaran dalam variabel. Berikut ini contoh penggunaannya dalam sebuah stored procedure untuk menghitung jumlah mahasiswa.

```sql
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
```

Berikut ini adalah query untuk menjalankannya.

```sql
-- Menjalankan stored procedure
CALL countMhs(@jml_mhs);

-- Menampilkan jumlah mahasiswa
SELECT @jml_mhs;
```

### Parameter INOUT

Penggunaan IN dan OUT dapat dikombinasikan menjadi satu dalam pembuatan stored procedure. Sebagai contoh berikut ini adalah stored procedure yang menggunakan IN dan OUT untuk menghitung jumlah mahasiswa berdasarkan jenis kelamin tertentu.

```sql
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
```

Untuk menjalankan stored procedure tersebut, dapat menggunakan perintah sql berikut ini.

```sql
-- Menampilkan jumlah mahasiswa berjenis kelamin laki-laki
CALL countMhsByGender('L', @jml);
SELECT @jml;

-- Menampilkan jumlah mahasiswa berjenis kelamin perempuan
CALL countMhsByGender('P', @jml);
SELECT @jml;
```

## Menghapus Stored Procedure

Untuk menghapus stored procedure dapat menggunakan perintah berikut.

```sql
DROP PROCEDURE nama_stored_procedure;
```

Contohnya saat kita mencoba hapus stored procedure `showMhs()`, maka querynya seperti berikut ini.

```sql
DROP PROCEDURE showMhs;
```

## Menampilkan Daftar Stored Procedure

Untuk menampilkan daftar stored procedure yang telah kita buat pada database mahasiswa, dapat menggunakan perintah berikut ini.

```sql
SHOW PROCEDURE STATUS WHERE Db='mahasiswa';
```

## Menampilkan Struktur Stored Procedure

Ketika kita ingin menampilkan struktur / query yang menyusun sebuah stored procedure yang telah ada, maka jalankan query berikut ini.

```sql
SHOW CREATE PROCEDURE nama_stored_procedure;
```

Misalnya kita ingin menampilkan struktur dari `countMhsByGender()`, maka querynya dapat diubah menjadi seperti berikut.


```sql
SHOW CREATE PROCEDURE countMhsByGender;
```