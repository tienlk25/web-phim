-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: javawebdevpro001
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Hành động',1),(2,'Viễn tưởng',1),(3,'Kinh dị',1),(4,'Phiêu lưu',1),(5,'hài hước',1),(6,'Tình cảm',1),(7,'Hình sự',1),(8,'Hoạt hình',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_UNIQUE` (`country`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Âu-Mỹ',1),(2,'Trung Quốc',1),(3,'Hàn Quốc',1),(4,'Việt Nam',1),(5,'Mỹ',1);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_movie`
--

DROP TABLE IF EXISTS `favorite_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_movie` (
  `movie_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_movie`
--

LOCK TABLES `favorite_movie` WRITE;
/*!40000 ALTER TABLE `favorite_movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hinhthuc`
--

DROP TABLE IF EXISTS `hinhthuc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hinhthuc` (
  `hinhthuc_id` int(11) NOT NULL AUTO_INCREMENT,
  `hinhthuc` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`hinhthuc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hinhthuc`
--

LOCK TABLES `hinhthuc` WRITE;
/*!40000 ALTER TABLE `hinhthuc` DISABLE KEYS */;
INSERT INTO `hinhthuc` VALUES (1,'Phim bộ',1),(2,'Phim lẻ',1);
/*!40000 ALTER TABLE `hinhthuc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `imagepath` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `mime` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `phim` (`phim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (13,'F:/Project/ProjectBack-End/java-web-001/upload/img/','hobbit-2.jpg','image/jpeg',16),(35,'F:/Project/ProjectBack-End/java-web-001/upload/img/','hobbit-2.jpg','image/jpeg',16),(36,'F:/Project/ProjectBack-End/java-web-001/upload/img/','the-dark-knight.jpg','image/jpeg',36),(37,'F:/Project/ProjectBack-End/java-web-001/upload/img/','the-god-father.jpg','image/jpeg',37),(38,'F:/Project/ProjectBack-End/java-web-001/upload/img/','Lord-Of-The-Ring3.jpg','image/jpeg',38),(40,'F:/Project/ProjectBack-End/java-web-001/upload/img/','natra.jpg','image/jpeg',40),(41,'F:/Project/ProjectBack-End/java-web-001/upload/img/','up.jpg','image/jpeg',41),(42,'F:/Project/ProjectBack-End/java-web-001/upload/img/','romang.jpg','image/jpeg',42),(43,'F:/Project/ProjectBack-End/java-web-001/upload/img/','hobbit-2.jpg','image/jpeg',16),(45,'F:/Project/ProjectBack-End/java-web-001/upload/img/','spider-man-2.jpg','image/jpeg',44);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phim`
--

DROP TABLE IF EXISTS `phim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phim` (
  `phim_id` int(11) NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `movie_video` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `daodien` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `imdb` float DEFAULT NULL,
  `ngayphathanh` varchar(12) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(2000) COLLATE utf8mb4_bin DEFAULT NULL,
  `details` text COLLATE utf8mb4_bin,
  `title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `series` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `thoiluong` int(11) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `hinhthuc_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`phim_id`),
  KEY `hinhthuc_idx` (`hinhthuc_id`),
  KEY `theloai_idx` (`category_id`),
  KEY `country_idx` (`country_id`),
  CONSTRAINT `country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`),
  CONSTRAINT `hinhthuc` FOREIGN KEY (`hinhthuc_id`) REFERENCES `hinhthuc` (`hinhthuc_id`),
  CONSTRAINT `theloai` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phim`
--

LOCK TABLES `phim` WRITE;
/*!40000 ALTER TABLE `phim` DISABLE KEYS */;
INSERT INTO `phim` VALUES (16,'The Hobbit: The Desolation of Smaug',NULL,' Peter Jackson',7.8,'13/12/2013','Người Hobbit 2: Đại Chiến Với Rồng Lửa chỉnh sửa','<p><span style=\"font-family: Roboto, sans-serif; font-size: 16px;\">Bỏ lại đằng sau những cảnh quay mát mắt của làng Shire, các thảo nguyên rộng lớn hay khung cảnh kỳ vĩ xinh đẹp của thung lũng Rivendell, Người Hobbit: Đại chiến với rồng lửa không còn là một bộ phim mãn nhãn về mặt thị giác với những cảnh quay lộng lẫy như phần trước, Người Hobbit: Hành trình vô định. Ngược lại, Người Hobbit: Đại chiến với rồng lửa mang đến một cái nhìn huyền bí, tăm tối và vô cùng u ám về hành trình giết rồng của 13 người lùn và một chàng Hobbit. Gần như toàn bộ bối cảnh của phim đều diễn ra trong nhà kho, ngục tối, dưới lòng đất, các hầm mỏ hay những đại sảnh tối đen. Bên cạnh đó, những cảnh quay chém giết trần trụi và mạnh bạo cũng dễ dàng khiến khán giả phải “lạnh sống lưng” khi thưởng thức tác phẩm điện ảnh này.&nbsp;</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: Roboto, sans-serif; font-size: 16px;\">Nhìn chung, Người Hobbit: Đại chiến với rồng lửa vẫn giữ được nguyên tinh thần và phong cách làm phim của đạo diễn Peter Jackson: chậm rãi, từ tốn, thong thả nhưng vẫn biết cách tạo sự dồn dập, ấn tượng trong từng phân đoạn lẻ. Tuy nhiên, có lẽ vì là một phần dở dang cả đầu lẫn cuối (phần giữa của loạt phim ba tập), nên Người Hobbit: Đại chiến với rồng lửa sẽ không thể chinh phục được những người không phải fan của phim hay bộ truyện này. Chính những tình tiết lỡ dở, không chốt không mở của phim khiến đã làm mất đi tinh thần của một tác phẩm điện ảnh hoàn chỉnh.</p>','The Hobbit: The Desolation Of Smaug (2013)','The lord of the rings',NULL,1,2,2),(36,'Batman: The Dark Knight',NULL,'Christopher Nolan',8.4,'26/7/2019','Người Dơi 3: Kỵ Sĩ Bóng Đêm\r\n','<p><span style=\"color: rgb(205, 205, 205); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px; background-color: rgba(0, 0, 0, 0.3);\">Người dơi bước vào giai đoạn cam go nhất trong cuộc chiến chống lại cái ác khi tên tội phạm bậc thầy The Joker xuất hiện. Các tay trùm thuê The Joker giết người dơi để trả thù cho chỗ tài sản phi pháp bị anh lật tẩy. Tiếp tay cho The Joker là toàn bộ tội phạm ở thành phố Gotham, những kẻ đang bị bộ ba Người dơi – Trung úy Gordon – Luật sư Harvey Dent thu hẹp đất sống. Hàng loạt vụ tấn công xảy ra khiến Người dơi lúng túng. Các quan chức bị sát hại, người dân không dám ra đường buổi tối vì sợ bị giết, mọi lối ra vào thành phố Gotham bị phong tỏa. Tất cả đều do một tay The Joker sắp đặt. Luật sư Dent và cô bạn lâu năm của Người dơi là Rachel Dawes bị lôi đến hai nhà kho chứa bom hẹn giờ. Quỷ kế của The Joker khiến Người dơi không kịp đến cứu bạn, luật sư Dent may mắn thoát chết nhưng bị cháy nửa mặt. The Joker giúp Dent thoát khỏi bệnh viện, đồng thời xúi giục y trút hết hận thù lên người dơi, cảnh sát và các ông trùm. Điên cuồng vì mất nàng Dawes, luật sư Dent trở thành kẻ Lưỡng diện xấu xa, trong số các nạn nhân của y suýt nữa có cả người dơi và toàn bộ gia đình trung úy Gordon. Không muốn dân chúng Gotham mất tinh thần khi biết sự thật về người đứng đầu thành phố, Người dơi quyết định đứng ra nhận tội thay Dent...</span><br></p>','Batman: The Dark Knight (2008)','DC Comics Series',NULL,3,1,1),(37,'The Godfather',NULL,'Francis Ford Coppola',9.2,'24/3/1972','Bố già','<p><span style=\"color: rgb(187, 187, 187); font-family: arial; background-color: rgb(34, 34, 34);\">The Godfather 1 được chuyển thể từ tiểu thuyết cùng tên của nhà văn Mario Puzo. Vito Corleone là ông trùm khét tiếng nhất tại Mỹ lúc bấy giờ. Tuy nhiên, con trai út của ông - Michael sau khi trở về từ Thế chiến II quyết định không tham gia bất cứ phi vụ gì của gia đình. Nhưng trong đám cưới của con gái Vito, một trận chiến khốc liệt nổ ra trong thế giới tội phạm, Michael chứng kiến cha mình bị bọn mafia đối đầu ám sát.</span><br style=\"color: rgb(187, 187, 187); font-family: arial; background-color: rgb(34, 34, 34);\"><br style=\"color: rgb(187, 187, 187); font-family: arial; background-color: rgb(34, 34, 34);\"><span style=\"color: rgb(187, 187, 187); font-family: arial; background-color: rgb(34, 34, 34);\">Tuy nhiên, cha anh đã may mắn thoát chết trong vụ ám sát này. Sau khi phá vỡ được kế hoạch ám sát lần thứ hai, anh quyết định đi báo thù cho cha mình. Nhưng cũng từ đây. Michael bước vào hành trình đầy máu và hiểm nguy, anh sẽ làm gì? Với tình tiết thắt nút, mở nút cũng như những màn đấu súng nguy hiểm, phim đưa người xem đến với thế giới tội phạm đầy bạo lực, tàn nhẫn với những vỏ bọc giả dối thông qua câu chuyện của một gia đình mafia gốc Italy ở New York. Godfather từng giành 3 giải Oscar và luôn nằm trong số những bộ phim hay nhất của mọi thời đại.</span><br style=\"color: rgb(187, 187, 187); font-family: arial; background-color: rgb(34, 34, 34);\"></p>','The Godfather (1972)','The Godfather',NULL,5,2,7),(38,'The Lord Of The Rings: The Return Of The King',NULL,'Peter Jackson',8.9,'17/12/2003','Chúa Tế Những Chiếc Nhẫn 3: Sự Trở Về Của Nhà Vua','<p><span style=\"color: rgb(205, 205, 205); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px; background-color: rgba(0, 0, 0, 0.3);\">(Bruce Spence) đã bao vây Minas Tirith – thủ đô của xứ Gondor nhằm truy sát hết giống người trên hành tinh này. Vương quốc một thời hưng thịnh nhất hơn bao giờ hết cần một vị vua tài giỏi lên lãnh đạo. Nhưng liệu Arago (Viggo Mortensen) có đáp lời dòng máu tổ tiên đang chảy trong huyết quản và tiếp nhận vị trí dành cho anh ngay từ khi mới sinh ra? Trong một chừng mực nào đó, trách nhiệm bảo vệ số phận toàn thể con người được đặt lên đôi vai rộng lớn của anh. Trận chiến cuối cùng bùng nổ và quân đoàn bóng tối tụ họp, Gandalf (Ian McKellen) phải nhanh chóng tập hợp lại đội quân của Gondor với sự trợ giúp của Vua Theoden xứ Rohan (Beard Hill) người đang quy tụ các chiến binh trong một cuộc tập trận lớn nhất từ trước tới nay.</span><br></p>','The Lord Of The Rings: The Return Of The King (2003)','The lord of the rings',NULL,1,2,2),(40,'Nezha: The Devil\'s Birth',NULL,'Yu Yang',8,'13/12/2013','Na Tra: Ma Đồng Giáng Thế\r\n','<p><span style=\"color: rgb(205, 205, 205); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px; background-color: rgba(0, 0, 0, 0.3);\">Nezha: The Devil\'s Birth (Na Tra: Ma Đồng Giáng Thế): Từ thuở hồng hoang, tinh hoa đất trời tích tụ thành một viên nguyên châu chứa đựng năng lượng khổng lồ. Viên nguyên châu này được Nguyên Thủy Thiên Tôn tách đôi thành linh châu và ma hoàn. Ai sở hữu ma hoàn sẽ biến thành Ma Vương, còn người sở hữu linh châu sẽ trở thành anh hùng cứu thế. Vốn dĩ viên linh châu này sẽ được Thái Ất Chân Nhân mang đến cho con trai sắp ra đời của Lý Tịnh. Tuy nhiên, viên linh châu đã bị đánh tráo, con trai Na Tra của Lý Tịnh đầu thai với linh lực của viên ma hoàn vì vậy Na Tra từ khi sinh ra đã bị mọi người coi như một quái vật, không có 1 đứa trẻ nào chịu chơi cùng hắn, bị ghẻ lạnh, bị đánh đuổi ác liệt. Nhưng rồi Natra gặp được Ngao Bính (Tam Thái Tử của Long Tộc ) người duy nhất chịu lắng nghe hắn, cùng hắn chơi đùa, không ghét bỏ và hai người đã thực sự trở thành bạn của nhau. Tuy nhiên dường như số phận đã định, Natra ngay từ khi sinh ra đã bị coi như một ma đồng, còn Ngao Bính lại là người phải tiêu diệt ma đồng đó. Liệu Na Tra trong phiên bản này có lột vảy rồng, rút gân của Ngao Bính và tiêu diệt Long tộc hay không? Kết cục của 2 người họ sẽ ra sao? Số phận trớ trêu liệu có thể thay đổi giống như Na Tra từng nói \"Mệnh ta do ta định, không do trời định”.</span><br></p>','Nezha: The Devil\'s Birth (2019)','the legend',NULL,3,1,1),(41,'Up',NULL,'Francis Ford Coppola',9,'24/3/1972','VÚT BAY\r\n','<p><span style=\"color: rgb(187, 187, 187); font-family: arial; background-color: rgb(34, 34, 34);\">Ông già Carl quyết hoàn thành chuyến đi ấp ú cả đời tới Thác thiên đường bằng ngôi nhà kết hàng nghìn quả bóng bay. Ngay khi vừa \"cất cánh\", ông phát hiện ra người đồng hành bất đắc dĩ: Cậu bé hướng đạo sinh Russell lắm mồm. Kể từ đây, cuộc phiêu lưu kì thú của 2 ông cháu diễn ra với biết bao bất ngờ cùng nguy hiểm rình rập...</span><br></p>','Up (2009)','The Godfather',NULL,3,1,1),(42,'Romang',NULL,'Lee Chang-Geun',7.7,'26/7/2019','ĐIỀU BA MẸ KHÔNG KỂ\r\n','<p><span style=\"color: rgb(187, 187, 187); font-family: arial; background-color: rgb(34, 34, 34);\">Cho Nam-bong và Lee Mae-ja là cặp vợ chồng già cùng mắc căn bệnh mất trí nhớ. Sau 45 năm chung sống, họ chẳng thể nhớ lần cuối mình từng hạnh phúc là khi nào. Tuy nhiên, khi ký ức dần mất đi, tình yêu và ước mơ từng bị bỏ quên của họ lại dần nhen nhóm lại.</span><br></p>','Romang (2019)','Korea',NULL,3,1,1),(44,'Spider Man 2',NULL,'Sam Raimi',7.4,'18/7/2008','Người nhện 2','<p><span style=\"color: rgb(187, 187, 187); font-family: arial; background-color: rgb(34, 34, 34);\">Spider Man 2 là phần thứ hai của series phim Spider Man. Hai năm trôi qua kể từ khi Peter phát hiện ra khả năng kì lạ của mình. Cậu phải luôn cố gắng cân bằng hai số phận khác nhau trong cùng con người mình: Người nhện trừ gian diệt bạo và một cậu sinh viên bình thường. Peter quyết định nói sự thật với Mary Jane, người mà anh đã thầm yêu từ lâu. Nhưng đây cũng là lúc tình bạn thân thiết giữa Peter và Harry ngày càng phức tạp bởi sau cái chết của cha mình, Harry nuôi mối thù với Người Nhện. Cùng lúc, tập đoàn Oscorp lại là nơi một quái nhân khác xuất hiện - Giáo sư Bạch tuộc. Peter phải làm gì để giữ vững tình yêu và tình bạn? Anh có chiến thắng giáo sư Bạch tuộc?</span><br></p>','Spider Man 2 (2004)','MCU',NULL,5,2,2);
/*!40000 ALTER TABLE `phim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `create_time` date DEFAULT NULL,
  `mobile` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `password` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Trương Hữu Tiến ','Tienlk25@gmail.com',NULL,378935817,0,'Colennao'),(2,'Tien123','anhvbr@gmail.com','2019-11-29',26656,0,'ciojlasdn');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `videopath` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `mime` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`video_id`),
  KEY `movie_idx` (`movie_id`),
  CONSTRAINT `movie` FOREIGN KEY (`movie_id`) REFERENCES `phim` (`phim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (2,'F:/Project/ProjectBack-End/java-web-001/upload/video/','video/mp4','theHobbit-2.mp4',16);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-12  8:34:25
