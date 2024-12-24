-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlynhansu
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bangchamcong`
--

DROP TABLE IF EXISTS `bangchamcong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bangchamcong` (
  `machamcong` int NOT NULL,
  `ngaytrongthang` int NOT NULL,
  `trangthai` varchar(5) NOT NULL,
  UNIQUE KEY `UC_bangchamcong` (`machamcong`,`ngaytrongthang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bangchamcong`
--

LOCK TABLES `bangchamcong` WRITE;
/*!40000 ALTER TABLE `bangchamcong` DISABLE KEYS */;
INSERT INTO `bangchamcong` VALUES (5,1,'null'),(5,2,'x'),(5,3,'x'),(5,4,'x'),(5,5,'x'),(5,6,'1/2'),(5,7,'n'),(5,8,'null'),(5,9,'x'),(5,10,'1/2'),(5,11,'x'),(5,12,'x'),(5,13,'x'),(5,14,'x'),(5,15,'null'),(5,16,'x'),(5,17,'x'),(5,18,'x'),(5,19,'x'),(5,20,'x'),(5,21,'x'),(5,22,'null'),(5,23,'x'),(5,24,'x'),(5,25,'x'),(5,26,'x'),(5,27,'x'),(5,28,'x'),(5,29,'null'),(5,30,'x'),(5,31,'x'),(9,1,'null'),(9,2,'x'),(9,3,'x'),(9,4,'x'),(9,5,'x'),(9,6,'x'),(9,7,'x'),(9,8,'null'),(9,9,'n'),(9,10,'x'),(9,15,'null'),(9,29,'null');
/*!40000 ALTER TABLE `bangchamcong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chamcong`
--

DROP TABLE IF EXISTS `chamcong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chamcong` (
  `machamcong` int NOT NULL AUTO_INCREMENT,
  `manv` int NOT NULL,
  `thang` date NOT NULL,
  `songaylam` float DEFAULT NULL,
  `songaynghi` int DEFAULT NULL,
  `songaychunhat` int DEFAULT NULL,
  PRIMARY KEY (`machamcong`),
  UNIQUE KEY `UC_chamcong` (`manv`,`thang`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamcong`
--

