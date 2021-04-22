-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Bulan Mei 2020 pada 10.06
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `omah_ayam`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(128) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_admin` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `nama_admin`, `level`) VALUES
(1, 'lailul', '121212', 'lailul huda', 'admin'),
(2, 'mila', '121212', 'mila sari', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `kd_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `tanggal_masuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_barang`
--

INSERT INTO `tbl_barang` (`kd_barang`, `nama_barang`, `jumlah_barang`, `harga_beli`, `harga_jual`, `tanggal_masuk`) VALUES
('A0001', 'ayam', 269, 25000, 30000, '2020-05-07'),
('A0002', 'telur', 209, 3000, 5000, '2020-05-07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_beli`
--

CREATE TABLE `tbl_beli` (
  `id` int(128) NOT NULL,
  `nofaktur` varchar(128) NOT NULL,
  `id_pembeli` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kd_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `hsatuan` int(50) NOT NULL,
  `jumlah_beli` int(50) NOT NULL,
  `harga` int(50) NOT NULL,
  `total` int(50) NOT NULL,
  `bayar` int(50) NOT NULL,
  `kembalian` int(50) NOT NULL,
  `jam` varchar(50) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_beli`
--

INSERT INTO `tbl_beli` (`id`, `nofaktur`, `id_pembeli`, `nama`, `kd_barang`, `nama_barang`, `hsatuan`, `jumlah_beli`, `harga`, `total`, `bayar`, `kembalian`, `jam`, `tanggal`) VALUES
(15, 'B0001', 'C0001', 'Okta', 'A0001', 'ayam', 30000, 10, 300000, 350000, 350000, 0, '21:01:12', '2020-05-19'),
(16, 'B0001', 'C0001', 'Okta', 'A0002', 'telur', 5000, 10, 50000, 350000, 350000, 0, '21:01:12', '2020-05-19'),
(17, 'B0002', 'C0001', 'Okta', 'A0001', 'ayam', 30000, 5, 150000, 175000, 200000, 25000, '16:57:01', '2020-05-23'),
(18, 'B0002', 'C0001', 'Okta', 'A0002', 'telur', 5000, 5, 25000, 175000, 200000, 25000, '16:57:01', '2020-05-23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pembeli`
--

CREATE TABLE `tbl_pembeli` (
  `id` varchar(128) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `no_telp` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pembeli`
--

INSERT INTO `tbl_pembeli` (`id`, `nama`, `no_telp`, `alamat`, `tanggal`) VALUES
('C0001', 'Okta', '08960909212', 'Yogyakarta', '2020-05-19'),
('C0002', 'Kartika Sari', '081209082', 'Yogyakarta', '2020-05-19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pengiriman`
--

CREATE TABLE `tbl_pengiriman` (
  `id` int(128) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `id_supplier` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kd_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga_beli` int(50) NOT NULL,
  `jumlah_kirim` int(50) NOT NULL,
  `harga` int(50) NOT NULL,
  `total` int(50) NOT NULL,
  `bayar` int(50) NOT NULL,
  `kembalian` int(50) NOT NULL,
  `jam` varchar(50) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pengiriman`
--

INSERT INTO `tbl_pengiriman` (`id`, `nofaktur`, `id_supplier`, `nama`, `kd_barang`, `nama_barang`, `harga_beli`, `jumlah_kirim`, `harga`, `total`, `bayar`, `kembalian`, `jam`, `tanggal`) VALUES
(9, 'P0001', 'S0001', 'Mahfud Sentosa', 'A0001', 'ayam', 25000, 10, 250000, 280000, 300000, 20000, 'Jam', '2020-05-19'),
(10, 'P0001', 'S0001', 'Mahfud Sentosa', 'A0002', 'telur', 3000, 10, 30000, 280000, 300000, 20000, 'Jam', '2020-05-19'),
(11, 'P0002', 'S0001', 'Mahfud Sentosa', 'A0001', 'ayam', 25000, 10, 250000, 280000, 300000, 20000, '16:55:03', '2020-05-23'),
(12, 'P0002', 'S0001', 'Mahfud Sentosa', 'A0002', 'telur', 3000, 10, 30000, 280000, 300000, 20000, '16:55:03', '2020-05-23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `id` varchar(128) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `no_telp` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`id`, `nama`, `no_telp`, `alamat`, `tanggal`) VALUES
('S0001', 'Mahfud Sentosa', '0812080809', 'Yogyakarta', '2020-05-19'),
('S0002', 'Fadilah Abadi', '0812080909', 'Yogyakarta', '2020-05-19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tmp_beli`
--

CREATE TABLE `tbl_tmp_beli` (
  `id_tmp` int(50) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `id_pembeli` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kd_barang` varchar(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `hsatuan` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Trigger `tbl_tmp_beli`
--
DELIMITER $$
CREATE TRIGGER `batal` AFTER DELETE ON `tbl_tmp_beli` FOR EACH ROW BEGIN
UPDATE tbl_barang SET jumlah_barang = jumlah_barang + OLD.jumlah_beli
WHERE kd_barang = OLD.kd_barang;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `beli` AFTER INSERT ON `tbl_tmp_beli` FOR EACH ROW BEGIN 
UPDATE tbl_barang SET jumlah_barang = jumlah_barang - new.jumlah_beli 
WHERE kd_barang = new.`kd_barang`; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tmp_kirim`
--

CREATE TABLE `tbl_tmp_kirim` (
  `id_tmp` int(50) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `id_supplier` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kd_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga_beli` int(50) NOT NULL,
  `jumlah_kirim` int(50) NOT NULL,
  `harga` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Trigger `tbl_tmp_kirim`
--
DELIMITER $$
CREATE TRIGGER `batalkirim` AFTER DELETE ON `tbl_tmp_kirim` FOR EACH ROW BEGIN
UPDATE tbl_barang SET jumlah_barang = jumlah_barang - OLD.jumlah_kirim
WHERE kd_barang = OLD.kd_barang;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `kirim` AFTER INSERT ON `tbl_tmp_kirim` FOR EACH ROW BEGIN 
UPDATE tbl_barang SET jumlah_barang = jumlah_barang + new.jumlah_kirim 
WHERE kd_barang = new.`kd_barang`; 
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indeks untuk tabel `tbl_beli`
--
ALTER TABLE `tbl_beli`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_pembeli`
--
ALTER TABLE `tbl_pembeli`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_pengiriman`
--
ALTER TABLE `tbl_pengiriman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_tmp_beli`
--
ALTER TABLE `tbl_tmp_beli`
  ADD PRIMARY KEY (`id_tmp`);

--
-- Indeks untuk tabel `tbl_tmp_kirim`
--
ALTER TABLE `tbl_tmp_kirim`
  ADD PRIMARY KEY (`id_tmp`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_beli`
--
ALTER TABLE `tbl_beli`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tbl_pengiriman`
--
ALTER TABLE `tbl_pengiriman`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tbl_tmp_beli`
--
ALTER TABLE `tbl_tmp_beli`
  MODIFY `id_tmp` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_tmp_kirim`
--
ALTER TABLE `tbl_tmp_kirim`
  MODIFY `id_tmp` int(50) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
