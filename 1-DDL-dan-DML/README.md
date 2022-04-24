# Modul 1 : Data Definition and Manipulation Language

Pada modul 1, fokus materi yaitu pada DDL (Data Definition Language) dan DML (Data Manipulation Language), dan yang akan kita lakukan adalah:

1. Membuat Database

2. Membuat Tabel

3. Memasukkan Data ke Tabel

4. Menampilkan Data

5. Mengubah Data

6. Menghapus Tabel

7. Menghapus Database


## Membuat Database

Database yang akan dibuat mengacu pada desain berikut ini:

![Desain Database](https://i.postimg.cc/Cxf1T1q4/praktikum-smbd-1-desain.png)

Sebelumnya pastikan server database telah aktif dan siap untuk menjalankan query.

Query untuk membuat database ialah:
```sql
CREATE DATABASE nama_database;
```

Pada praktikum kali ini kita namai database dengan nama mahasiswa, maka dari itu ubah `nama_database` dengan `mahasiswa`. 

```sql
CREATE DATABASE mahasiswa;
```

> Nama database harus unik, tidak boleh sama dengan database lain yang telah ada.
> Jika sebelumnya sudah memiliki database bernama mahasiswa, maka tidak akan dapat membuat database dengan nama yang sama.
> Jika memang demikian, silakan berinama database dengan nama yang berbeda.


## Membuat Tabel

Pada desain di atas ada 3 tabel yang akan dibuat yaitu tabel `mahasiswa`, `minat`, serta `minat_mahasiswa`.

Namun sebelum membuat tabel, jika menggunakan Shell/Terminal maka kita harus mengaktifkan dahulu database yang telah dibuat dengan query berikut:

```sql
USE nama_database;
```

> Ubah `nama_database` dengan `mahasiswa` atau sesuaikan dengan nama database yang telah kalian buat.

Pada dasarnya, query untuk membuat tabel adalah sebagai berikut:

```sql
CREATE TABLE nama_tabel (
  nama_kolom1 TIPEDATA(PANJANGDATA),
  nama_kolom2 TIPEDATA(PANJANGDATA),
  ...
);
```

Kita akan sesuaikan querynya sesuai desain yang sudah ada.


### Membuat tabel mahasiswa

Tabel ini merupakan tabel master yang berfungsi untuk menampung data-data mahasiswa. Tabel ini memiliki 4 atribut, diantaranya : `idMhs`, `nama`, `jKelamin`, dan `asalKota`.

Untuk membuat tabel, cermati kembali desain yang sudah ada karena kita membutuhkan nama atribut, tipe data, serta key yang digunakan.

Berikut adalah query untuk membuat tabel `mahasiswa`.

```sql
CREATE TABLE mahasiswa (
  idMhs VARCHAR(12),
  nama VARCHAR(255),
  jKelamin ENUM('L', 'P'),
  asalKota VARCHAR(255),
  PRIMARY KEY(idMhs)
);
```

> Setiap tabel setidaknya memiliki 1 atribut yang dijadikan PRIMARY KEY sebagai pembeda data satu dengan yang lainnya, dan dapat digunakan untuk merelasikan ke tabel lain.

### Membuat tabel minat

Tabel ini merupakan tabel master yang berfungsi untuk menampung kumpulan profesi IT yang mungkin diminati mahasiswa. Tabel ini memiliki 2 atribut, diantaranya : `id_minat`, dan `nama_minat`.

Untuk membuat tabel, cermati kembali desain yang sudah ada karena kita membutuhkan nama atribut, tipe data, serta key yang digunakan.

Berikut adalah query untuk membuat tabel `minat`.

```sql
CREATE TABLE minat (
  id_minat INT AUTO_INCREMENT,
  nama_minat VARCHAR(255),
  PRIMARY KEY(id_minat)
);
```

### Membuat tabel minat_mahasiswa

Tabel ini merupakan tabel transaksi yang berhubungan dengan tabel `mahasiswa` dan tabel `minat`. Tabel ini merepresentasikan minat setiap mahasiswa. Tabel ini memiliki 3 atribut, diantaranya : `id`, `idMhs` dan `id_minat`.

Untuk membuat tabel, cermati kembali desain yang sudah ada karena kita membutuhkan nama atribut, tipe data, serta key yang digunakan.

Berikut adalah query untuk membuat tabel `minat_mahasiswa`.

```sql
CREATE TABLE minat_mahasiswa (
  id INT AUTO_INCREMENT,
  idMhs VARCHAR(12),
  id_minat INT,
  PRIMARY KEY(id),
  FOREIGN KEY(idMhs) REFERENCES mahasiswa(idMhs),
  FOREIGN KEY(id_minat) REFERENCES minat(id_minat)
);
```

> FOREIGN KEY merupakan PRIMARY KEY pada tabel lain yang digunakan sebagai penghubung antar tabel


## Memasukkan Data ke Tabel

Query untuk memasukkan data ke tabel adalah sebagai berikut:

```sql
INSERT INTO nama_tabel(nama_kolom1, nama_kolom2, ...)
VALUES (nilai_kolom_1, nilai_kolom_2, ...);
```

Jika ingin mengisi data pada semua kolom, maka secara default kita bisa menuliskan nama tabelnya saja tanpa menuliskan nama kolomnya seperti berikut:

```sql
INSERT INTO nama_tabel
VALUES (nilai_kolom_1, nilai_kolom_2, ...);
```

Jika ingin mengisi beberapa baris data sekaligus, maka masing-masing baris data pada bagian VALUES dipisahkan dengan koma seperti berikut:

```sql
INSERT INTO nama_tabel VALUES
(nilai_kolom_1, nilai_kolom_2, ...),
(nilai_kolom_1, nilai_kolom_2, ...),
...
;
```


Kita akan sesuaikan querynya pada masing-masing tabel

### Memasukkan data ke tabel mahasiswa

Pada tabel mahasiswa, kita akan masukkan 20 data sekaligus dengan query berikut ini.

```sql
INSERT INTO mahasiswa VALUES
('200441100000', 'Bobbie', 'P', 'Acaraú'),
('200441100001', 'Alexio', 'L', 'Melíki'),
('200441100002', 'Ceil', 'P', 'Zainsk'),
('200441100003', 'Aharon', 'L', 'Dhaka'),
('200441100004', 'Harman', 'P', 'Muff'),
('200441100005', 'Jennilee', 'L', 'Voskop'),
('200441100006', 'Lewes', 'P', 'Pedrogão'),
('200441100007', 'Kalil', 'P', 'Šimanovci'),
('200441100008', 'Katerine', 'P', 'Mangkon Daja'),
('200441100009', 'Ree', 'L', 'Lugo'),
('200441100010', 'Garth', 'L', 'Jilong'),
('200441100011', 'Osmond', 'P', 'Evansville'),
('200441100012', 'Donny', 'L', 'Huacheng'),
('200441100013', 'Bay', 'L', 'Zhengji'),
('200441100014', 'Byron', 'L', 'Louisville'),
('200441100015', 'Codie', 'P', 'Tangzha'),
('200441100016', 'Nevins', 'L', 'Nanshe'),
('200441100017', 'Mareah', 'P', 'Anse Royale'),
('200441100018', 'Bernie', 'P', 'Ciakar'),
('200441100019', 'Tadeo', 'P', 'Fukuoka-shi');
```

### Memasukkan data ke tabel minat

Pada tabel minat, kita akan masukkan 13 data sekaligus dengan query berikut ini.

```sql
INSERT INTO minat VALUES
(1, 'Frontend Developer'),
(2, 'Backend Developer'),
(3, 'Fullstack Developer'),
(4, 'Cloud Engineer'),
(5, 'DevOps Engineer'),
(6, 'Android Developer'),
(7, 'iOS Developer'),
(8, 'Desktop App Developer'),
(9, 'Multiplatform App Developer'),
(10, 'Data Engineer'),
(11, 'Machine Learning Engineer'),
(12, 'Data Analyst'),
(13, 'Data Scientist');
```

### Memasukkan data ke tabel minat_mahasiswa

Pada tabel minat_mahasiswa, kita akan masukkan 20 data sekaligus dengan query berikut ini sehingga masing-masing mahasiswa memiliki 1 minat.

```sql
INSERT INTO minat_mahasiswa VALUES
(1, '200441100000', 6),
(2, '200441100001', 4),
(3, '200441100002', 10),
(4, '200441100003', 7),
(5, '200441100004', 13),
(6, '200441100005', 11),
(7, '200441100006', 4),
(8, '200441100007', 2),
(9, '200441100008', 2),
(10, '200441100009', 3),
(11, '200441100010', 3),
(12, '200441100011', 9),
(13, '200441100012', 6),
(14, '200441100013', 6),
(15, '200441100014', 6),
(16, '200441100015', 4),
(17, '200441100016', 8),
(18, '200441100017', 1),
(19, '200441100018', 11),
(20, '200441100019', 11);
```

## Menampilkan Data

Setelah berhasil memasukkan data, kita dapat menampilkan data-data tersebut dengan menggunakan query `SELECT`. Penulisannya adalah seperti berikut:

```sql
SELECT nama_kolom1, nama_kolom2, ...
FROM nama_tabel;
```

Jika ingin menampilkan semua kolom, maka dapat menggunakan simbol bintang (*)

```sql
SELECT *
FROM nama_tabel;
```

Jika ingin menampilkan data yang cocok dengan kondisi tertentu, maka dapat menggunakan klausa `WHERE`.

```sql
SELECT *
FROM nama_tabel
WHERE kondisi;
```


### Menampilkan nama-nama mahasiswa

Untuk menampilkan kolom nama pada tabel `mahasiswa`, jalankan query berikut:

```sql
SELECT nama FROM mahasiswa;
```
Untuk menampilkan data nama mahasiswa yang berjenis kelamin perempuan saja, dapat menambahkan kondisi pada querynya menjadi seperti berikut:

```sql
SELECT nama FROM mahasiswa WHERE jKelamin = 'P';
```

> Ubah kondisi jKelamin = 'L' untuk menampilkan nama mahasiswa berjenis kelamin laki-laki
> Kita juga bisa menerapkan klause `WHERE` untuk kondisi lainnya, misalnya untuk mendapatkan nama mahasiswa dengan id tertentu, mengetahui asal kota mahasiswa dari mahasiswa tertentu, dan sebagainya.


### Menampilkan semua data minat

Untuk menampilkan semua data pada tabel `minat` dapat menggunakan query berikut ini.

```sql
SELECT * FROM minat;
```

### Menampilkan data minat_mahasiswa

Untuk menampilkan semua data pada tabel `minat_mahasiswa` dapat menggunakan query berikut ini.

```sql
SELECT * FROM minat_mahasiswa;
```

### Menampilkan gabungan data mahasiswa dan minatnya

Query sebelumnya di atas hanya menampilkan 3 kolom yang sama-sama berisi id milik tabel yang berbeda-beda yaitu kolom `id` sebagai PRIMARY KEY tabel `minat_mahasiswa`, kolom `idMhs` sebagai FOREIGN KEY dari tabel `mahasiswa`, dan kolom `id_minat` juga FOREIGN KEY yang berasal dari tabel `minat`. Tampilan dari hasil query di atas tidak begitu bermakna karena data yang merepresentasikan id tersebut ada pada masing-masing tabel secara terpisah.

Untuk menampilkan gabungan data id mahasiswa, nama mahasiswa, serta minat dapat menggunakan query berikut:

```sql
SELECT mahasiswa.idMhs, mahasiswa.nama, minat.nama_minat
FROM mahasiswa, minat, minat_mahasiswa
WHERE
    mahasiswa.idMhs = minat_mahasiswa.idMhs
    AND
    minat.id_minat = minat_mahasiswa.id_minat;
```

## Mengubah Data

Untuk mengubah data pada suatu tabel, penulisan querynya adalah sebagai berikut:

```sql
UPDATE nama_tabel
SET nama_kolom_yang_diubah = 'nilai_baru'
WHERE kondisi;
```

Kita dapat mengubah data mahasiswa yang memiliki id 200441100014, yang asal kotanya adalah Louisville menjadi Lexington dengan query berikut:

```sql
UPDATE mahasiswa
SET asalKota = 'Lexington'
WHERE idMhs = '200441100014';
```

> Untuk mengubah nilai beberapa kolom sekaligus dapat menambahkan nama kolom dan nilai barunya pada bagian SET dengan dipisahkan tanda koma.

## Menghapus Tabel

Untuk menghapus tabel dapat menggunakan query `DROP TABLE` seperti berikut:

```sql
-- Menghapus Tabel `minat_mahasiswa`
DROP TABLE minat_mahasiswa;

-- Menghapus Tabel `minat`
DROP TABLE minat;

-- Menghapus Tabel `mahasiswa`
DROP TABLE mahasiswa;
```

> Tabel minat maupun tabel mahasiswa tidak dapat dihapus mendahului tabel minat_mahasiswa karena tabel minat_mahasiswa memiliki FOREIGN KEY yang terhubung dan datanya bergantung pada tabel minat serta tabel mahasiswa.

## Menghapus Database

Untuk menghapus database dapat menggunakan query `DROP DATABASE` seperti berikut:

```sql
DROP DATABASE mahasiswa;
```