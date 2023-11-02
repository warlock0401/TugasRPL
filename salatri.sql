-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Nov 2023 pada 17.45
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salatri`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `makanan`
--

CREATE TABLE `makanan` (
  `IDMakanan` int(11) NOT NULL,
  `NamaMakanan` varchar(50) NOT NULL,
  `Harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `makanan`
--

INSERT INTO `makanan` (`IDMakanan`, `NamaMakanan`, `Harga`) VALUES
(1, 'Terong Balado', 4000),
(2, 'Ayam Goreng', 12000),
(3, 'Rendang', 10000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `IDOrder` int(11) NOT NULL,
  `Pesanan` varchar(50) NOT NULL,
  `Filter` varchar(100) NOT NULL,
  `IDPelanggan` int(11) NOT NULL,
  `IDResto` int(11) NOT NULL,
  `IDMakanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`IDOrder`, `Pesanan`, `Filter`, `IDPelanggan`, `IDResto`, `IDMakanan`) VALUES
(1, 'Nasi Goreng', 'Gorengan', 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `IDPelanggan` int(11) NOT NULL,
  `NamaPelanggan` varchar(250) CHARACTER SET armscii8 NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `NomorHP` varchar(100) NOT NULL,
  `Budget` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`IDPelanggan`, `NamaPelanggan`, `Email`, `Password`, `NomorHP`, `Budget`) VALUES
(1, 'Naufal', 'Naufal@gmail.com', 'Naufal12', '089900997899', 10000),
(2, 'Geo', 'Geo@gmail.com', 'Geo2', '08127883888', 2500),
(3, 'Ferdi', 'Ferdi@gmail.com', 'Ferdi1', '021300102', 15000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `resto`
--

CREATE TABLE `resto` (
  `IDResto` int(11) NOT NULL,
  `NamaResto` varchar(50) NOT NULL,
  `NomorHpResto` int(11) NOT NULL,
  `EmailResto` varchar(250) NOT NULL,
  `PassResto` varchar(250) NOT NULL,
  `AlamatResto` varchar(250) NOT NULL,
  `Pesanan` varchar(250) NOT NULL,
  `IDMakanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `resto`
--

INSERT INTO `resto` (`IDResto`, `NamaResto`, `NomorHpResto`, `EmailResto`, `PassResto`, `AlamatResto`, `Pesanan`, `IDMakanan`) VALUES
(1, 'G7', 2147483647, 'G7@gmail.com', '123abc', 'PBB Blok G Nomor 7', 'Nasi Goreng', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `makanan`
--
ALTER TABLE `makanan`
  ADD PRIMARY KEY (`IDMakanan`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`IDOrder`),
  ADD KEY `IDPelanggan` (`IDPelanggan`,`IDResto`,`IDMakanan`),
  ADD KEY `IDResto` (`IDResto`),
  ADD KEY `IDMakanan` (`IDMakanan`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`IDPelanggan`);

--
-- Indeks untuk tabel `resto`
--
ALTER TABLE `resto`
  ADD PRIMARY KEY (`IDResto`),
  ADD KEY `IDMakanan` (`IDMakanan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `makanan`
--
ALTER TABLE `makanan`
  MODIFY `IDMakanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `IDOrder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `IDPelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `resto`
--
ALTER TABLE `resto`
  MODIFY `IDResto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`IDPelanggan`) REFERENCES `pelanggan` (`IDPelanggan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`IDResto`) REFERENCES `resto` (`IDResto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`IDMakanan`) REFERENCES `makanan` (`IDMakanan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `resto`
--
ALTER TABLE `resto`
  ADD CONSTRAINT `resto_ibfk_1` FOREIGN KEY (`IDMakanan`) REFERENCES `makanan` (`IDMakanan`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
