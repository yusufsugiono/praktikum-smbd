# Modul 4 - SQL

Pada modul 4, fokus materi yaitu mengenai SQL, dan yang akan kita lakukan adalah:

1. Menyaring Data

2. Mengurutkan Data

3. Menerapkan Ekspresi Query 

4. Agregasi dan Pengelompokan Data

5. Multiple Table Query

6. Subquery


## Menyaring Data

Saat menampilkan data, kita dapat melakukan penyaringan data untuk mendapatkan data-data dengan kriteria tertentu. Untuk menyaring data dapat menggunakan klausa `WHERE` dan diikuti oleh operator pembanding. Berikut adalah beberapa contoh penyaringan data.

### Menampilkan data mahasiswa yang berasal dari satu kota tertentu

Untuk menampilkan data mahasiswa yang berasal dari satu kota tertentu dapat menggunakan operator sama dengan (`=`) untuk mencocokkan data pada kolom `asalKota`

```sql
SELECT * FROM mahasiswa WHERE asalKota = 'Dhaka';
```


### Menampilkan data mahasiswa yang berasal dari beberapa kota tertentu

Untuk menampilkan data mahasiswa yang berasal dari beberapa kota tertentu dapat menggunakan operator `IN`. Contoh penulisannya adalah seperti berikut.

```sql
SELECT * FROM mahasiswa
WHERE asalKota IN ('Dhaka', 'Louisville', 'Evansville');
```

Jika dijalankan maka akan tampil data mahasiswa-mahasiswa yang berasal dari kota Dhaka, Louisville, dan Evansville.


### Menampilkan data mahasiswa dengan jangkauan ID tertentu

Berikut ini adalah contoh query yang digunakan untuk menampilkan data mahasiswa yang memiliki `idMhs` dari 200441100003 sampai 200441100009.

```sql
SELECT * FROM mahasiswa
WHERE idMhs BETWEEN '200441100003' AND '200441100009';
```

### Mencari Data Mahasiswa berdasarkan Nama

Misalnya saja saat kita ingin mengetahui data mahasiswa yang bernama Alex, tapi kita tidak yakin dengan nama lengkapnya maka dapat menjalankan query dengan operator `LIKE` seperti berikut ini

```sql
SELECT * FROM mahasiswa
WHERE nama LIKE '%alex%';
```

> `%alex%` akan menampilkan data mahasiswa yang mengandung kata 'alex' pada kolom `nama` entah berada di depan, tengah, ataupun belakang namanya. 


## Mengurutkan Data

Untuk mengurutkan data dapat menggunakan klausa `ORDER BY`. Ada 2 jenis pengurutan data, yaitu Ascending dan Descending.

### Pengurutan Ascending

Sebagai contoh, misalnya kita ingin menampilkan seluruh data mahasiswa yang diurutkan berdasarkan namanya secara ascending (dari kecil ke terbesar) maka dapat menjalankan query berikut ini.

```sql
SELECT * FROM mahasiswa
ORDER BY nama ASC;
```

Query tersebut akan menampilkan data mahasiswa urut dari nama yang berawal A hingga Z.

By default, klausa `ORDER BY` akan mengurutkan secara ascending sehingga bisa juga dijalankan tanpa menuliskan `ASC`.

> Pengurutan juga dapat diterapkan pada kolom yang berisi data numerik


### Pengurutan Descending

Pengurutan ini adalah kebalikan dari sebelumnya, yaitu menampilkan data secara urut dari terbesar ke terkecil, atau jika datanya berupa alphabet maka akan urut dari Z ke A.

```sql
SELECT * FROM mahasiswa
ORDER BY nama DESC;
```


## Menerapkan Eskpresi Query

### Mengganti nama field keluaran

Terkadang kita ingin mengubah nama field atau kolom saat menampilkan datanya. Untuk menerapkannya dapat menggunakan klausa `AS`. Hal ini hanya akan mengubah nama kolom di keluaran hasil query-nya saja, tidak benar-benar mengubah nama kolom pada struktur tabelnya.

Misalnya adalah untuk menampilkan kolom `jKelamin` agar tampil `jenis_kelamin`, maka jalankan query berikut ini.

```sql
SELECT nama, jKelamin AS jenis_kelamin
FROM mahasiswa;
```

### Menambahkan baris teks field keluaran

Kita dapat menambahkan baris teks pada kolom keluaran. Sebagai contoh, jalankan query berikut ini.

```sql
SELECT nama, 'lahir di', asalKota
FROM mahasiswa;
```

### Ekspresi Kondisi

Kita dapat menerapkan ekspresi kondisi saat menampilkan data. Misalnya saat kita ingin data dengan jenis kelamin `L` dan `P` ditampilkan sebagai `Laki-laki` dan `Perempuan`.

```sql
SELECT
  nama,
  CASE jKelamin WHEN 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin
FROM mahasiswa;
```


## Agregasi dan Pengelompokan Data

