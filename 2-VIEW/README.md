# Modul 2 - View

Pada modul 2, fokus materi yaitu mengenai View, dan yang akan kita lakukan adalah:

1. Persiapan

2. Membuat View

3. Menampilkan Data dari View

4. Menghapus View


## Persiapan

Pada [modul sebelumnya](https://github.com/yusufsugiono/praktikum-smbd/tree/main/1-DDL-dan-DML), kita telah menghapus database beserta isinya. Pada praktikum ini kita akan membutuhkan kembali database tersebut sehingga perlu membuat lagi dan mengembalikan data-data didalamnya.

Untuk melakukan hal tersebut, kita dapat mengulangi langkah 1 hingga langkah 3 pada modul sebelumnya.

Namun, kita juga dapat mengimpor data dengan melakukan langkah-langkah persiapan di bawah ini.


### Membuat Database

```sql
CREATE DATABASE mahasiswa;
```

### Mengimpor Data

Di repositori ini telah tersedia data hasil eksport dari database mahasiswa, yang isinya sama seperti yang telah kita lakukan pada modul sebelumnya. Datanya dapat di-download [disini](https://raw.githubusercontent.com/yusufsugiono/praktikum-smbd/main/mahasiswa.sql)


Kemudian untuk melakukan import dapat dengan mudah dilakukan menggunakan Phpmyadmin, Adminer, atau GUI yang lainnya.

Namun jika kita menggunakan Terminal/Shell dapat menggunakan perintah berikut:

```sql
-- Mengaktifkan/menggunakan database
USE mahasiswa;

-- Mengimpor data dari file yang sudah didownload
SOURCE path-to/mahasiswa.sql;
```



## Membuat View

Query untuk membuat view adalah sebagai berikut:

```sql
CREATE VIEW nama_view AS SELECT ... ;
```


View merupakan tabel virtual yang dapat digunakan untuk menyederhanakan pemanggilan query yang panjang. Pada modul sebelumnya kita telah berhasil menampilkan data idMhs, nama, serta minat mahasiswa yang merupakan gabungan dari beberapa tabel. Dapat kita ketahui bahwa query tersebut cukuplah panjang. Untuk itu kita bisa buat view agar kedepannya lebih mudah untuk menampilkan hal yang serupa. Untuk membuat view tersebut dapat menggunakan query berikut ini.


```sql
CREATE VIEW v_mhsdanminat AS
  SELECT mahasiswa.idMhs, mahasiswa.nama, minat.nama_minat
  FROM mahasiswa, minat, minat_mahasiswa
  WHERE
      mahasiswa.idMhs = minat_mahasiswa.idMhs
      AND
      minat.id_minat = minat_mahasiswa.id_minat;
```



## Menampilkan Data dari View

Setelah berhasil membuat view, berikut adalah query untuk menampilkan hasil data dari view yang telah kita buat.

```sql
SELECT * FROM v_mhsdanminat;
```



## Menghapus View

Untuk menghapus view dapat menggunakan query `DROP VIEW`

```sql
DROP VIEW v_mhsdanminat;
```