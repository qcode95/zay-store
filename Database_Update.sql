CREATE DATABASE  IF NOT EXISTS `prj301` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `prj301`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: prj301
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `o_id` int NOT NULL,
  `u_name` varchar(100) NOT NULL,
  `email` varchar(450) NOT NULL,
  `mobile` int NOT NULL,
  `address` varchar(450) NOT NULL,
  `post_code` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,1,'Nguyen Xuan Quy','quynxqe170239@fpt.edu.vn',398973408,'Quy Nhơn',55000),(2,2,'Nguyen Xuan Quy','quynxqe170239@fpt.edu.vn',398973408,'Quy Nhơn',55000),(3,3,'Nguyen Xuan Quy','quynxqe170239@fpt.edu.vn',398973408,'08 Tong Phuoc Pho, Phường Quang Trung, Thành phố Hà Giang, Tỉnh Hà Giang',55000),(4,4,'nullnull','quynxqe170239@fpt.edu.vn',398973408,'08 Tong Phuoc Pho, PhÆ°á»ng HÃ¹ng VÆ°Æ¡ng, ThÃ nh phá» PhÃºc YÃªn, Tá»nh VÄ©nh PhÃºc',55000),(5,5,'nullnull','quynxqe170239@fpt.edu.vn',398973408,'08 Tong Phuoc Pho, XÃ£ DÅ©ng Liá»t, Huyá»n YÃªn Phong, Tá»nh Báº¯c Ninh',55000),(6,6,'nullnull','quynxqe170239@fpt.edu.vn',398973408,'08 Tong Phuoc Pho, Phường Thái Học, Thành phố Chí Linh, Tỉnh Hải Dương',55000),(7,7,'nullnull','quynxqe170239@fpt.edu.vn',398973408,'08 Tong Phuoc Pho, Xã Nội Duệ, Huyện Tiên Du, Tỉnh Bắc Ninh',55000),(8,8,'nullnull','guest@gmail.com',398973408,'08 Tong Phuoc Pho, XÃ£ Äá»©c Háº¡nh, Huyá»n Báº£o LÃ¢m, Tá»nh Cao Báº±ng',55000),(9,8,'nullnull','nguyenxuanquy147@gmail.com',398973408,'08 Tong Phuoc Pho, XÃ£ Hiá»p Lá»±c, Huyá»n Ninh Giang, Tá»nh Háº£i DÆ°Æ¡ng',55000),(10,9,'nullnull','quynxqe170239@fpt.edu.vn',398973408,'08 Tong Phuoc Pho, Phường Nam Sơn, Thành phố Bắc Ninh, Tỉnh Bắc Ninh',55000),(11,10,'nullnull','quynxqe170239@fpt.edu.vn',398973408,'08 Tong Phuoc Pho, Xã Lý Bôn, Huyện Bảo Lâm, Tỉnh Cao Bằng',55000),(12,11,'nullnull','hungdmqe170162@fpt.edu.vn',398973408,'08 Tong Phuoc Pho, Phường An Lạc, Thành phố Chí Linh, Tỉnh Hải Dương',55000),(13,12,'nullnull','caotrunghoan2003@gmail.com',357859348,'NTH, Xã Chỉ Đạo, Huyện Văn Lâm, Tỉnh Hưng Yên',700000),(14,14,'Minh Vuong','minhvuong@gmail.com',986548752,'Phu My, Binh Dinh',323000),(15,15,'Trong Nghia','nghia@gmail.com',352136597,'An Nhon, Binh Dinh',654879),(16,16,'Gia Hoang','giahoang@gmail.com',355878941,'Nhon Hoi, Quy Nhon',569874),(17,17,'Minh Quan','minhquan@gmail.com',347896325,'Thanh pho Ho Chi Minh',749800),(18,18,'Gia Phu','giaphu@gmail.com',986325789,'Yen Lanh, Phu Yen',698325),(19,19,'Minh Duong','minhduong@gmail.com',336598741,'Phu Thien, Gia Lai',352648),(20,20,'Huy Hoang','huyhoang@gmail.com',378965236,'Phu Tai, Quy Nhon',754632),(21,21,'Nguyen Thi Thuy','thithuy@gmail.com',363255689,'Tay Son',632563),(22,22,'Quoc Chuong','chuong@gmail.com',996587452,'Nguyen Van Cu, Quy Nhon',723000),(23,23,'Dong Tam','dongtam@gmail.com',355632236,'Quang Trung, Quy Nhon',770000),(24,24,'Kieu Duyen','duyen@gmail.com',963254698,'Ba Ria, Vung Tau',987569),(25,25,'Kim Long','kimlong@gmail.com',378965896,'Da Lat',635632),(26,26,'Anh Toan','dongtam@gmail.com',355632236,'Binh Duong, TP Ho Chi Minh',770612),(27,27,'Huu Phuc','huuphuc@gmail.com',396325698,'Nhon Ly, Quy Nhon',770650),(28,28,'Hoang Vu','hoangvu@gmail.com',963659875,'An Nhon, Binh Dinh',770978),(29,29,'Quy Binh','quybinh123@gmail.com',977589623,'Bong Son, Hoai Nhon',771230),(30,30,'Gia Thinh','thinh2003@gmail.com',372356235,'Hoai An, Binh Dinh',770045),(31,31,'Chi Kiet','chikiet@gmail.com',385979542,'Phu My, Binh Dinh',563259),(32,32,'Khac Vinh','vinh2003@gmail.com',332565689,'My Chanh, Phu My',698976),(33,33,'Hong Tham','hongtham@gmail.com',321459686,'Tuy Hoa, Phu Yen',568954),(34,34,'Phuong Nga','phuongnga@gmail.com',365487985,'My Loc, Phu My',125634),(35,35,'Phuc Thang','phucthang2003@gmail.com',336548795,'Bong Son, Hoai Nhon',784598),(36,36,'Trong Phat','phat1234@gmail.com',917546325,'Hoai Xuan, Hoai Nhon',774456),(37,37,'Hoang Chi','hoangchi@gmail.com',963521458,'Binh Duong, Phu My',231526),(38,38,'Nguyen Phuc','phuc2k3@gmail.com',354687921,'My Loc, Phu My, Binh Dinh',201230),(39,39,'Vu Bao','vubao@gmail.com',356541258,'An Thanh, Hoai An',848502),(40,40,'Chi Vien','chivien929@gmail.com',235469874,'Tam Quan, Hoai Nhon',652015),(41,41,'Tran Thi Thao','tranthao@gmail.com',355698741,'Kon Tum',450265),(42,42,'Nguyen Tran Tien','trantien222@gmail.com',35469742,'An Hao, Hoai An',451203),(43,43,'Thu Huong','huongcute@gmail.com',325487965,'Ha Tay, Ha Noi',521025),(44,44,'Phuong Trang','trangtrang@gmail.com',356487521,'Thu Duc, TP Ho Chi Minh',420156),(45,45,'Hoai Vu','hoaivunguyen@gmail.com',987546258,'Tay Ninh',142032),(46,46,'Cao Nhu Y','caonhuy2k2gmail.com',334432190,'Hoai Nhon, Binh Dinh',452102),(47,47,'Tran Dan','danpro@gmail.com',369879854,'Binh Duong',701250),(48,48,'Phuong Hang','hangphuong@gmail.com',963254654,'Hai Phong',896354),(49,49,'Nguyen Van An','nguyenvanan@gmail.com',362125468,'My Trinh, Phu My',452153),(50,50,'Kim Hoa','kimhoa2kgmail.com',326548956,'Vinh Thanh',851235),(51,51,'Nguyen Van Long','long2003@gmail.com',331256485,'An Thuong, Hoai An',250800),(52,52,'Nhat Nam','namdz2k3@gmail.com',369854621,'Quan 9, TP Ho Chi Minh',235125),(53,53,'Thu Duyen','nguyenthuduyen@gmail.com',221546325,'Quan 7, TP Ho Chi Minh',465320),(54,54,'Nguyen Thi Kim','kimnguyen@gmail.com',36365421,'Hoai Huong, Hoai Nhon',968532),(55,55,'Nguyen Thanh Ngoc','ngocnguyen@gmail.com',323215462,'An Nghia, Hoai An',101120),(56,56,'Tran Thi Thu','tranthu2000@gmail.com',32356984,'Cat Tien, Phu Cat',101200),(57,57,'Nguyen Kim Ngan','ngan2k3@gmail.com',369854852,'Tuy Phuoc',125101),(58,58,'Tran Van Dung','vandung1990@gmail.com',326541258,'Van Canh',112002),(59,59,'Truong Vo Ky','truongvoky@gmail.com',985125951,'Tay Son',425212),(60,60,'Ton Ngo Khong','tethien@gmail.com',369854658,'Nhon Phong, An Nhon',635240),(61,61,'Truong Bat Gioi','thienbongnguyensoi@gmail.com',968541622,'Nhon An, An Nhon',785462),(62,62,'Sa Ngo Tinh','satang@gmail.com',365458512,'Nhon Hanh, An Nhon',452102),(63,63,'Duong Tam Tang','duongtang@gmail.com',369845126,'Nhon Hau, An Nhon',122344),(65,65,'Nguyen Hong Loan','hongloan@gmail.com',35623145,'Da Nang',201203),(66,66,'Nguyen Huu Hieu','huuhieu@gmail.com',369854652,'Nguyen Van Cu, Quy Nhon',755541),(67,67,'Tang Duy Tan','duytan2000@gmail.com',365425789,'An Tin, Hoai An, Binh Dinh',145144),(68,68,'Dao Thi Huong','huongdao@gmail.com',225465128,'Nghe An',123562),(69,69,'Phung Thanh Do','thanhdo@gmail.com',321254569,'Cao Bang',125402),(70,70,'Luu Canh Tan','canhtan2k3@gmail.com',25458794,'Hoai Nhon, Binh Dinh',445412),(71,71,'Nguyen Thi Giang','giangnguyen@gmail.com',362154896,'Thua Thien Hue',856874),(72,72,'Huynh Yen Vy','yenvy2k4@gmail.com',323215468,'Tay Son',784458),(73,73,'Doan Thi Diem','diemdoan@gmail.com',145698745,'Quan 10, TP Ho Chi Minh',445566),(74,74,'Nguyen Huu Tin','huutin999@gmail.com',14568795,'Dong Da, Ha Noi',987644),(75,75,'Huynh Van Chung','vanchung@gmail.com',332546125,'My Loc, Phu My',563212),(76,76,'Do Hung DUng','hungdungvn@gmail.com',365412879,'Ba Dinh, Ha Noi',125465),(77,77,'Nguyen Van Lam','lamnguyen@gmail.com',256987415,'Van Canh, Binh Dinh',142563),(78,78,'Nguyen Quang Hai','quanghai123@gmail.com',362587415,'Ha Tinh',784596),(79,79,'Doan Van Hau','hoanvanhau@gmail.com',356458715,'Phu Tai, Quy Nhon',785694),(80,80,'Ha Duc Chinh','ducchinh@gmail.com',651254875,'Thu Duc, TP Ho Chi Minh',453552),(81,81,'Nguyen Dinh Trong','dinhtrong99@gmail.com',329874587,'Long Bien, Ha Noi',785469),(82,82,'Nguyen Thanh Chung','thanhchung23@gmail.com',25648796,'Bui Thi Xuan, Quy Nhon',455321),(83,83,'Dinh Trong Huy','dinhtronghuy@gmail.com',254687598,'Nguyen Van Cu, Quy Nhon',121445),(84,84,'Nguyen Tien Phong','tienphon03@gmail.com',362125425,'Ngo May, Quy Nhon',778540),(85,85,'Nguyen Trong Hoang','tronghoang@gmail.com',21546985,'Ly Thuong Kiet, Quy Nhon',701201),(86,86,'Bui Tien Dung','tiendungbui@gmail.com',34789525,'Tran Hung Dao, Quy Nhon',980215),(87,87,'Nguyen Hong Son','hongson95@gmail.com',698745821,'Ba Vi, Ha Noi',102350),(88,88,'Truong Quang Truong','quangtruong@gmail.com',125469875,'Quang Trung, Quy Nhon',780152),(89,89,'Quan Tuyen','tuyen2k3@gmail.com',125978468,'Nhon Binh, Quy Nhon',456320),(90,90,'Doan The Vu','thevudoan@gmail.com',321546988,'Phu My, Binh Dinh',210350),(91,91,'Phan Van Ha','vanhaphan@gmail.com',369874125,'An Tin, Hoai An, Binh Dinh',521462),(92,92,'Tran Quang Quyen','quyentran@gmail.com',32564879,'My Trinh, Phu My',785695),(94,94,'Huynh Nguyen Phuc','nguyenphuc@gmail.com',365236558,'My Loc, Phu My, Binh Dinh',560325),(95,95,'Nguyen Tien Dat','datnguyem@gmail.com',356987451,'Hoai Huong, Hoai Nhon',402505),(96,96,'Tran Tu Quyen','tuquyen@gmail.com',545897512,'Phuoc My, Quy Nhon',456302),(97,97,'Cao Phong','phongcao22@gmail.com',32658956,'Tuy Hoa, Phu Yen',402563),(98,98,'Nguyen Kim Anh','kimanhkk@gmail.com',225465879,'Phu Thien, Gia Lai',452025),(99,99,'Tran Manh Dung','manhdung@gmail.com',654878545,'Tran Phu, Quy Nhon',120320),(100,100,'Nguyen Nhu Hoa','hoanguyen@gmail.com',326548955,'Phu Van, Hoai An',201202),(101,101,'Nguyen Cong Hoan','conghoan@gmail.com',365945125,'Nhon Hoi, Quy Nhon, Binh Dinh',201245),(102,102,'Huynh Van Tinh','vantinh@gmail.com',32654125,'Quan 9, TP Ho Chi Minh',452102),(103,103,'Nguyen Thi Huong','thihuong@gmail.com',326546545,'Tay Son, Binh Dinh',632502),(104,104,'Dinh Tien Dat','dinhtiendat@gmail.com',231258585,'Dong Da, Ha Noi',325632),(105,105,'Nguyen Tran Thanh','tranthanhfc@gmail.com',256452158,'Binh Duong, TP Ho Chi Minh',652014),(106,106,'Kim Dung','dungkim@gmail.com',258745895,'Nhon Phu, Quy Nhon',521023),(107,107,'Au Duong Phong','duongphong@gmail.com',125412548,'Le Hong Phong, Quy Nhon',258759),(108,108,'Duong Phuc Thang','phucthangk3@gmail.com',36256985,'Bong Son, Hoai Nhon, Binh Dinh',985630),(109,109,'Truong Nha Uyen','nhauyen@gmail.com',215466585,'Hoai Hai, Hoai Nhon',854125),(110,110,'Hoa Vien','hoavien2005@gmail.com',154854875,'An Tuong Tay, Hoai An',632541),(111,111,'Nguyen Xuan Sang','xuansang@gmail.com',362532512,'Tran Quang Dieu, Quy Nhon',122545),(112,112,'Cao Trung Hoan','hoancao1234@gmail.com',357859344,'420 Nguyen Thai Hoc, Quy Nhon',668548),(113,113,'Tran Quoc Trung','quoctrung@gmail.com',321254521,'An Thanh, Hoai An, Binh Dinh',789954),(114,114,'Le Thi My Loi','myloi2004@gmail.com',523651254,'Thi Nai, Quy Nhon',770000),(115,115,'Tran My Hong','myhongtran@gmail.com',326545215,'My Dinh, Ha Noi',457422),(116,116,'Duc Trung','ductrung77@gmail.com',212325452,'Nhon Binh, Quy Nhon',771000),(117,117,'Le Nguyen Phuc Anh','phucanhnguyen@gmail.com',325645215,'Song Cau, Phu Yen',112546),(118,118,'Au Cong Danh','aucongdanh@gmail.com',986548525,'Tran Phu, Quy Nhon, Binh Dinh',785699),(119,119,'Ngo Gia Hoang','hoangngo@gmail.com',562156245,'Nha Trang, Khanh Hoa',445221),(120,120,'Ho Trong Nghia','nghiaho@gmail.com',36989653,'Nhon Chau, Quy Nhon, Binh Dinh',566625),(121,122,'Pham Bao Trieu','baotrieu2003@gmail.com',326545685,'Hoai Duc, Hoai Nhon',325457),(123,123,'Nguyen Truc Ngan','trucngan@gmail.com',258789854,'An Duc, Hoai An',458725),(124,124,'Nguyen Chi Thi','chithinguyen@gmail.com',654125486,'Da Nang',547852),(125,125,'Nguyen Kim Hoang','kimhoang@gmail.com',23125268,'Ngo May, Quy Nhon, Binh Dinh',125667),(126,126,'Nguyen Thuy Duong','thuyduong2k4@gmail.com',521236582,'Bong Son, Hoai Nhon',235678),(127,127,'Nguyen Van Chien','vanchien@gmail.com',552125216,'Cat Tien, Phu Cat',875125),(128,128,'Nguyen Phi Hung','phihung@gmail.com',254875985,'Dong Hoa, Phu Yen',122569),(129,129,'Nguyen Thi Y Lan','lannguyen@gmail.com',621254521,'Tran Quang Dieu, Quy Nhon',700000),(130,130,'Nguyen Thuy Huong','thuyhuong@gmail.com',956452125,'Cat Tuong, Phu Cat',135300),(131,131,'Diep Minh Hung','minhhung2003@gmail.com',120212504,'Ho Tay, Ha Noi',350000),(132,132,'Nguyen Hung Hung','hunghung@gmail.com',256698540,'Quan 1, TP Ho Chi Minh',250000),(133,133,'Thuy An','thuyannguyen@gmail.com',521232562,'Ngo May, Phu Cat',335044),(134,134,'Trang Quang Thai','quangthai@gmail.com',854652125,'An Tuong Tay, Hoai An',145236),(136,136,'Dang Gia Nguyen','gianguyen@gmail.com',302564520,'Binh Duong, Phu My',200101),(137,137,'Vo Thi Lan Anh','lananh2k6@gmail.com',626325025,'Long My, Quy Nhon',233545),(138,138,'Tu Trinh','trinh2k1@gmail.com',402102562,'Hoai Hai, Hoai Nhon',255632),(139,139,'Nguyen Van Kiet','kietnguyen@gmail.com',521256395,'Tang Bat Ho, Hoai An',785462),(140,140,'Tran Anh Tu','anhtutran@gmail.com',323650215,'Nguyen Van Cu, Quy Nhon',124145),(141,141,'Dang Thanh Quang','thanhquan@gmail.com',363650250,'An Nhon, Binh Dinh',142566),(142,142,'Vu Dinh The Anh','anhvu@gmail.com',231205456,'Nhon Hoi, Quy Nhon',754387),(143,143,'Nguyen Van Cong','nguyenvancong@gmail.com',245025960,'My Trinh, Phu My',272384),(144,144,'Nguyen Tuan Vu','tuanvunguyen@gmail.com',521365201,'Dong Da, Ha Noi',375378),(145,145,'Nguyen Hanh Chinh','hanhchinh@gmail.com',333021521,'Tuy Hoa, Phu Yen',343887),(146,146,'Tran Duc Huy','duchuy2003@gmail.com',968654585,'An Khe, Gia Lai',786743),(147,147,'Trinh Minh Duong','duongtrinh@gmail.com',331231020,'Binh Duong, Binh Duong',438753),(148,148,'Huynh Thanh Tuyen','thanhtuyen2k3@gmail.com',366520120,'An Thanh, Hoai An, Binh Dinh',737384),(149,149,'Le Dong Tam','tamle@gmail.com',987542130,'Bui Thi Xuan, Quy Nhon',737845),(152,152,'Cao Thanh Huyen','thanhhuyen@gmail.com',895402501,'Hoai Duc, Hoai Nhon, Binh Dinh',737387),(153,153,'Thuy Duyen','duyen2k7@gmail.com',125469025,'My An, Phu My',783837),(154,154,'Nguyen Van Binh','binhnguyen@gmail.com',334598025,'Quang Trung, Quy Nhon, Binh Dinh',373778);
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Nike'),(2,'Converse'),(3,'Vans'),(4,'Puma');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Sneakers'),(2,'Sport Shoes'),(3,'High Heels');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'Standard Delivery',5),(2,'Fast Delivery',10);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,'No Discount',0),(2,'ZayStore50',50);
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `o_id` int NOT NULL,
  `p_id` int NOT NULL,
  `quantity` int NOT NULL,
  `amount` int NOT NULL,
  `size` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3_idx` (`p_id`),
  CONSTRAINT `FK3` FOREIGN KEY (`p_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,1,2,2,98,39),(2,2,2,1,49,39),(3,3,2,2,98,39),(4,4,2,10,49,41),(5,5,2,10,49,39),(6,6,3,1,129,39),(7,6,4,1,79,39),(8,7,3,2,258,39),(9,7,4,1,79,39),(10,8,3,1,129,39),(11,13,17,1,79,40),(12,9,3,2,268,39),(13,10,3,2,258,39),(14,11,3,2,258,39),(15,12,3,8,1032,39),(16,16,17,1,79,40),(17,17,8,2,158,42),(18,18,11,1,59,40),(19,19,15,1,69,39),(20,20,10,1,39,41),(21,21,34,1,80,43),(22,22,5,1,89,40),(23,23,4,2,158,42),(24,24,9,1,49,40),(25,25,16,1,54,41),(26,26,18,2,88,39),(27,27,22,1,19,40),(28,28,7,1,34,39),(29,29,35,1,250,40),(30,30,10,1,39,41),(31,31,3,1,129,40),(32,32,13,1,79,43),(33,33,28,2,138,41),(34,34,19,1,64,40),(35,35,31,10,990,39),(36,36,29,1,79,40),(37,37,30,1,39,41),(38,38,18,1,44,40),(39,39,6,1,69,42),(40,40,15,1,69,40),(41,41,30,2,78,39),(42,42,12,1,29,40),(43,43,24,1,89,42),(44,44,17,1,79,41),(45,45,16,1,54,40),(46,46,13,2,158,43),(47,47,21,1,59,40),(48,48,1,1,99,39),(49,49,2,3,147,40),(50,50,32,1,100,39),(51,51,24,1,89,41),(52,52,11,1,59,40),(53,53,4,1,79,41),(54,54,19,1,64,40),(55,55,6,1,69,39),(56,56,38,2,200,40),(57,57,26,1,99,42),(58,58,18,1,44,41),(59,59,12,2,58,40),(60,60,27,1,49,41),(61,61,8,1,79,40),(62,62,3,1,129,39),(63,63,10,1,39,40),(64,64,19,1,64,39),(65,65,22,5,95,43),(66,66,9,1,49,41),(67,67,33,1,200,40),(68,68,22,1,19,42),(69,69,5,1,89,39),(70,70,11,1,59,40),(71,71,20,1,69,41),(72,72,16,1,54,40),(73,73,13,1,79,42),(74,74,26,1,99,39),(75,75,30,1,39,39),(76,76,17,1,79,40),(77,77,5,1,89,40),(78,78,13,1,79,41),(79,79,14,2,178,41),(80,80,19,1,64,43),(81,81,21,1,59,40),(82,82,8,1,79,42),(83,83,2,1,49,40),(84,84,30,1,39,41),(85,85,1,1,99,40),(86,86,17,1,79,39),(87,87,23,1,74,40),(88,88,2,1,49,42),(89,89,10,1,39,40),(90,90,12,1,29,41),(91,91,33,1,200,40),(92,92,20,1,69,39),(93,93,8,1,79,40),(94,94,30,1,39,41),(95,95,14,2,178,40),(96,96,21,1,59,42),(97,97,12,3,87,40),(98,98,35,1,250,41),(99,99,16,1,54,40),(100,100,11,1,59,43),(101,101,30,1,39,40),(102,102,27,1,49,39),(103,103,18,1,44,40),(104,104,36,1,150,41),(105,105,7,1,34,42),(106,106,10,1,39,40),(107,107,30,1,39,41),(108,108,37,1,200,40),(109,109,12,1,29,39),(110,110,35,2,500,40),(111,111,6,1,69,43),(112,112,3,1,129,40),(113,113,19,1,64,41),(114,114,31,1,99,40),(115,115,1,1,99,41),(116,116,20,1,69,40),(117,117,12,1,29,42),(118,118,2,1,49,40),(119,119,5,1,89,39),(120,120,1,1,99,41),(121,121,2,1,49,40),(122,122,1,2,198,40),(123,123,10,1,39,39),(124,124,18,1,44,39),(125,125,13,1,79,40),(126,126,11,1,59,39),(127,127,19,1,64,40),(128,128,17,1,79,41),(129,129,21,1,59,42),(130,130,13,1,79,40),(131,131,31,1,99,41),(132,132,22,10,190,40),(133,133,33,1,200,40),(134,134,10,1,39,43),(135,135,9,1,49,40),(136,136,6,1,69,41),(137,137,31,2,198,40),(138,138,1,1,99,39),(139,139,36,1,150,40),(140,140,19,1,64,40),(141,141,25,1,29,39),(142,142,2,1,49,40),(143,143,13,1,79,40),(144,144,14,1,89,41),(145,145,35,1,250,40),(146,146,27,1,49,42),(147,147,20,1,69,43),(148,148,11,1,59,40),(149,149,2,2,98,39),(150,150,6,1,69,40),(151,151,17,1,79,40),(152,152,23,1,74,41),(153,153,4,1,79,41),(154,154,29,2,158,43);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL,
  `u_id` int NOT NULL,
  `date` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `amount` int NOT NULL,
  `de_id` int NOT NULL,
  `di_id` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK2_idx` (`u_id`),
  CONSTRAINT `FK2` FOREIGN KEY (`u_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,5,'2023-01-04 03:30','Pending',53,1,1),(2,5,'2023-08-04 09:20','Pending',49,1,1),(3,5,'2023-07-05 12:09','Refund',13,1,1),(4,5,'2023-02-06 08:43','Pending',543,1,1),(5,5,'2023-11-06 08:48','Pending',494,1,1),(6,5,'2023-04-06 08:49','Pending',233,1,1),(7,5,'2023-02-06 08:52','Pending',352,1,1),(8,5,'2023-06-06 09:58','Pending',84,1,1),(9,5,'2023-12-06 10:05','Pending',273,1,0),(10,5,'2023-10-06 10:13','Pending',278,2,0),(11,5,'2023-09-06 10:15','Shipping',268,1,0),(12,7,'2023-03-06 10:25','Pending',1305,2,0),(13,3,'2023-07-08 12:19','Delivered',180,1,1),(14,1,'2023-12-05 13:28','Delivered',100,2,2),(15,4,'2023-06-05 14:05','Delivered',99,1,1),(16,2,'2023-09-05 14:37','Delivered',49,2,1),(17,4,'2023-11-05 14:56','Delivered',91,2,2),(18,5,'2023-12-05 15:03','Delivered',53,1,2),(19,3,'2023-10-05 15:15','Delivered',99,2,1),(20,2,'2023-01-05 15:42','Delivered',89,1,1),(21,4,'2023-08-05 16:01','Delivered',79,2,2),(22,1,'2023-02-05 16:32','Delivered',69,1,1),(23,2,'2023-07-05 16:50','Refund',34,1,2),(24,5,'2023-03-05 17:10','Delivered',59,2,1),(25,3,'2023-09-05 17:21','Delivered',29,1,2),(26,1,'2023-12-05 17:35','Shipping',44,1,1),(27,4,'2023-01-05 17:52','Delivered',49,2,2),(28,5,'2023-12-05 18:11','Delivered',64,2,1),(29,2,'2023-11-05 18:32','Shipping',99,1,2),(30,3,'2023-10-05 18:39','Delivered',100,2,1),(31,1,'2023-06-05 18:44','Delivered',89,1,2),(32,4,'2023-03-05 18:52','Delivered',74,2,1),(33,5,'2023-07-05 19:30','Pending',49,2,2),(34,3,'2023-02-05 19:41','Delivered',29,2,2),(35,2,'2023-09-05 19:46','Delivered',129,1,1),(36,1,'2023-03-05 19:59','Delivered',109,2,1),(37,4,'2023-02-05 20:06','Delivered',69,2,2),(38,2,'2023-10-05 20:12','Delivered',59,1,1),(39,1,'2023-05-05 20:31','Shipping',49,2,1),(40,3,'2023-11-05 20:45','Delivered',39,1,2),(41,5,'2023-12-05 21:03','Delivered',19,1,1),(42,2,'2023-09-05 21:14','Shipping',39,2,1),(43,4,'2023-10-05 21:33','Delivered',99,2,2),(44,3,'2023-04-05 21:42','Delivered',59,1,2),(45,1,'2023-08-05 21:58','Delivered',79,2,1),(46,5,'2023-06-05 22:04','Delivered',89,1,2),(47,3,'2023-10-05 22:39','Delivered',49,2,1),(48,2,'2023-11-05 22:44','Delivered',99,1,2),(49,4,'2023-09-05 23:01','Delivered',99,2,1),(50,5,'2023-12-05 23:21','Delivered',29,1,2),(51,1,'2023-03-06 07:30','Delivered',44,1,1),(52,2,'2023-01-06 07:35','Delivered',64,2,2),(53,5,'2023-02-06 07:51','Delivered',74,2,1),(54,3,'2023-10-06 08:36','Delivered',59,1,1),(55,4,'2023-12-06 09:11','Delivered',79,1,2),(56,1,'2023-05-06 09:26','Shipping',89,2,1),(57,2,'2023-09-06 09:53','Delivered',59,2,2),(58,5,'2023-01-06 10:01','Delivered',39,1,1),(59,3,'2023-11-06 10:36','Refund',29,1,2),(60,1,'2023-10-06 10:57','Delivered',54,2,1),(61,4,'2023-12-06 11:15','Delivered',64,2,2),(62,1,'2023-08-06 11:19','Delivered',79,1,1),(63,5,'2023-06-06 11:26','Delivered',99,2,2),(64,2,'2023-04-06 11:39','Delivered',129,2,1),(65,3,'2023-02-06 11:42','Shipping',24,1,1),(66,4,'2023-01-06 11:43','Delivered',109,2,2),(67,2,'2023-10-06 11:58','Refund',44,1,1),(68,1,'2023-12-06 12:02','Delivered',99,2,1),(69,5,'2023-08-06 12:10','Delivered',49,1,2),(70,3,'2023-06-06 12:22','Delivered',79,2,2),(71,5,'2023-10-06 12:36','Delivered',59,2,1),(72,4,'2023-03-06 13:11','Delivered',19,1,1),(73,1,'2023-09-06 14:02','Delivered',69,2,2),(74,2,'2023-11-06 14:26','Delivered',44,2,1),(75,3,'2023-12-06 14:33','Refund',79,1,2),(76,5,'2023-08-06 14:55','Delivered',99,2,1),(77,3,'2023-04-06 15:12','Delivered',89,1,2),(78,4,'2023-06-06 15:21','Delivered',99,2,1),(79,2,'2023-17-06 16:04','Refund',54,2,2),(80,1,'2023-05-06 16:30','Delivered',100,1,1),(81,2,'2023-09-06 16:47','Delivered',150,1,1),(82,4,'2023-12-06 17:10','Delivered',250,2,2),(83,1,'2023-10-06 17:23','Delivered',200,2,2),(84,3,'2023-11-06 17:30','Shipping',49,1,1),(85,5,'2023-08-06 17:43','Delivered',19,2,2),(86,1,'2023-02-06 17:49','Delivered',79,2,1),(87,4,'2023-04-06 17:53','Delivered',100,1,2),(88,3,'2023-07-06 17:55','Delivered',129,2,1),(89,2,'2023-10-06 18:02','Delivered',29,2,2),(90,5,'2023-09-06 18:30','Shipping',54,1,1),(91,4,'2023-03-06 18:34','Delivered',89,2,1),(92,3,'2023-11-06 18:39','Shipping',19,1,2),(93,5,'2023-12-06 18:41','Delivered',150,2,1),(94,2,'2023-04-06 18:43','Shipping',200,1,2),(95,1,'2023-07-06 18:45','Delivered',59,1,1),(96,4,'2023-09-06 18:49','Delivered',64,2,2),(97,1,'2023-03-06 18:53','Delivered',44,2,1),(98,3,'2023-10-06 19:21','Delivered',250,2,2),(99,2,'2023-11-06 19:35','Delivered',99,1,1),(100,5,'2023-09-06 19:49','Delivered',79,2,2),(101,4,'2023-03-06 19:57','Delivered',19,2,1),(102,5,'2023-05-06 20:12','Shipping',59,1,1),(103,3,'2023-07-06 20:19','Shipping',99,2,2),(104,2,'2023-12-06 20:26','Shipping',150,1,1),(105,1,'2023-10-06 20:34','Shipping',80,2,2),(106,5,'2023-05-06 20:35','Shipping',39,1,1),(107,4,'2023-01-06 20:40','Delivered',100,2,1),(108,2,'2023-03-06 20:42','Refund',129,2,2),(109,1,'2023-09-06 20:51','Delivered',80,1,1),(110,3,'2023-07-06 20:57','Delivered',99,2,2),(111,5,'2023-02-06 21:03','Delivered',19,2,1),(112,4,'2023-06-06 21:15','Delivered',29,1,2),(113,2,'2023-10-06 21:29','Delivered',39,1,1),(114,3,'2023-11-06 21:40','Pending',54,2,2),(115,1,'2023-03-06 21:51','Pending',64,2,1),(116,4,'2023-08-06 22:31','Pending',34,1,2),(117,1,'2023-12-07 00:21','Shipping',79,2,1),(118,2,'2023-10-07 06:22','Shipping',89,1,2),(119,3,'2023-11-07 07:25','Shipping',100,2,1),(120,5,'2023-05-07 07:44','Pending',80,1,2),(121,3,'2023-07-07 08:30','Shipping',49,2,1),(122,1,'2023-10-07 08:34','Pending',99,1,2),(123,2,'2023-09-07 08:41','Pending',200,2,1),(124,5,'2023-06-07 08:50','Shipping',59,2,1),(125,2,'2023-04-07 08:51','Pending',29,1,2),(126,4,'2023-01-07 08:56','Pending',54,2,1),(127,5,'2023-11-07 09:02','Pending',39,2,1),(128,1,'2023-03-07 09:13','Pending',150,1,2),(129,3,'2023-10-07 09:22','Pending',79,2,1),(130,3,'2023-12-07 09:30','Pending',99,2,1),(131,2,'2023-05-07 09:34','Pending',44,1,2),(132,1,'2023-01-07 09:39','Pending',19,2,1),(133,5,'2023-07-07 09:42','Pending',129,1,2),(134,2,'2023-03-07 09:47','Pending',200,1,2),(135,5,'2023-09-07 09:55','Pending',80,2,1),(136,4,'2023-10-07 10:12','Delivered',99,2,1),(137,1,'2023-11-07 10:34','Pending',49,1,2),(138,3,'2023-09-07 10:40','Pending',59,1,1),(139,4,'2023-08-07 10:58','Refund',64,2,2),(140,1,'2023-10-07 11:12','Pending',34,1,1),(141,2,'2023-11-07 11:26','Shipping',29,2,2),(142,5,'2023-12-07 11:37','Shipping',150,2,1),(143,3,'2023-11-07 11:44','Pending',250,1,2),(144,5,'2023-07-07 11:48','Pending',200,2,1),(145,1,'2023-06-07 11:50','Delivered',89,2,2),(146,2,'2023-02-07 11:53','Shipping',79,2,1),(147,4,'2023-10-07 11:56','Shipping',59,1,2),(148,3,'2023-12-07 12:09','Shipping',19,2,1),(149,2,'2023-11-07 12:11','Shipping',80,2,2),(150,1,'2023-09-07 12:19','Pending',89,1,1),(151,4,'2023-12-07 12:27','Pending',150,2,1),(152,3,'2023-04-07 12:36','Pending',100,1,2),(153,5,'2023-01-07 12:39','Pending',99,2,1),(154,4,'2023-12-07 12:45','Pending',250,1,2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_size`
--

DROP TABLE IF EXISTS `product_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `c_id` int NOT NULL,
  `name` varchar(450) NOT NULL,
  `size` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK10_idx` (`c_id`),
  CONSTRAINT `FK10` FOREIGN KEY (`c_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_size`
--

LOCK TABLES `product_size` WRITE;
/*!40000 ALTER TABLE `product_size` DISABLE KEYS */;
INSERT INTO `product_size` VALUES (1,1,'SIZE_SNEAKER_39',39),(2,1,'SIZE_SNEAKER_40',40),(3,1,'SIZE_SNEAKER_41',41),(4,1,'SIZE_SNEAKER_42',42),(5,1,'SIZE_SNEAKER_43',43),(6,2,'SIZE_SPORT_39',39),(7,2,'SIZE_SPORT_40',40),(8,2,'SIZE_SPORT_41',41),(9,2,'SIZE_SPORT_42',42),(10,2,'SIZE_SPORT_43',43),(11,3,'SIZE_HIGH_39',39),(12,3,'SIZE_HIGH_40',40),(13,3,'SIZE_HIGH_41',41),(14,3,'SIZE_HIGH_42',42),(15,3,'SIZE_HIGH_43',43);
/*!40000 ALTER TABLE `product_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` varchar(450) NOT NULL,
  `price` double NOT NULL,
  `color` varchar(100) NOT NULL,
  `c_id` int NOT NULL,
  `image` varchar(450) NOT NULL,
  `rating` int NOT NULL,
  `quantity` int NOT NULL,
  `b_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Running Shoes','<p>High-performance running shoes for all terrains.</p>',99,'White',2,'/files/vn-11134207-7r98o-lndyw2tm0nsq53.jpg',4,0,1),(2,'Casual Sneakers','Stylish and comfortable sneakers for everyday wear.',49,'White',1,'/files/4f83ac2f74fe0a10c1a9515c40ae972f.jpg',4,0,2),(3,'Basketball Shoes','Professional basketball shoes with ankle support.',129,'White',2,'/files/sg-11134201-7r98o-lkpdcafhe5vr18.jpg',4,0,3),(4,'Hiking Boots','Durable and waterproof hiking boots for outdoor adventures.',79,'Black',2,'/files/45e6ba7c1736806d3abdae87f36b41e0.jpg',4,10,4),(5,'Formal Shoes','Elegant formal shoes for special occasions.',89,'Black',1,'/files/vn-11134207-7r98o-ln5h1j3oalso39.jpg',5,10,1),(6,'High Heels','Fashionable high heels for a glamorous look.',69,'Black',3,'/files/401500987_2693156197489046_7950074767986845582_n.jpg',4,10,2),(7,'Athletic Shoes','Comfortable sandals for active lifestyles.',34,'Green',1,'/files/275389575_1108533103212886_4280394978077608694_n.jpg',4,10,3),(8,'Winter Boots','Warm and stylish boots for cold weather.',79,'Black',2,'/files/45e6ba7c1736806d3abdae87f36b41e0.jpg',5,10,4),(9,'Dress Flats','Simple and elegant flats for formal occasions.',49,'Silver',3,'/files/8b0ff22cc9727ef5b355d7272c33d1dc.jpg',4,10,1),(10,'Casual Slip-Ons','Easy-to-wear slip-on shoes for casual outings.',39,'Black',3,'/files/400663419_672216978386883_2410821714007135792_n.jpg',3,10,2),(11,'Skate Shoes','Stylish and durable skate shoes for skateboarding enthusiasts.',59,'Black',2,'/files/131594186_150660390186402_8205551849114179711_n.jpg',5,10,3),(12,'Summer Shoes','Light and breathable sandals for the summer season.',29,'Yellow',2,'/files/sg-11134201-23010-1xjwewnxfylvfd.jpg',4,10,4),(13,'Trail Running Shoes','Trail-ready running shoes for off-road adventures.',79,'White',2,'/files/338003854_1507038156493239_433084147216354245_n.jpg',5,10,1),(14,'Classic Oxfords','Timeless oxford shoes for a sophisticated look.',89,'Brown',1,'/files/275428292_1108532539879609_2285349818488101736_n.jpg',4,10,2),(15,'Fashion Boots','Trendy boots to complement your fashion-forward style.',69,'Gray',3,'/files/400615201_333657679278313_7911866838327053115_n.jpg',3,10,3),(16,'Running Sneakers','Versatile sneakers for both running and casual wear.',54,'Blue',1,'/files/201d9aba6cad78f2c9a9745c0073dc53.jpg',2,10,4),(17,'Elegant Pumps','Chic pumps for formal occasions and parties.',79,'Pink',2,'/files/sg-11134201-7rbk0-lkz251wgig34dd.jpg',2,10,1),(18,'Outdoor Shoes','Durable sandals designed for outdoor activities.',44,'Black',2,'/files/vn-11134207-7r98o-lkv39anw4lvv85.jpg',1,10,2),(19,'Smart Loafers','Classic loafers with a modern touch for a smart look.',64,'Brown',1,'/files/2a57ec336e523732e839b4459b5bcfb3.jpg',4,10,3),(20,'Athletic Shoes','Comfortable athletic shoes for various sports and activities.',69,'Black',1,'/files/vn-11134207-7r98o-lo2iia0dattmd8.jpg',5,10,4),(21,'Fashion Sneakers','Trendy sneakers for a fashionable look.',59,'White',1,'/files/338143635_991815068868018_4215078927841443918_n.jpg',4,10,1),(22,'Summer Flip-Flops','Lightweight flip-flops for casual summer days.',19,'White',3,'/files/336179252_964992271170476_9041407408368172223_n.jpg',5,10,2),(23,'Cross Training Shoes','Versatile shoes for cross-training and gym workouts.',74,'Black',2,'/files/sg-11134201-7qvct-lh62wvhbimg3b6.jpg',3,10,3),(24,'Chelsea Boots','Stylish Chelsea boots for a classic and refined appearance.',89,'Black',1,'/files/vn-11134207-7r98o-lljeojehh32gcc.jpg',2,10,4),(25,'Slides','Easy-to-wear slides for a laid-back and comfortable style.',29,'Blue',2,'/files/vn-11134207-7qukw-lfuviqrnv2t375.jpg',1,10,1),(26,'Platform Heels','Elevated platform heels for a bold and stylish statement.',99,'White',3,'/files/402463344_2538828122989893_4915304872202879352_n.jpg',3,10,2),(27,'Walking Shoes','Comfortable walking shoes for everyday use.',49,'Gray',2,'/files/ba43cd9148372c17beaa542e15a88083.jpg',4,10,3),(28,'Velvet Flats','Luxurious velvet flats for a touch of elegance.',69,'Black',2,'/files/vn-11134207-7r98o-lkv39anw4lvv85.jpg',5,10,4),(29,'Snow Boots','Insulated snow boots for winter adventures.',79,'White',2,'/files/b8ae2c1ecb000ca1d8b9a32c16085d64.jpg',4,10,1),(30,'Casual Mules','Casual mules for a relaxed and chic style.',39,'Brown',1,'/files/vn-11134207-7r98o-ll3jdvhfdcjaff.jpg',2,10,2),(31,'Winter\'s Boot','<p>Winter boots are essential footwear for cold weather, designed to keep your feet warm, dry, and stable.</p>',99,'Blue',1,'/files/product-1.png',4,10,3),(32,'Leather Men\'s Shoes','<p>Leather men\'s shoes, renowned for their timeless style and durability, offer a classic and versatile option for various occasions.</p>',100,'Brown',1,'/files/product-2.png',4,10,4),(33,'Crocodile\'s Skin Men\'s Shoes','<p>Crocodile skin men\'s shoes exude luxury and sophistication. Crafted from high-quality crocodile leather, these shoes are known for their distinctive texture and durability.</p>',200,'Blue',1,'/files/product-3.png',4,10,1),(34,'Thuong Dinh Running Shoes','<p>Thuong Dinh Running shoes are specialized athletic footwear designed to provide comfort, support, and protection for individuals engaging in running or jogging activities.</p>',80,'Blue',2,'/files/product-4.png',4,10,2),(35,'Princess\'s High Heels','<p>\"Princess\'s high heels\" refers to high-heeled shoes that are associated with a princess or a royal aesthetic.</p>',250,'Pale Yellow',3,'/files/product-5.png',5,10,3),(36,'Vans Shoes','<p>Vans is a popular American brand of footwear, known for its casual and skateboard-inspired shoe designs.</p>',150,'Yellow',1,'/files/product-6.png',4,10,4),(37,'Informal High Heels','<p>High heels are a style of footwear characterized by a heel that is elevated significantly higher than the toes.</p>',200,'Blue',3,'/files/product-7.png',5,10,1),(38,'Running Shoe','<p>Running shoes are specialized athletic footwear designed to provide comfort, support, and protection for individuals engaging in running or jogging activities.</p>',100,'Pink',2,'/files/product-8.png',5,10,2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `u_id` int NOT NULL,
  `p_id` int NOT NULL,
  `comment` varchar(450) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `rating` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,3,1,'Good Good',4),(2,4,1,'<p>Good Good</p>',4),(3,2,2,'<p>Perfect !</p>',5),(4,5,1,'<p>Good</p>',5),(5,7,3,'<p>Ok</p>',5),(6,7,3,'<p>Ok?</p>',4),(7,5,32,'Stylish Design',4),(8,4,13,'Durable Build',5),(9,3,38,'Excellent Traction',5),(10,2,23,'Versatile Style',5),(11,4,11,'True to Size',3),(12,1,20,'Breathability',5),(13,3,26,'Easy to Clean',5),(14,5,17,'These shoes offer great value for the price',4),(15,2,6,'Unique Details',5),(16,3,7,'All-Day Comfort and Support',5),(17,1,9,'Premium Materials and Craftsmanship',5),(18,2,15,'The craftsmanship and choice of materials in these shoes truly stand out',4),(19,4,32,'Versatile Style for Every Occasion',5),(20,5,16,'Durability That Exceeds Expectations',5),(21,1,9,'Attention-Grabbing Design Details',5),(22,3,30,'It\'s clear that durability was a key focus in their design',3),(23,2,17,'The cushioning is just right, offering a perfect balance between softness and support.',5),(24,5,26,'One feature that pleasantly surprised me is how well these shoes handle different terrains.',5),(25,4,19,'Climate-Controlled Comfort',5),(26,2,33,'Good!!',5),(27,1,37,'These shoes aren\'t just about the present; they\'re an investment in the well-being of my feet for the long haul.',4),(28,3,36,'Easy Maintenance for Busy Lifestyles',5),(29,4,13,'These shoes feel like they were made for my feet! ',5),(30,5,23,'I love the trendy design of these shoes.',5),(31,2,11,'These shoes are built to last',5),(32,3,12,'I appreciate the versatility of these shoes.',4),(33,1,22,'The sizing is spot-on',5),(34,5,5,'Considering the quality and features, these shoes offer great value for the price',5),(35,4,2,'I appreciate that these shoes are easy to clean.',5),(36,1,24,'The unique details on these shoes set them apart.',5),(37,5,36,'I feel like I made a smart investment in a reliable and stylish pair.',4),(38,4,20,'Love the sleek design; it\'s both modern and timeless.',5),(39,3,16,'Feels incredibly lightweight, perfect for daily wear.',5),(40,2,8,'Instant comfort from the first step &ndash; no breaking in required!',5),(41,1,12,'Fashion-forward style without compromising on practicality.',5),(42,4,26,'Versatile enough to pair with any outfit &ndash; a true wardrobe staple.',5),(43,5,19,'Sturdy construction; these shoes are built to last.',3),(44,2,37,'Perfect',5),(45,3,31,'Chic details add a touch of flair without being over-the-top.',5),(46,2,16,'Love the on-trend color options &ndash; adds a pop to my wardrobe.',5),(47,4,8,'Easy to clean and maintain, saving time in my busy schedule.',5),(48,5,3,'Non-slip grip gives me confidence on various surfaces.',5),(49,1,34,'Transitions seamlessly from day to night with unmatched comfort.',4),(50,3,13,'Elevates my style effortlessly while maintaining everyday comfort.',5),(51,5,23,'The silhouette makes a statement without sacrificing comfort.',5),(52,4,30,'Stylish design without compromising on comfort &ndash; a rare find',5),(53,1,9,'Cushioning feels like walking on a cloud &ndash; pure bliss for my feet.',5),(54,2,17,'Embraces a minimalist aesthetic with a touch of chic sophistication.',5),(55,3,6,'Compact, lightweight, and travel-ready &ndash; my go-to for trips.',3),(56,2,33,'A classic style with a modern twist &ndash; love the updated look.',5),(57,1,34,'Provides targeted support exactly where my feet need it.',5),(58,5,18,'Convenient slip-on design for those on-the-go moments.',5),(59,4,23,'Breathable design keeps my feet cool and comfortable.',5),(60,3,13,'Fashion-forward style meets runway-ready comfort.',5),(61,2,6,'Always dressed to impress with these stylish kicks',5),(62,1,38,'A true ally for my feet &ndash; stylish and supportive',5),(63,3,1,'Urban edge meets all-day comfort in these shoes.',5),(64,5,6,'Perfect!!!',4),(65,4,12,'Ready for any adventure with these reliable shoes.',5),(66,1,16,'A delight for trendsetters &ndash; fashion meets function.',5),(67,4,22,'100 points',5),(68,2,27,'Instant style upgrade without sacrificing practicality.',5),(69,3,31,'Fashionable footwear that feels as good as it looks.',5),(70,5,2,'Achieve daylong ease without compromising on style.',5),(71,4,33,'ffortlessly elegant &ndash; these shoes elevate any ensemble.',4),(72,1,36,'Comfort that\'s stealthy &ndash; you forget you\'re even wearing them',5),(73,2,25,'Sharp, snazzy, and oh-so-comfortable &ndash; my ideal combo',5),(74,3,18,'Dapper with every step &ndash; these shoes make a statement',5),(75,5,26,'Walking in confidence with the perfect blend of style and support.',5),(76,3,17,'A modern classic that doesn\'t skimp on comfort',5),(77,2,32,'Chic style for those always on the go',5),(78,1,12,'Perfect',5),(79,5,7,'Urban charm that doesn\'t compromise on comfort',5),(80,4,16,'Not bad!',3),(81,2,9,'Fusion of fashion-forward and foot-friendly',5),(82,3,23,'Make a stylish stride with these standout shoes',5),(83,1,36,'Good good',5),(84,4,2,'Redefined my style game &ndash; these shoes are a game-changer.',5),(85,5,23,'Dynamic comfort meets contemporary style',5),(86,1,34,'Subtle yet sophisticated, these shoes capture attention',5),(87,3,13,'Runway-level style with unparalleled comfort',5),(88,2,3,'Smart, stylish, and an absolute pleasure to wear',5),(89,4,18,'A fashionable fusion of form and function.',4),(90,5,19,'Boosts my confidence with every confident step',5),(91,3,26,'Exudes effortless coolness &ndash; the epitome of style',5),(92,1,7,'These shoes not only talk the talk but walk the walk',5),(93,2,9,'Very cheap',5),(94,5,21,'Perfect for city life &ndash; chic and comfortable',5),(95,4,15,'Classic design with timeless appeal &ndash; a must-have',5),(96,2,4,'Confidence in every step &ndash; these shoes deliver.',5),(97,1,20,'Simplicity meets chic &ndash; a perfect style balance.',5),(98,3,36,'Elegant simplicity for an effortlessly polished look',4),(99,4,23,'Sporty yet sophisticated &ndash; the best of both worlds',5),(100,5,3,'Magical cushioning for a comfort-first experience.',5),(101,1,37,'Casual coolness redefined in these stylish kicks.',5),(102,5,2,'Fashion that feels featherweight &ndash; light and stylish',5),(103,2,18,'Striding through life in undeniable style',5),(104,4,24,'Casual charm with a dash of understated elegance	',5),(105,3,32,'Perfectttt',5),(106,1,14,'PerfReliable as a style companion &ndash; day in and day out.ect',5),(107,4,15,'Sleek, simple, and the epitome of modern style',5),(108,2,10,'I love it.',5),(109,5,29,'Pushing the boundaries of fashion with unrivaled comfort',5),(110,1,36,'Very good!',4),(111,3,12,'Motion meets sophistication &ndash; these shoes move with me',5),(112,4,28,'Designed for the city slicker &ndash; urban style at its finest.',5),(113,1,6,'There\'s nothing to criticize.',5),(114,2,2,'Elevates my everyday look effortlessly &ndash; comfort included.',4),(115,5,14,'Stylish resilience &ndash; these shoes can handle anything.',5),(116,2,4,'Leaving fashionable footprints wherever I go.',5),(117,3,35,'Effortlessly chic &ndash; the answer to everyday style dilemmas',5),(118,1,33,'Striding confidently with a touch of fashion-forward flair',5),(119,5,20,'Perfect for the urban explorer &ndash; style meets exploration.',5),(120,4,1,'Masters the art of smart casual &ndash; a versatile gem',5),(121,1,30,'Embracing modern minimalism with maximum style impact.',5),(122,3,18,'Putting my best foot forward in fashionable comfort',5),(123,5,24,'A rare find &ndash; style with substance and comfort combined',5),(124,2,27,'Perfect. I like it so much.',5);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `u_id` int NOT NULL,
  `o_id` int NOT NULL,
  `amount` int NOT NULL,
  `date` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4_idx` (`u_id`),
  CONSTRAINT `FK4` FOREIGN KEY (`u_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,5,1,53,'2023-01-04 03:30'),(2,5,2,49,'2023-08-04 09:20'),(3,5,3,13,'2023-07-05 12:09'),(4,5,4,543,'2023-02-06 08:43'),(5,5,5,494,'2023-11-06 08:48'),(6,5,6,233,'2023-04-06 08:49'),(7,5,7,352,'2023-02-06 08:52'),(8,5,8,84,'2023-06-06 09:58'),(9,5,8,84,'2023-12-06 10:05'),(10,5,9,273,'2023-10-06 10:13'),(11,5,10,278,'2023-09-06 10:15'),(12,5,11,268,'2023-03-06 10:25'),(13,7,12,1305,'2023-07-08 12:19'),(14,1,14,100,'2023-12-05 13:28'),(15,4,15,99,'2023-06-05 14:05'),(16,2,16,49,'2023-09-05 14:37'),(17,4,17,91,'2023-11-05 14:56'),(18,5,18,53,'2023-12-05 15:03'),(19,3,19,99,'2023-10-05 15:15'),(20,2,20,89,'2023-01-05 15:42'),(21,4,21,79,'2023-08-05 16:01'),(22,1,22,69,'2023-02-05 16:32'),(23,2,23,34,'2023-07-05 16:50'),(24,5,24,59,'2023-03-05 17:10'),(25,3,25,29,'2023-09-05 17:21'),(26,1,26,44,'2023-12-05 17:35'),(27,4,27,49,'2023-01-05 17:52'),(28,5,28,64,'2023-12-05 18:11'),(29,2,29,99,'2023-11-05 18:32'),(30,3,30,100,'2023-10-05 18:39'),(31,1,31,89,'2023-06-05 18:44'),(32,4,32,74,'2023-03-05 18:52'),(33,5,33,49,'2023-07-05 19:30'),(34,3,34,29,'2023-02-05 19:41'),(35,2,35,129,'2023-09-05 19:46'),(36,1,36,109,'2023-03-05 19:59'),(37,4,37,69,'2023-02-05 20:06'),(38,2,38,59,'2023-10-05 20:12'),(39,1,39,49,'2023-05-05 20:31'),(40,3,40,39,'2023-11-05 20:45'),(41,5,41,19,'2023-12-05 21:03'),(42,2,42,39,'2023-09-05 21:14'),(43,4,43,99,'2023-10-05 21:33'),(44,3,44,59,'2023-04-05 21:42'),(45,1,45,79,'2023-08-05 21:58'),(46,5,46,89,'2023-06-05 22:04'),(47,3,47,49,'2023-10-05 22:39'),(48,2,48,99,'2023-11-05 22:44'),(49,4,49,99,'2023-09-05 23:01'),(50,5,50,29,'2023-12-05 23:21'),(51,1,51,44,'2023-03-06 07:30'),(52,2,52,64,'2023-01-06 07:35'),(53,5,53,74,'2023-02-06 07:51'),(54,3,54,59,'2023-10-06 08:36'),(55,4,55,79,'2023-12-06 09:11'),(56,1,56,89,'2023-05-06 09:26'),(57,2,57,59,'2023-09-06 09:53'),(58,5,58,39,'2023-01-06 10:01'),(59,3,59,29,'2023-11-06 10:36'),(60,1,60,54,'2023-10-06 10:57'),(61,4,61,64,'2023-12-06 11:15'),(62,1,62,79,'2023-08-06 11:19'),(63,5,63,99,'2023-06-06 11:26'),(64,2,64,129,'2023-04-06 11:39'),(65,3,65,24,'2023-02-06 11:42'),(66,4,66,109,'2023-01-06 11:43'),(67,2,67,44,'2023-10-06 11:58'),(68,1,68,99,'2023-12-06 12:02'),(69,5,69,49,'2023-08-06 12:10'),(70,3,70,79,'2023-06-06 12:22'),(71,5,71,59,'2023-10-06 12:36'),(72,4,72,19,'2023-03-06 13:11'),(73,1,73,69,'2023-09-06 14:02'),(74,2,74,44,'2023-11-06 14:26'),(75,3,75,79,'2023-12-06 14:33'),(76,5,76,99,'2023-08-06 14:55'),(77,3,77,89,'2023-04-06 15:12'),(78,4,78,99,'2023-06-06 15:21'),(79,2,79,54,'2023-07-06 16:04'),(80,1,80,100,'2023-05-06 16:30'),(81,2,81,150,'2023-09-06 16:47'),(82,4,82,150,'2023-12-06 17:10'),(83,1,83,200,'2023-10-06 17:23'),(84,3,84,49,'2023-11-06 17:30'),(85,5,85,19,'2023-08-06 17:43'),(86,1,86,79,'2023-02-06 17:49'),(87,4,87,100,'2023-04-06 17:53'),(88,3,88,129,'2023-07-06 17:55'),(89,2,89,29,'2023-10-06 18:02'),(90,5,90,54,'2023-09-06 18:30'),(91,4,91,89,'2023-03-06 18:34'),(92,3,92,19,'2023-11-06 18:39'),(93,5,93,150,'2023-12-06 18:41'),(94,2,94,200,'2023-04-06 18:43'),(95,1,95,59,'2023-07-06 18:45'),(96,4,96,64,'2023-09-06 18:49'),(97,1,97,44,'2023-03-06 18:53'),(98,3,98,250,'2023-10-06 19:21'),(99,2,99,99,'2023-11-06 19:35'),(100,5,100,79,'2023-09-06 19:49'),(101,4,101,19,'2023-03-06 19:57'),(102,5,102,59,'2023-05-06 20:12'),(103,3,103,99,'2023-07-06 20:19'),(104,2,104,150,'2023-12-06 20:26'),(105,1,105,80,'2023-10-06 20:34'),(106,5,106,39,'2023-05-06 20:35'),(107,4,107,100,'2023-01-06 20:40'),(108,2,108,129,'2023-03-06 20:42'),(109,1,109,80,'2023-09-06 20:51'),(110,3,110,99,'2023-07-06 20:57'),(111,5,111,19,'2023-02-06 21:03'),(112,4,112,29,'2023-06-06 21:15'),(113,2,113,39,'2023-10-06 21:29'),(114,3,114,54,'2023-11-06 21:40'),(115,1,115,64,'2023-03-06 21:51'),(116,4,116,34,'2023-08-06 22:31'),(117,1,117,79,'2023-12-07 00:21'),(118,2,118,89,'2023-10-07 06:22'),(119,3,119,100,'2023-11-07 07:25'),(120,5,120,80,'2023-05-07 07:44'),(121,3,121,49,'2023-07-07 08:30'),(122,1,122,99,'2023-10-07 08:34'),(123,2,123,200,'2023-09-07 08:41'),(124,5,124,59,'2023-06-07 08:50'),(125,2,125,29,'2023-04-07 08:51'),(126,4,126,54,'2023-01-07 08:56'),(127,5,127,39,'2023-11-07 09:02'),(128,1,128,150,'2023-03-07 09:13'),(129,3,129,79,'2023-10-07 09:22'),(130,3,130,99,'2023-12-07 09:30'),(131,2,131,44,'2023-05-07 09:34'),(132,1,132,19,'2023-01-07 09:39'),(133,5,135,129,'2023-07-07 09:42'),(134,2,134,200,'2023-03-07 09:47'),(135,5,135,80,'2023-09-07 09:55'),(136,4,136,99,'2023-10-07 10:12'),(137,1,137,49,'2023-11-07 10:34'),(138,3,138,59,'2023-09-07 10:40'),(139,4,139,64,'2023-08-07 10:58'),(140,1,140,34,'2023-10-07 11:12'),(141,2,141,29,'2023-11-07 11:26'),(142,5,142,150,'2023-12-07 11:37'),(143,3,143,250,'2023-11-07 11:44'),(144,5,144,200,'2023-07-07 11:48'),(145,1,145,89,'2023-06-07 11:50'),(146,2,146,79,'2023-02-07 11:53'),(147,4,147,59,'2023-10-07 11:56'),(148,3,148,19,'2023-12-07 12:09'),(149,2,149,80,'2023-11-07 12:11'),(150,1,150,89,'2023-09-07 12:19'),(151,4,151,150,'2023-12-07 12:27'),(152,3,152,100,'2023-04-07 12:36'),(153,5,153,99,'2023-01-07 12:39'),(154,4,154,250,'2023-12-07 12:45');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `mobile` int NOT NULL,
  `address` varchar(450) NOT NULL,
  `password` varchar(450) NOT NULL,
  `code` int NOT NULL,
  `role` int NOT NULL,
  `di_id` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@gmail.com','Admin','/files/avt_1.png',398973408,'Quy Nhơn','$2a$12$7YDNjG3fdqaFv6byS.sF..e0vkp4LKpC0jp671ti2lg5a0maN0EoG',0,1,1),(2,'guest@gmail.com','Guest','/files/avt_2.png',398973408,'Quy Nhơn','$2a$12$A4jzQJZidzaplk5a.jEKhuYm1nZKSwTuL.QuXXhaDAVX91VKir69u',0,0,1),(3,'nguyenxuanquy147@gmail.com','Nguyen Quy','/files/avt_4.png',398973408,'Quy Nhơn','$2a$12$3EcjSG5HQm5OLLnFRBDlxuUz56V2K77DUuhNey5y0JRO7KWlsOteq',369885,0,1),(4,'nguyenquy090523@gmail.com','Nguyễn Xuân Quý','/files/avt_1.png',398973408,'Quy Nhơn','$2a$12$V3Lr1vfUNbSG0FzTRdqxN.KjdZNKFEYy6suDtPxiNOBpKWK.eiR6a',107879,0,1),(5,'quynxqe170239@fpt.edu.vn','Nguyen Xuan Quy','/files/avt_1.png',398973408,'Quy Nhon','$2a$12$5PR4rl4XWdQq9.DL2WJLUuL83Rp59ffQi6J3c9MNBR24eQHDaVyc2',0,0,1),(6,'nguyenxuanquy090523@gmail.com','Nguyễn Xuân Quý','/files/avt_def.jpg',398973408,'Quy Nhơn, Ghềnh Ráng','$2a$12$j75LNmWu303ul.t2feYZhu0zXjGnS.aTX7Io9f4txQE4ji7J/r46O',341753,0,2),(7,'hoanctqe170187@fpt.edu.vn','Cao Trung Hoan','/files/IMG_3209.jpg',398973408,'Quy Nhon','$2a$12$qtTS0MUE98t8sGH1qm/Qcea6R2ivkD3dUC0an3l0rT4vWvLX56vp2',0,0,0),(8,'caotrunghoan2003@gmail.com','Trung Hoan','/files/avt_def.jpg',357859348,'Quy Nhơn','$2a$12$h67u.MX3AzdwmFHVhYT.FOOJu1q59IYBu2SheXrvSsJOqC3pu.Cee',118008,0,2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 17:01:56
