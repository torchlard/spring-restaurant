DROP DATABASE IF EXISTS Restaurant;
CREATE DATABASE Restaurant;
USE Restaurant;

--
-- Table structure for table `staff`
--
-- DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `contactNumber` int(11) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `table`
--
-- DROP TABLE IF EXISTS `table`;
CREATE TABLE `table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tableNo` varchar(10) NOT NULL,
  `numOfSeat` int(11) DEFAULT NULL,
  `available` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `menu`
--
-- DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foodName` varchar(45) DEFAULT NULL,
  `price` float(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `report`
--
-- DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `income` int(11) DEFAULT NULL,
  `date` DATE DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `staffID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Report_Manager1_idx` (`staffID`),
  CONSTRAINT `fk_Report_Manager1` FOREIGN KEY (`staffID`) REFERENCES `staff` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `masterorder`
--
-- DROP TABLE IF EXISTS `masterorder`;
CREATE TABLE `masterorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` float(11) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `change` int(11) DEFAULT NULL,
  `staffID` int(11) DEFAULT NULL,
  `reportID` int(11) DEFAULT NULL,
  `tableID` int(11) DEFAULT NULL,
  `checkOutTime` TIME(1) DEFAULT NULL,
  `checkOutDate` DATE NOT NULL DEFAULT '1000-01-01',
  PRIMARY KEY (`id`),
  KEY `fk_MasterOrder_Waiter1_idx` (`staffID`),
  KEY `fk_MasterOrder_Table1_idx` (`tableID`),
  CONSTRAINT `fk_MasterOrder_Table1` FOREIGN KEY (`tableID`) REFERENCES `table` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_MasterOrder_Waiter1` FOREIGN KEY (`staffID`) REFERENCES `staff` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_MasterOrder_Report1` FOREIGN KEY (`reportID`) REFERENCES `report` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `order`
--
-- DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `masterOrderID` int(11) DEFAULT NULL,
  `foodID` int(11) DEFAULT NULL,
  `price` float(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Order_MasterOrder1_idx` (`masterOrderID`),
  KEY `fk_Order_Menu1_idx` (`foodID`),
  CONSTRAINT `fk_Order_MasterOrder1` FOREIGN KEY (`masterOrderID`) REFERENCES `masterorder` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_Order_Menu1` FOREIGN KEY (`foodID`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