LOCK TABLES `chamcong` WRITE;
/*!40000 ALTER TABLE `chamcong` DISABLE KEYS */;
INSERT INTO `chamcong` VALUES (5,15,'2024-01-01',NULL,NULL,NULL),(9,16,'2024-01-01',NULL,NULL,NULL);
/*!40000 ALTER TABLE `chamcong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietluong`
--

DROP TABLE IF EXISTS `chitietluong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietluong` (
  `maluong` int NOT NULL,
  `luongcoban` int NOT NULL,
  `tongsongay` float NOT NULL,
  `songaynghi` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietluong`
--

LOCK TABLES `chitietluong` WRITE;
/*!40000 ALTER TABLE `chitietluong` DISABLE KEYS */;
/*!40000 ALTER TABLE `chitietluong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chucvu`
--

DROP TABLE IF EXISTS `chucvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chucvu` (
  `macv` int NOT NULL AUTO_INCREMENT,
  `tencv` varchar(256) NOT NULL,
  `phucap` double NOT NULL,
  `ghichu` text NOT NULL,
  PRIMARY KEY (`macv`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chucvu`
--

LOCK TABLES `chucvu` WRITE;
/*!40000 ALTER TABLE `chucvu` DISABLE KEYS */;
INSERT INTO `chucvu` VALUES (1,'Nhân Viên',0.1,'nv'),(2,'Trưởng Phòng',0.2,'tp');
/*!40000 ALTER TABLE `chucvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopdonglaodong`
--

DROP TABLE IF EXISTS `hopdonglaodong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopdonglaodong` (
  `mahd` int NOT NULL AUTO_INCREMENT,
  `manv` int NOT NULL,
  `tungay` date NOT NULL,
  `denngay` date NOT NULL,
  `diadiemlamviec` varchar(256) NOT NULL,
  `thoigianlamviec` int NOT NULL,
  `hesoluong` double NOT NULL,
  `macv` int NOT NULL,
  `maphong` int DEFAULT NULL,
  PRIMARY KEY (`mahd`),
  KEY `FK_PhongBan_HD` (`maphong`),
  KEY `FK_ChucVu_HD` (`macv`),
  KEY `FK_NhanVien_HD` (`manv`),
  CONSTRAINT `FK_ChucVu_HD` FOREIGN KEY (`macv`) REFERENCES `chucvu` (`macv`),
  CONSTRAINT `FK_NhanVien_HD` FOREIGN KEY (`manv`) REFERENCES `nhanvien` (`manv`),
  CONSTRAINT `FK_PhongBan_HD` FOREIGN KEY (`maphong`) REFERENCES `phongban` (`maphong`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopdonglaodong`
--

LOCK TABLES `hopdonglaodong` WRITE;
/*!40000 ALTER TABLE `hopdonglaodong` DISABLE KEYS */;
INSERT INTO `hopdonglaodong` VALUES (44,15,'2019-11-20','2019-11-21','Tp HCM',8,1,1,1),(45,16,'2019-11-20','2019-11-21','Tp HCM',8,1,1,NULL),(46,16,'2019-11-20','2019-11-21','Tp HCM',8,1,1,1),(47,16,'2019-11-20','2019-11-21','Tp HCM',8,1,2,1),(48,16,'2019-11-20','2019-11-21','Tp HCM',8,1,1,1),(49,15,'2019-11-20','2019-11-21','Tp HCM',8,1,2,1),(50,15,'2019-11-20','2019-11-21','Tp HCM',8,1,1,1),(51,16,'2019-11-20','2019-11-26','Tp HCM',8,1,2,1),(52,15,'2019-11-20','2019-11-21','Tp HCM',8,1,1,NULL),(53,15,'2019-11-20','2019-11-26','Tp HCM',8,1,1,1),(54,17,'2019-11-22','2099-12-31','Tp HCM',8,1,1,NULL),(55,16,'2019-11-20','2019-11-29','Tp HCM',8,1,1,1),(56,15,'2019-11-20','2099-12-31','Tp HCM',8,1,2,1),(57,18,'2019-11-26','2099-12-31','Tp HCM',8,1,1,NULL),(58,16,'2019-11-20','2019-11-29','Tp HCM',8,1,1,NULL),(59,16,'2019-11-20','2099-12-31','Tp HCM',8,1,1,1),(60,19,'2019-12-02','2099-12-31','Tp HCM',8,1,1,NULL),(61,20,'2019-12-02','2099-12-31','Tp HCM',8,1,1,NULL),(62,21,'2019-12-07','2099-12-31','Tp HCM',8,1,1,NULL);
/*!40000 ALTER TABLE `hopdonglaodong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khenthuong`
--

DROP TABLE IF EXISTS `khenthuong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khenthuong` (
  `makhenthuong` int NOT NULL AUTO_INCREMENT,
  `manv` int NOT NULL,
  `ngaykhenthuong` date NOT NULL,
  `hinhthuc` varchar(256) NOT NULL,
  `lydo` varchar(256) NOT NULL,
  `tienthuong` int NOT NULL,
  PRIMARY KEY (`makhenthuong`),
  KEY `FK_NhanVien` (`manv`),
  CONSTRAINT `FK_NhanVien` FOREIGN KEY (`manv`) REFERENCES `nhanvien` (`manv`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khenthuong`
--

LOCK TABLES `khenthuong` WRITE;
/*!40000 ALTER TABLE `khenthuong` DISABLE KEYS */;
INSERT INTO `khenthuong` VALUES (1,15,'2017-01-05','TM','test',500000),(3,16,'2019-12-05','CK','test lần 2',100000);
/*!40000 ALTER TABLE `khenthuong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luong`
--

DROP TABLE IF EXISTS `luong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `luong` (
  `maluong` int NOT NULL AUTO_INCREMENT,
  `luongcoban` int NOT NULL,
  PRIMARY KEY (`maluong`),
  UNIQUE KEY `unq_luong` (`luongcoban`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luong`
--

LOCK TABLES `luong` WRITE;
/*!40000 ALTER TABLE `luong` DISABLE KEYS */;
INSERT INTO `luong` VALUES (1,4000000),(2,8000000),(3,15000000);
/*!40000 ALTER TABLE `luong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luongthang`
--

DROP TABLE IF EXISTS `luongthang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `luongthang` (
  `maluongthang` int NOT NULL AUTO_INCREMENT,
  `manhanvien` int NOT NULL,
  `thang` datetime NOT NULL,
  `tongluong` int NOT NULL,
  PRIMARY KEY (`maluongthang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luongthang`
--

LOCK TABLES `luongthang` WRITE;
/*!40000 ALTER TABLE `luongthang` DISABLE KEYS */;
/*!40000 ALTER TABLE `luongthang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `manv` int NOT NULL AUTO_INCREMENT,
  `honv` varchar(256) NOT NULL,
  `tennv` varchar(256) NOT NULL,
  `socmnd` varchar(256) NOT NULL,
  `ngaysinh` date NOT NULL,
  `gioitinh` varchar(256) NOT NULL,
  `sdt` varchar(256) NOT NULL,
  `diachi` varchar(256) NOT NULL,
  `maluong` int DEFAULT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`manv`),
  KEY `fk_luong_nv` (`maluong`),
  CONSTRAINT `fk_luong_nv` FOREIGN KEY (`maluong`) REFERENCES `luong` (`maluong`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (15,'Nguyễn Văn','D','123456789','1999-01-01','CT','0909090909','123 Abc',1,0),(16,'Nguyễn Thị','B','159874236','1999-01-01','CT','0909090908','123 Abc',1,0),(17,'abc','def','1234567897','1999-01-01','CT','123567890','123 abc',1,1),(18,'hello','hello','123456798','1999-01-01','CT','0909090807','123 ghj',1,1),(19,'Nguyễn Văn','FFF','123456789','1999-01-01','CT','0909090909','123 Abc',2,0),(20,'Nguyễn Văn','Xyz','123456789','1999-01-01','CT','0909090909','123 Abc',1,0),(21,'lương','lương','036985214','1999-11-11','CT','0123456789','123 Abc',1,0);
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phanquyen`
--

DROP TABLE IF EXISTS `phanquyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phanquyen` (
  `maphanquyen` int NOT NULL AUTO_INCREMENT,
  `tenphanquyen` varchar(64) NOT NULL,
  PRIMARY KEY (`maphanquyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phanquyen`
--

LOCK TABLES `phanquyen` WRITE;
/*!40000 ALTER TABLE `phanquyen` DISABLE KEYS */;
/*!40000 ALTER TABLE `phanquyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phongban`
--

DROP TABLE IF EXISTS `phongban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phongban` (
  `maphong` int NOT NULL AUTO_INCREMENT,
  `tenphong` varchar(256) NOT NULL,
  `matruongphong` int DEFAULT NULL,
  PRIMARY KEY (`maphong`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phongban`
--

LOCK TABLES `phongban` WRITE;
/*!40000 ALTER TABLE `phongban` DISABLE KEYS */;
INSERT INTO `phongban` VALUES (1,'Nhân Sự',15),(2,'Tài chính',NULL);
/*!40000 ALTER TABLE `phongban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taikhoan` (
  `tendangnhap` varchar(64) NOT NULL,
  `matkhau` varchar(256) NOT NULL,
  PRIMARY KEY (`tendangnhap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taikhoan`
--

LOCK TABLES `taikhoan` WRITE;
/*!40000 ALTER TABLE `taikhoan` DISABLE KEYS */;
INSERT INTO `taikhoan` VALUES ('dieu','$2a$12$uXHT1Zn5MO4Znc9.qiMn0utM/E2OUzQfZSytB0GC.VczLvjtwsnEm'),('huy','$2a$12$RWpBarCYvcx77n6JzbI8E.84kZ1DE5GPWXCbDlq1P9VGccSrfYO.G'),('thu','$2a$12$Vojdl5a9AMFMXecilDWIQ.ZK9pXBRQoMrLE2A3z772PJ20GGbWCMW'),('thuy','$2a$12$cpKOc2WxxmgXbPXvmR74muwwIYraccoN8SnJjsDbQoRTU7/athALu');
/*!40000 ALTER TABLE `taikhoan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-17 22:25:22