Agregasi dan pengelompokkan data digunakan untuk mengolah data mentah menjadi data statistik sehingga kita mendapatkan informasi atau wawasan dari data yang ada. Fungsi agregasi diantaranya adalah `COUNT`, `AVG`, `MAX`, `MIN`, `SUM`, dan sebagainya. Penggunaan fungsi agregasi biasanya juga bersamaan dengan pengelompokan data menggunakan `GROUP BY` dan `HAVING`.

### Penerapan agregasi dan klausa GROUP BY

Pada dasarnya `GROUP BY` digunakan untuk mengelompokkan data tertentu. Biasanya digunakan bersamaan dengan agregasi. Misalnya ketika ingin mengetahui jumlah mahasiswa yang dikelompokkan berdasarkan gendernya. Kita dapat menggunakan fungsi agregasi `COUNT` seperti berikut ini.

```sql
SELECT jKelamin, COUNT(jKelamin)
FROM mahasiswa
GROUP BY jKelamin;
```

> Penggunaannya dapat dikombinasikan dengan ORDER BY untuk mengurutkan datanya

### Penerapan klausa HAVING

Saat melakukan agregasi dan pengelompokan data, kita dapat membatasi datanya dengan `HAVING`. Misalnya berikut ini adalah query untuk menampilkan jumlah bidang yang diminati mahasiswa.

```sql
SELECT minat.nama_minat AS bidang, COUNT(minat_mahasiswa.id_minat) AS jumlah
FROM minat, mahasiswa, minat_mahasiswa
WHERE
  minat.id_minat=minat_mahasiswa.id_minat
  AND 
  mahasiswa.idMhs=minat_mahasiswa.idMhs
GROUP BY minat_mahasiswa.id_minat;
```

Maka akan ditampilkan bidang yang diminati beserta jumlahnya. Untuk menampilkan data bidang dengan jumlah peminat lebih dari atau sama dengan 3 dapat menerapkan `HAVING` seperti berikut ini.

```sql
SELECT minat.nama_minat AS bidang, COUNT(minat_mahasiswa.id_minat) AS jumlah
FROM minat, mahasiswa, minat_mahasiswa
WHERE
  minat.id_minat=minat_mahasiswa.id_minat
  AND 
  mahasiswa.idMhs=minat_mahasiswa.idMhs
GROUP BY minat_mahasiswa.id_minat
HAVING COUNT(minat_mahasiswa.id_minat) >= 3;
```

Untuk mengurutkan datanya berdasarkan jumlah terbesar ke terkecil, dapat dikombinasikan dengan klausa `ORDER BY`

```sql
SELECT minat.nama_minat AS bidang, COUNT(minat_mahasiswa.id_minat) AS jumlah
FROM minat, mahasiswa, minat_mahasiswa
WHERE
  minat.id_minat=minat_mahasiswa.id_minat
  AND 
  mahasiswa.idMhs=minat_mahasiswa.idMhs
GROUP BY minat_mahasiswa.id_minat
HAVING COUNT(minat_mahasiswa.id_minat) >= 3
ORDER BY COUNT(minat_mahasiswa.id_minat) DESC;
```

## Multiple Table Query

Kita dapat melakukan query untuk menampilkan data dari berbagai tabel. Hal ini sebenarnya telah kita lakukan di beberapa modul sebelumnya, misalnya untuk menampilkan nama mahasiswa dan bidang yang diminatinya dengan query berikut ini.

```sql
SELECT mahasiswa.nama, minat.nama_minat AS bidang
FROM mahasiswa, minat, minat_mahasiswa
WHERE mahasiswa.idMhs=minat_mahasiswa.idMhs AND minat.id_minat=minat_mahasiswa.id_minat
ORDER BY minat.nama_minat;
```

Namun dapat juga menggunakan `JOIN` sebagai berikut:

```sql
SELECT mahasiswa.nama, minat.nama_minat AS bidang
FROM (mahasiswa INNER JOIN minat_mahasiswa ON mahasiswa.idMhs=minat_mahasiswa.idMhs) INNER JOIN minat ON minat.id_minat=minat_mahasiswa.id_minat
ORDER BY minat.id_minat;
```

Klausa JOIN memiliki beberapa jenis yaitu INNER JOIN, RIGHT JOIN, LEFT JOIN, dan FULL JOIN. Untuk referensi bisa dilihat [di sini](https://www.w3schools.com/sql/sql_join.asp)

## Subquery

Subquery merupakan query yang berada di dalam query. Contohnya adalah pada query berikut ini.

```sql
SELECT MAX(jumlah) AS jml FROM
(
  SELECT minat.nama_minat, COUNT(minat_mahasiswa.id_minat) AS jumlah
FROM minat, mahasiswa, minat_mahasiswa
WHERE
  minat.id_minat=minat_mahasiswa.id_minat
  AND 
  mahasiswa.idMhs=minat_mahasiswa.idMhs
GROUP BY minat_mahasiswa.id_minat
) AS jumlah;
```