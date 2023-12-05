CREATE DATABASE DB_TGDD
GO

USE DB_TGDD
GO

CREATE TABLE ProductCategory
(
	CatID INT IDENTITY (1,1),
	CatName NVARCHAR(250) NOT NULL,
	SeoTitle NVARCHAR(250),
	CreatedDate DATETIME DEFAULT GETDATE(),
	CreatedBy VARCHAR(50),
	ModifiedDate DATETIME DEFAULT GETDATE(),
	ModifiedBy VARCHAR(50),
	MetaKeywords NVARCHAR(250),
	MetaDescriptions NVARCHAR(250),
	Active BIT DEFAULT 1,
	CategoryImage NVARCHAR(250),
	CONSTRAINT PK_Categories PRIMARY KEY (CatID)
)	

CREATE TABLE Brand
(
	BrandID INT IDENTITY (1,1),
	BrandName NVARCHAR(250) NOT NULL,
	BrandImage VARCHAR(250) NOT NULL,
	CatID INT NOT NULL,	
	Active BIT DEFAULT 1,
	CONSTRAINT PK_Brand PRIMARY KEY (BrandID),
	CONSTRAINT FK_Brand_Categories FOREIGN KEY (CatID) REFERENCES ProductCategory(CatID)
)

CREATE TABLE Product
(
	ProductID INT IDENTITY (1,1),
	ProductName NVARCHAR(250) NOT NULL,
	MetaTitle VARCHAR(250),
	ProductDes NVARCHAR(MAX),
	CatID INT NOT NULL,
	BrandID INT NOT NULL,
	Price DECIMAL NOT NULL,
	PromotionPrice DECIMAL,
	ProductImage NVARCHAR(250),
	Quantity INT CHECK(Quantity > 0) DEFAULT 1,
	Warranty INT CHECK (Warranty > 0) DEFAULT 12, 
	CreatedDate DATETIME DEFAULT GETDATE(),
	CreatedBy VARCHAR(50),
	ModifiedDate DATETIME DEFAULT GETDATE(),
	ModifiedBy VARCHAR(50),
	MetaKeywords NVARCHAR(250),
	MetaDescriptions NVARCHAR(250),
	Active BIT DEFAULT 1,
	CONSTRAINT PK_Products PRIMARY KEY (ProductID),
	CONSTRAINT FK_Products_Categories FOREIGN KEY (CatID) REFERENCES ProductCategory(CatID),
	CONSTRAINT FK_Products_Brand FOREIGN KEY (BrandID) REFERENCES Brand(BrandID)
)

CREATE TABLE Users
(
	UserName varchar(50) NOT NULL,
	Password VARCHAR(50) NOT NULL,
	Name NVARCHAR(150) NOT NULL,
	Phone NVARCHAR(12) NOT NULL,
	Email NVARCHAR(50) DEFAULT N'Chưa xác định',
	Address NVARCHAR(250) NOT NULL,
	CreatedDate DATETIME DEFAULT GETDATE(),
	CreatedBy VARCHAR(50),
	ModifiedDate DATETIME DEFAULT GETDATE(),
	ModifiedBy VARCHAR(50),
	Role NVARCHAR(150) DEFAULT 'User',
	Active BIT DEFAULT 1,
	CONSTRAINT PK_Users PRIMARY KEY (UserName),
)

CREATE TABLE Orders
(
	OrderID int identity(1,1),
	CreatedDate DATE DEFAULT GETDATE(),
	ShipDate DATE DEFAULT DATEADD(day,7,GETDATE()),
	Status BIT DEFAULT 0,
	ShipStatus BIT DEFAULT 0,
	UserName varchar(50) NOT NULL,
	CONSTRAINT PK_Orders PRIMARY KEY (OrderID),
	CONSTRAINT FK_Orders_Users FOREIGN KEY (UserName) REFERENCES Users(UserName)
)

CREATE TABLE OrderDetail
(
	OrderID int not null,
	ProductID int not null,
	Quantity int CHECK(Quantity > 0) DEFAULT 1,
	Price DECIMAL NOT NULL,
	CONSTRAINT PK_OrderDetail Primary Key (OrderID, ProductID),
	Constraint FK_OrderDetail_Orders Foreign key (OrderID) references Orders(OrderID),
	Constraint FK_OrderDetail_Product Foreign key (ProductID) references Product(ProductID)
)

CREATE TABLE DETAILPRO
(
	ProductID INT,
	IDDetail INT identity(1,1),

	ManHinh nvarchar(100),
	HeDieuHanh  nvarchar(100),
	Chip  nvarchar(100),
	RAM  nvarchar(100),
	DungLuong  nvarchar(100),
	KetNoi nvarchar(100),
	Sim nvarchar(100),
	CamSau nvarchar(100),
	CamTruoc nvarchar(100),
	Pin_Sac nvarchar(100),
	Hang nvarchar(100),
	Loai nvarchar(100),
	CONSTRAINT PK_DETAILPRO Primary Key (ProductID, IDDetail),
	Constraint FK_DETAILPRO_Product Foreign key (ProductID) references Product(ProductID)
)

CREATE TABLE DETAILLAP
(
	ProductID INT,
	IDDetailLap INT identity(1,1),

	CPU nvarchar(100),
	RAM nvarchar(100),
	OCung nvarchar(300),
	ManHinh nvarchar(300),
	CardMH nvarchar(300),
	CongKetNoi nvarchar(300),
	DacBiet nvarchar(300),
	HeDieuHanh nvarchar(300),
	ThietKe nvarchar(300),
	KichThuoc_Kl nvarchar(300),
	ThoiDiemRaMat nvarchar(10),
	Hang nvarchar(100),
	Loai nvarchar(100),
	CONSTRAINT PK_DETAILLAP Primary Key (ProductID, IDDetailLap),
	Constraint FK_DETAILLAP_Product Foreign key (ProductID) references Product(ProductID)
)

INSERT INTO ProductCategory(CatName,SeoTitle,CreatedBy,MetaKeywords,MetaDescriptions,Active,CategoryImage)
VALUES
	(N'Điện Thoại','dien-thoai','admin1',N'dien-thoai',N'Điện Thoại',1,N'icon-phone-96x96.png'),
	(N'Laptop','laptop','admin1',N'laptop',N'Laptop',1,N'icon-laptop.png'),
	(N'Tablet','tablet','admin1',N'tablet',N'Tablet',1,N'icon-tablet.png'),
	(N'SmartWatch','smartwatch','admin1',N'SmartWatch',N'SmartWatch',1,N'icon-smartwatch.png'),
	(N'PC','pc','admin1',N'PC',N'PC',1,N'icon-pc.png'),
	(N'Phụ Kiện','phu-kien','admin1',N'phu-kien',N'Phụ Kiện',1,N'icon-headphone.png')
SELECT * FROM ProductCategory
--Delete from ProductCategory

INSERT INTO Brand (BrandName, BrandImage, CatID, Active)
VALUES
('Oppo','logo-oppo.png', 1, 1),
('SamSung', 'logo-samsung.png',1, 1),
('Iphone', 'logo-iphone.png',1, 1),
('Xiaomi', 'logo-xiaomi.png',1, 1),
('Vivo','logo-vivo.png', 1, 1),
('Realme','logo-realme.png', 1, 1),
('MacBook','logo-macbook.png', 2, 1),
('Acer','logo-acer.png', 2, 1),
('Asus','logo-asus.png', 2, 1),
('MSI','logo-msi.png', 2, 1),
('HP','logo-hp.png', 2, 1),
('Lenovo','logo-lenovo.png', 2, 1),
('Gigabyte','logo-gigabyte.png', 2, 1),
('Dell','logo-dell.png', 2, 1),
('Ipad','logo-ipad.png', 3, 1),
('SamSung','logo-samsung.png', 3, 1),
('Lenovo','logo-lenovo.png', 3, 1),
('Apple', 'logo-apple.png',4, 1),
('Xiaomi', 'logo-xiaomi.png',4, 1),
('BeFit','logo-BeFit.png', 4, 1),
('imoo','logo-imoo.png', 4, 1),
('Asus','logo-asus.png', 5, 1),
('HP','logo-hp.png', 5, 1),
('MacBook','logo-macbook.png', 5, 1),
('Ava+','logo-avaplus.png', 6, 1),
('Baseus','logo-baseus.png', 6, 1),
('Xmobile','logo-xmobile.png', 6, 1)





INSERT INTO Users(UserName,Password,Name,Phone,Email,Address,CreatedBy,Role)
VALUES
('admin1','123456',N'Lê Trần Công','09876543154','ltc@gmail.com','TP.HCM',null, 'Admin'),
('user1','123',N'Nguyễn Văn An','0987623456','nva@gmail.com','TP.HCM','admin1', 'User'),
('user3','123',N'Nguyễn Văn An','0987623456','nva@gmail.com','TP.HCM','admin1', 'User')
select*from Users
--delete from Accounts

--delete from Product
INSERT INTO Product
VALUES
--Phone--
	--Oppo--
(N'OPPO Find N2 Flip 5G',N'OPPO Find N2 Flip 5G',N'Full HD+',1,1,19990000,5990000,N'OPPO Find N2 Flip 5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'OPPO Reno8 T 5G',N'OPPO Reno8 T 5G',N'Full HD+',1,1,9990000,8990000,N'OPPO Reno8 T 5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'OPPO Find X5 Pro 5G',N'OPPO Find X5 Pro 5G',N'Full HD+',1,1,17990000,14990000,N'OPPO Find X5 Pro 5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'OPPO Reno8 series',N'OPPO Reno8 series',N'Full HD+',1,1,30000000,13990000,N'OPPO Reno8 series.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'OPPO Reno10 5G',N'OPPO Reno10 5G',N'Full HD+',1,1,9990000,9490000,N'OPPO-Reno10-5G.jpg',1,12,'02/07/2022','admin1','02/07/2022','admin1',N'Phone',N' Reno10 5G',1),
	--SamSung--
(N'Samsung Galaxy A24',N'Samsung Galaxy A24',N'Full HD+',1,2,6990000,5990000,N'Samsung Galaxy A24.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'Samsung Galaxy S21 FE 5G',N'Samsung Galaxy S21 FE 5G',N'Full HD+',1,2,7990000,6990000,N'Samsung Galaxy S21 FE 5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'Samsung Galaxy S23 Ultra 5G',N'Samsung Galaxy S23 Ultra 5G',N'Quad HD+ (2K+)',1,2,36990000,28990000,N'Samsung Galaxy S23 Ultra 5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'Samsung Galaxy A34 5G',N'Samsung Galaxy A34 5G',N'Full HD+',1,2,8490000,7490000,N'Samsung Galaxy A34 5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'Samsung Galaxy Z Flip5 5G',N'Samsung Galaxy Z Flip5 5G',N'Full HD+',1,2,29990000,25990000,N'Samsung Galaxy Z Flip5 5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'Samsung Galaxy A04s',N'Samsung Galaxy A04s',N'Full HD+',1,2,3990000,2990000,N'Samsung Galaxy A04s.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'Samsung Galaxy Z Fold5 5G',N'Samsung Galaxy Z Fold5 5G',N'Quad HD+ (2K+)',1,2,60990000,40990000,N'Samsung-Galaxy-Z-Fold5-5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' Z Fold5 5G',1),
	--Iphone--
(N'iPhone 14',N'iPhone 14',N' Super Retina XDR',1,3,30000000,19190000,N'iPhone 14.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'iPhone 11',N'iPhone 11',N' Liquid Retina',1,3,30000000,10190000,N'iPhone 11.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'iPhone 14 Pro',N'iPhone 14 Pro',N'Super Retina XDR',1,3,24190000,9990000,N'iPhone-14-Pro.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' 14-Pro',1),
	--Xiaomi--
(N'Xiaomi Redmi 12',N'Xiaomi Redmi 12',N'Full HD+',1,4,30000000,19990000,N'Xiaomi Redmi 12.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'Xiaomi Redmi 12C',N'Xiaomi Redmi 12C',N'Full HD+',1,4,30000000,2490000,N'Xiaomi Redmi 12C.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'Xiaomi Redmi A1',N'Xiaomi Redmi A1',N'Full HD+',1,4,30000000,1690000,N'Xiaomi Redmi A1.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'Xiaomi Redmi Note 12 4G',N'Xiaomi Redmi Note 12 4G',N'Full HD+',1,4,30000000,5790000,N'Xiaomi Redmi Note 12 4G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
	--Vivo--
(N'vivo Y36',N'vivo Y36',N'Full HD+',1,5,30000000,589000,N'vivo Y36.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'vivo Y02T',N'vivo Y02T',N'Full HD+',1,5,30000000,3290000,N'vivo Y02T.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'Vivo Y16',N'Vivo Y16',N'Full HD+',1,5,30000000,3090000,N'Vivo Y16.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'Vivo Y02s',N'Vivo Y02s',N'Full HD+',1,5,30000000,2290000,N'Vivo Y02s.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'vivo Y02A',N'vivo Y02A',N'Full HD+',1,5,30000000,2790000,N'vivo Y02A.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
	--Realme--
(N'realme  C55',N'realme  C55',N'Full HD+',1,6,30000000,1690000,N'realme  C55.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'realme C55',N'realme C55',N'Full HD+',1,6,30000000,4790000,N'realme C55.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'realme  10',N'realme  10',N'Full HD+',1,6,30000000,4490000,N'realme  10.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
--Tablet--
	--Ipad--
(N'iPad 9 WiFi',N'iPad 9 WiFi',N'Retina IPS LCD',3,15,30000000,7990000,N'iPad 9 WiFi.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
(N'iPad Air 5 M1 Wifi 64GB',N'iPad Air 5 M1 Wifi 64GB',N'Retina IPS LCD',3,15,30000000,14590000,N'iPad Air 5 M1 Wifi 64GB.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
(N'iPad 10 WiFi',N'iPad 10 WiFi',N'Retina IPS LCD ',3,15,30000000,11390000,N'iPad 10 WiFi.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
(N'iPad Pro M1 11 inch WiFi Cellular 2TB (2021)',N'iPad Pro M1 11 inch WiFi Cellular 2TB (2021)',N'Liquid Retina',3,15,90000000,50990000,N'iPad Pro M1 11 inch WiFi Cellular 2TB (2021).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
(N'iPad mini 6 WiFi 256GB',N'iPad mini 6 WiFi 256GB',N'LED-backlit IPS LCD ',3,15,30000000,16390000,N'iPad mini 6 WiFi 256GB.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
(N'iPad Pro M1 11 inch WiFi 2TB (2021)',N'iPad Pro M1 11 inch WiFi 2TB (2021)',N'Liquid Retina',3,15,80000000,44990000,N'iPad Pro M1 11 inch WiFi 2TB (2021).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
(N'iPad Pro M2 11 inch WiFi',N'iPad Pro M2 11 inch WiFi',N'Liquid Retina',3,15,30000000,20690000,N'iPad Pro M2 11 inch WiFi.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
(N'iPad Air 5 M1 5G',N'iPad Air 5 M1 5G',N'Retina IPS LCD',3,15,30000000,17990000,N'iPad Air 5 M1 5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
(N'iPad mini 6 WiFi Cellular 64GB',N'iPad mini 6 WiFi Cellular 64GB',N'LED-backlit IPS LCD',3,15,30000000,15990000,N'iPad mini 6 WiFi Cellular 64GB.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
(N'iPad Pro M1 12.9 inch WiFi',N'iPad Pro M1 12.9 inch WiFi',N'Liquid Retina XDR ',3,15,70000000,32690000,N'iPad Pro M1 12.9 inch WiFi.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
	--SamSung--
(N'Samsung Galaxy Tab S9 Ultra 5G',N'Samsung Galaxy Tab S9 Ultra 5G',N'Dynamic AMOLED 2X',3,16,90000000,31990000,N'Samsung Galaxy Tab S9 Ultra 5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
(N'Samsung Galaxy Tab S9+ 5G',N'Samsung Galaxy Tab S9+ 5G',N'Dynamic AMOLED 2X',3,16,30000000,27990000,N'Samsung Galaxy Tab S9plus 5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
(N'Samsung Galaxy Tab A8 (2022)',N'Samsung Galaxy Tab A8 (2022)',N'TFT LCD',3,16,30000000,6490000,N'Samsung Galaxy Tab A8 (2022).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
(N'Samsung Galaxy Tab A7 Lite',N'Samsung Galaxy Tab A7 Lite',N'TFT LCD',3,16,30000000,3690000,N'Samsung Galaxy Tab A7 Lite.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
(N'Samsung Galaxy Tab S9+ WiFi',N'Samsung Galaxy Tab S9+ WiFi',N'Dynamic AMOLED 2X',3,16,30000000,24990000,N'Samsung Galaxy Tab S9plus WiFi.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
(N'Samsung Galaxy Tab S9 5G',N'Samsung Galaxy Tab S9 5G',N'Dynamic AMOLED 2X',3,16,30000000,21990000,N'Samsung Galaxy Tab S9 5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
(N'Samsung Galaxy Tab S7 FE 4G',N'Samsung Galaxy Tab S7 FE 4G',N'TFT LCD ',3,16,30000000,9690000,N'Samsung Galaxy Tab S7 FE 4G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
(N'Samsung Galaxy Tab S9 WiFi',N'Samsung Galaxy Tab S9 WiFi',N'Dynamic AMOLED 2X',3,16,30000000,18990000,N'Samsung Galaxy Tab S9 WiFi.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
	--Lenovo--
(N'Lenovo Tab M8 (Gen 4)',N'Lenovo Tab M8 (Gen 4)',N'IPS LCD',3,17,30000000,3640000,N'Lenovo Tab M8 (Gen 4).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
(N'Lenovo Tab M9',N'Lenovo Tab M9',N'IPS LCD ',3,17,30000000,4590000,N'Lenovo Tab M9.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Tablet',N' ',1),
--Laptop--
	--MacBook--
(N'MacBook Air 13 inch M1 2020 7-core GPU',N'MacBook Air 13 inch M1 2020 7-core GPU',N'• Màn hình: 15.6", Full HD, 165Hz',2,7,30000000,18990000,N'MacBook Air 13 inch M1 2020 7-core GPU.jpg',40,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'MacBook Air 13 inch M2 2022 8-core GPU',N'MacBook Air 13 inch M2 2022 8-core GPU',N'• Màn hình: 15.6", Full HD, 165Hz',2,7,30000000,26790000,N'MacBook Air 13 inch M2 2022 8-core GPU.jpg',40,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'MacBook Pro 13 inch M2 2022 10-core GPU',N'MacBook Pro 13 inch M2 2022 10-core GPU',N'• Màn hình: 15.6", Full HD, 165Hz',2,7,30000000,29890000,N'MacBook Pro 13 inch M2 2022 10-core GPU.jpg',40,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'MacBook Air 15 inch M2 2023 10-core GPU',N'MacBook Air 15 inch M2 2023 10-core GPU',N'• Màn hình: 15.6", Full HD, 165Hz',2,7,30000000,31890000,N'MacBook Air 15 inch M2 2023 10-core GPU.jpg',40,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'MacBook Air 13 inch M2 2022 10-core GPU',N'MacBook Air 13 inch M2 2022 10-core GPU',N'• Màn hình: 15.6", Full HD, 165Hz',2,7,30000000,38390000,N'MacBook Air 13 inch M2 2022 10-core GPU.jpg',40,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'MacBook Pro 13 inch M2 2022 10-core GPU',N'MacBook Pro 13 inch M2 2022 10-core GPU',N'• Màn hình: 15.6", Full HD, 165Hz',2,7,30000000,34790000,N'MacBook Pro 13 inch M2 2022 10-core GPU.jpg',40,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'MacBook Pro 16 inch M2 Pro 2022 19-core GPU',N'MacBook Pro 16 inch M2 Pro 2022 19-core GPU',N'• Màn hình: 15.6", Full HD, 165Hz',2,7,30000000,59390000,N'MacBook Pro 16 inch M2 Pro 2022 19-core GPU.jpg',40,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'MacBook Pro 16 inch M2 Pro 2023 19-core GPU',N'MacBook Pro 16 inch M2 Pro 2023 19-core GPU',N'• Màn hình: 15.6", Full HD, 165Hz',2,7,30000000,64990000,N'MacBook Pro 16 inch M2 Pro 2023 19-core GPU.jpg',40,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'MacBook Pro 13 inch M2 2022 10-core GPU',N'MacBook Pro 13 inch M2 2022 10-core GPU',N'• Màn hình: 15.6", Full HD, 165Hz',2,7,30000000,39990000,N'MacBook Pro 13 inch M2 2022 10-core GPU.jpg',40,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'MacBook Air 15 inch M2 2023 10-core GPU',N'MacBook Air 15 inch M2 2023 10-core GPU',N'• Màn hình: 15.6", Full HD, 165Hz',2,7,30000000,37990000,N'MacBook Air 15 inch M2 2023 10-core GPU.jpg',40,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
	--Acer--
(N'Acer Aspire 7 Gaming A715 76G 5132 i5 12450H (NH.QMESV.002)',N'Acer Aspire 7 Gaming A715 76G 5132 i5 12450H (NH.QMESV.002)',N'• Màn hình: 15.6", Full HD, 144Hz    • CPU: i5, 12450H, 2GHz     • Card: GTX 1650 4GB     • Pin: 4-cell Li-ion, 50 Wh      • Khối lượng: 2.1 kg',2,8,30000000,15990000,N'Acer Aspire 7 Gaming A715 76G 5132 i5 12450H (NH.QMESV.002).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'Acer Nitro 5 Tiger AN515 58 52SP i5 12500H (NH.QFHSV.001)',N'Acer Nitro 5 Tiger AN515 58 52SP i5 12500H (NH.QFHSV.001)',N'• Màn hình: 15.6", Full HD, 165Hz',2,8,30000000,22990000,N'Acer Nitro 5 Tiger AN515 58 52SP i5 12500H (NH.QFHSV.001).jpg',20,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'Acer Aspire 3 A315 510P 32EF 13  N305 (NX.KDHSV.001)',N'Acer Aspire 3 A315 510P 32EF 13  N305 (NX.KDHSV.001)',N'• Màn hình: 15.6", Full HD   • CPU: i3 chuỗi N, N305   • Card: Intel UHD   • Pin: 40 Wh   • Khối lượng: 1.7 kg',2,8,30000000,8990000,N'Acer Aspire 3 A315 510P 32EF 13  N305 (NX.KDHSV.001).jpg',10,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'Acer Nitro 5 Gaming AN515 57 5669 i5 11400H (NH.QEHSV.001',N'Acer Nitro 5 Gaming AN515 57 5669 i5 11400H (NH.QEHSV.001',N'• Màn hình: 15.6", Full HD, 144Hz     • CPU: i5, 11400H, 2.7GHz    • Card: RTX 2050 4GB      • Pin: 3-cell, 48Wh    • Khối lượng: 2.3 kg',2,8,30000000,17990000,N'Acer Nitro 5 Gaming AN515 57 5669 i5 11400H (NH.QEHSV.001.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
	--Asus--
(N'Asus TUF Gaming F15 FX506HF i5 11400H (HN014W)',N'Asus TUF Gaming F15 FX506HF i5 11400H (HN014W)',N'• Màn hình: 15.6", Full HD, 144Hz     • CPU: i5, 11400H, 2.7GHz    • Card: RTX 2050 4GB      • Pin: 3-cell, 48Wh    • Khối lượng: 2.3 kg',2,9,30000000,16990000,N'Asus TUF Gaming F15 FX506HF i5 11400H (HN014W).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'Asus Vivobook X515EA i3 1115G4 (EJ3948W)',N'Asus Vivobook X515EA i3 1115G4 (EJ3948W)',N'• Màn hình: 15.6", Full HD   • CPU: i3 chuỗi N, N305   • Card: Intel UHD   • Pin: 40 Wh   • Khối lượng: 1.7 kg',2,9,30000000,9990000,N'Asus Vivobook X515EA i3 1115G4 (EJ3948W).jpg',9,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'Asus TUF Gaming F15 FX506HC i5 11400H (HN949W)',N'Asus TUF Gaming F15 FX506HC i5 11400H (HN949W)',N' • Màn hình: 15.6", Full HD, 144Hz          • CPU: i5, 11400H, 2.7GHz       • Card: GTX 1650 Max-Q 4GB        • Pin: 3-cell, 51Wh     • Khối lượng: 1.86 kg',2,9,30000000,19990000,N'Asus TUF Gaming F15 FX506HC i5 11400H (HN949W).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
	--MSI--
(N'MSI Gaming GF63 Thin 11SC i5 11400H (664VN)',N'MSI Gaming GF63 Thin 11SC i5 11400H (664VN)',N' • Màn hình: 15.6", Full HD, 144Hz          • CPU: i5, 11400H, 2.7GHz       • Card: GTX 1650 Max-Q 4GB        • Pin: 3-cell, 51Wh     • Khối lượng: 1.86 kg',2,10,30000000,14990000,N'MSI Gaming GF63 Thin 11SC i5 11400H (664VN).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'MSI Modern 14 C11M i3 1115G4 (011VN)',N'MSI Modern 14 C11M i3 1115G4 (011VN)',N'• Màn hình: 14", Full HD    • CPU: i3, 1115G4, 3GHz  • Card: Intel UHD    • Pin: 3-cell, 41Wh    • Khối lượng: 1.47 kg',2,10,30000000,9490000,N'MSI Modern 14 C11M i3 1115G4 (011VN).jpg',10,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'MSI Gaming GF63 Thin 12VE i5 12450H (460VN)',N'MSI Gaming GF63 Thin 12VE i5 12450H (460VN)',N'• Màn hình: 15.6", Full HD, 165Hz',2,10,30000000,20990000,N'MSI Gaming GF63 Thin 12VE i5 12450H (460VN).jpg',20,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
	--HP--
(N'HP Pavilion 15 eg2082TU i5 1240P (7C0Q5PA)',N'HP Pavilion 15 eg2082TU i5 1240P (7C0Q5PA)',N'• Màn hình: 15.6", Full HD   • CPU: i3 chuỗi N, N305   • Card: Intel UHD   • Pin: 40 Wh   • Khối lượng: 1.7 kg',2,11,30000000,17490000,N'HP Pavilion 15 eg2082TU i5 1240P (7C0Q5PA).jpg',10,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'HP Gaming VICTUS 15 fa0155TX i5 12450H (81P0OPA)',N'HP Gaming VICTUS 15 fa0155TX i5 12450H (81P0OPA)',N'• Màn hình: 15.6", Full HD, 144Hz    • CPU: 15, 12450H, 2GHZ    • Card: RTX 3050 4GB     • Pin: 4-cell, 70Wh     • Khối lượng: 2.31 kg',2,11,30000000,20990000,N'HP Gaming VICTUS 15 fa0155TX i5 12450H (81P0OPA).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'HP 240 G8 13 1115G4 (6L1A1PA)',N'HP 240 G8 13 1115G4 (6L1A1PA)',N'• Màn hình: 14", Full HD    • CPU: i3, 1115G4, 3GHz  • Card: Intel UHD    • Pin: 3-cell, 41Wh    • Khối lượng: 1.47 kg',2,11,30000000,9390000,N'HP 240 G8 13 1115G4 (6L1A1PA).jpg',10,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
	--Lenovo--
(N'Lenovo Legion 5 151AH7 i5 12500H (82RC003WVN)',N'Lenovo Legion 5 151AH7 i5 12500H (82RC003WVN)',N'• Màn hình: 15.6", Full HD, 165Hz',2,12,30000000,29990000,N'Lenovo Legion 5 151AH7 i5 12500H (82RC003WVN).jpg',20,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
(N'Lenovo Ideapad 3 15ITL6 i3 1115G4 (82H803SGVN)',N'Lenovo Ideapad 3 15ITL6 i3 1115G4 (82H803SGVN)',N' • Màn hình: 15.6", Full HD    • CPU: i3, 1115G4, 3GHz   • Card: Intel UHD     • Pin: 45Wh    • Khối lượng: 1.65 kg',2,12,30000000,9990000,N'Lenovo Ideapad 3 15ITL6 i3 1115G4 (82H803SGVN).jpg',10,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
	--Gigabyte--
(N'Gigabyte Gaming G5 i5 12500H (GE-51VN263SH)',N'Gigabyte Gaming G5 i5 12500H (GE-51VN263SH)',N'• Màn hình: 15.6", Full HD, 165Hz',2,13,30000000,18990000,N'Gigabyte Gaming G5 i5 12500H (GE-51VN263SH).jpg',20,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
	--Dell--
(N'Dell Inspiron 15 3520 i5 1235U (N515122W1)',N'Dell Inspiron 15 3520 i5 1235U (N515122W1)',N'• Màn hình: 15.6", Full HD, 120Hz   • CPU: i5, 1235U, 1.3GHz    • Card: Intel UHD    • Pin: 3-cell, 41Wh   • Khối lượng: 1.9 kg',2,14,30000000,15490000,N'Dell Inspiron 15 3520 i5 1235U (N515122W1).jpg',10,12,'02/07/2022','admin1','02/07/2022',null,N'Laptop',N' ',1),
--SmartWatch--
	--Apple--
(N'Apple Watch Series 9 GPS + Cellular 45mm ',N'Apple Watch Series 9 GPS + Cellular 45mm ',N'• Man hinh OLED 19 inch • Theo dõi sức khỏe. Theo dõi mức độ stress. Tính quãng đường chạy. Điện tâm đồ',4,18,30000000,13890000,N'Apple Watch Series 9 GPS plus Cellular 45mm.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Apple Watch Series 9 GPS + Cellular 41mm ',N'Apple Watch Series 9 GPS + Cellular 41mm ',N'• Man hinh OLED 19 inch • Theo dõi sức khỏe. Theo dõi mức độ stress. Tính quãng đường chạy. Điện tâm đồ',4,18,30000000,13890001,N'Apple Watch Series 9 GPS plus Cellular 41mm.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Apple Watch Series 9 GPS  45mm ',N'Apple Watch Series 9 GPS  45mm ',N'• Man hinh OLED 19 inch • Theo dõi sức khỏe. Theo dõi mức độ stress. Tính quãng đường chạy. Điện tâm đồ',4,18,30000000,13890002,N'Apple Watch Series 9 GPS  45mm .jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Apple Watch Series 9 GPS  41mm ',N'Apple Watch Series 9 GPS  41mm ',N'• Man hinh OLED 19 inch • Theo dõi sức khỏe. Theo dõi mức độ stress. Tính quãng đường chạy. Điện tâm đồ',4,18,30000000,13890003,N'Apple Watch Series 9 GPS  41mm .jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Apple Watch SE 2023 GPS + Cellular 44mm ',N'Apple Watch SE 2023 GPS + Cellular 44mm ',N'• Man hinh OLED 19 inch • Theo dõi sức khỏe. Theo dõi mức độ stress. Tính quãng đường chạy. Điện tâm đồ',4,18,30000000,13890004,N'Apple Watch SE 2023 GPS plus Cellular 44mm.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Apple Watch Ultra 2 GPS _ Cellular 49mm',N'Apple Watch Ultra 2 GPS _ Cellular 49mm',N'• Man hinh OLED 19 inch • Theo dõi sức khỏe. Theo dõi mức độ stress. Tính quãng đường chạy. Điện tâm đồ       Thông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)',3,15,22690000,21990000,N'Apple Watch Ultra 2 GPS _ Cellular 49mm.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Apple Watch Ultra GPS _ Cellular 49mm ',N'Apple Watch Ultra GPS _ Cellular 49mm ',N'• Man hinh OLED 19 inch • Theo dõi sức khỏe. Theo dõi mức độ stress. Tính quãng đường chạy. Điện tâm đồ       Thông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)',3,15,22990000,21990000,N'Apple Watch Ultra GPS _ Cellular 49mm.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Apple Watch Series 8 GPS 41mm ',N'Apple Watch Series 8 GPS 41mm ',N'• Man hinh OLED 19 inch • Theo dõi sức khỏe. Theo dõi mức độ stress. Tính quãng đường chạy. Điện tâm đồ       Thông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)',3,15,11990000,9590000,N'Apple Watch Series 8 GPS 41mm.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Apple Watch Series 8 GPS 45mm ',N'Apple Watch Series 8 GPS 45mm ',N'• Man hinh OLED 19 inch • Theo dõi sức khỏe. Theo dõi mức độ stress. Tính quãng đường chạy. Điện tâm đồ       Thông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)',3,15,12990000,10990000,N'Apple Watch Series 8 GPS 45mm.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
	--SamSung--
(N'Samsung Galaxy Watch5 Pro 45mm',N'Samsung Galaxy Watch5 Pro 45mm',N'• Man hinh SUPER AMOLED, 1.4 inch • Theo dõi sức khỏe. Theo dõi mức độ stress. Tính quãng đường chạy. Điện tâm đồ       Thông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)',3,15,12690000,11990000,N'Samsung Galaxy Watch5 Pro 45mm.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Samsung Galaxy Watch6 Classic LTE 47mm',N'Samsung Galaxy Watch6 Classic LTE 47mm',N'• Man hinh SUPER AMOLED, 1.4 inch • Theo dõi sức khỏe. Theo dõi mức độ stress. Tính quãng đường chạy. Điện tâm đồ       Thông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)',3,15,11790000,9990000,N'Samsung Galaxy Watch6 Classic LTE 47mm.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Samsung Galaxy Watch6 Classic 47mm ',N'Samsung Galaxy Watch6 Classic 47mm ',N'• Man hinh SUPER AMOLED, 1.4 inch • Theo dõi sức khỏe. Theo dõi mức độ stress. Tính quãng đường chạy. Điện tâm đồ       Thông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)',3,15,10990000,9490000,N'Samsung Galaxy Watch6 Classic 47mm .jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Samsung Galaxy Watch6 LTE 44mm ',N'Samsung Galaxy Watch6 LTE 44mm ',N'• Man hinh SUPER AMOLED, 1.4 inch • Theo dõi sức khỏe. Theo dõi mức độ stress. Tính quãng đường chạy. Điện tâm đồ       Thông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)',3,15,9700000,7990000,N'Samsung Galaxy Watch6 LTE 44mm.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
	--Xiaomi--
(N'Xiaomi Mi Band 8 dây TPU',N'Xiaomi Mi Band 8 dây TPU',N'Màn hình: TFT, 1.47 inch      Theo dõi sức khỏe: Theo dõi mức độ stress, Tính quãng đường chạy, Đếm số bước chân       Thông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)',4,19,30000000,5999000,N'Xiaomi Mi Band 8 dây TPU.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Xiaomi Watch 2 Pro 46 mm dây silicone',N'Xiaomi Watch 2 Pro 46 mm dây silicone',N'Màn hình: TFT, 1.47 inch      Theo dõi sức khỏe: Theo dõi mức độ stress, Tính quãng đường chạy, Đếm số bước chân       Thông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)',4,19,30000000,5999001,N'Xiaomi Watch 2 Pro 46 mm dây silicone.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
	--BeFit--
(N'BeFit Watch Ultra S 52.1mm dây silicone',N'BeFit Watch Ultra S 52.1mm dây silicone',N'Màn hình: AMOLED, 1.95 inch     Theo dõi sức khỏe: Đo nồng độ oxy (SpO2), Đo nhịp tim, Đo huyết áp  Thông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)',4,20,30000000,840999,N'BeFit Watch Ultra S 52.1mm dây silicone.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'BeFit Watch Ultra 52.6mm dây silicone',N'BeFit Watch Ultra 52.6mm dây silicone',N'Màn hình: AMOLED, 1.95 inch     Theo dõi sức khỏe: Đo nồng độ oxy (SpO2), Đo nhịp tim, Đo huyết áp  Thông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)',4,20,30000000,840999,N'BeFit Watch Ultra 52.6mm dây silicone.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'BeFit WatchS 45mm dây silicone',N'BeFit WatchS 45mm dây silicone',N'Màn hình: AMOLED, 1.95 inch     Theo dõi sức khỏe: Đo nồng độ oxy (SpO2), Đo nhịp tim, Đo huyết áp  Thông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)',3,15,1490000,1090000,N'BeFit WatchS 45mm dây silicone.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'BeFit Sporty 2 44.5mm ',N'BeFit Sporty 2 44.5mm ',N'Màn hình: AMOLED, 1.95 inch     Theo dõi sức khỏe: Đo nồng độ oxy (SpO2), Đo nhịp tim, Đo huyết áp  Thông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)',3,15,1690000,690000,N'BeFit Sporty 2 44.5mm.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
	--imoo--
(N'imoo Z1 41mm dây TPU Hồng nhạt',N'imoo Z1 41mm dây TPU Hồng nhạt',N'Màn hình: TFT-LCD, 1.3 inch      Theo dõi sức khỏe: Đếm số bước chân',4,21,30000000,2720000,N'imoo Z1 41mm dây TPU Hồng nhạt.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'imoo Z1 41mm dây TPU Xanh dương',N'imoo Z1 41mm dây TPU Xanh dương',N'Màn hình: TFT-LCD, 1.3 inch      Theo dõi sức khỏe: Đếm số bước chân',4,21,30000000,2720001,N'imoo Z1 41mm dây TPU Xanh dương.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),

--PC--	
	--Asus--
(N'Asus S500SD i5 12400 (512400050W)',N'Asus S500SD i5 12400 (512400050W)',N'RAM 8GB   SSD 512GB',5,22,30000000,15590000,N'Asus S500SD i5 12400 (512400050W).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'PC',N' ',1),
(N'Asus ExpertCenter AIO A3202WBAK i3 1215U 21.45 inch (WA018W)',N'Asus ExpertCenter AIO A3202WBAK i3 1215U 21.45 inch (WA018W)',N'RAM 8GB   SSD 512GB',5,22,30000000,17590001,N'Asus ExpertCenter AIO A3202WBAK i3 1215U 21.45 inch (WA018W).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'PC',N' ',1),
(N'Asus ExpertCenter AIO A5402WVAK i5 1340P 23.8 inch (BA016W)',N'Asus ExpertCenter AIO A5402WVAK i5 1340P 23.8 inch (BA016W)',N'RAM 8GB   SSD 512GB',5,22,30000000,17590000,N'Asus ExpertCenter AIO A5402WVAK i5 1340P 23.8 inch (BA016W).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'PC',N' ',1),
(N'ASUS AIO A3402WBAK i3',N'ASUS AIO A3402WBAK i3',N'8 GB, 512 GB SSD, Intel UHD, Windows 11',3,15,18590000,14090000,N'ASUS AIO A3402WBAK i3.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Màn hình Asus VZ24EHE-R 23.8 inch',N'Màn hình Asus VZ24EHE-R 23.8 inch',N'8 GB, 512 GB SSD, Intel UHD, Windows 11',3,15,2750000,2390000,N'Màn hình Asus VZ24EHE-R 23.8 inch.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Màn hình Asus TUF Gaming VG249Q1A 23.8 inch FHD',N'Màn hình Asus TUF Gaming VG249Q1A 23.8 inch FHD',N'8 GB, 512 GB SSD, Intel UHD, Windows 11',3,15,4190000,3290000,N'Màn hình Asus TUF Gaming VG249Q1A 23.8 inch FHD.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Màn hình Asus Gaming ROG Strix XG249CM 23.8 inch',N'Màn hình Asus Gaming ROG Strix XG249CM 23.8 inch',N'8 GB, 512 GB SSD, Intel UHD, Windows 11',3,15,7990000,7490000,N'Màn hình Asus Gaming ROG Strix XG249CM 23.8 inch.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N' Asus VG249Q3A 23.8 inch FHD IPS',N' Asus VG249Q3A 23.8 inch FHD IPS',N'8 GB, 512 GB SSD, Intel UHD, Windows 11',3,15,3990000,3790000,N' Asus VG249Q3A 23.8 inch FHD IPS.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N' Asus ProArt PA278CV 27 inch 2K IPS',N' Asus ProArt PA278CV 27 inch 2K IPS',N'8 GB, 512 GB SSD, Intel UHD, Windows 11',3,15,10190000,9490000,N' Asus ProArt PA278CV 27 inch 2K IPS.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Màn hình Asus ProArt PA248QV 24.1 inch FHD',N'Màn hình Asus ProArt PA248QV 24.1 inch FHD',N'8 GB, 512 GB SSD, Intel UHD, Windows 11',3,15,5590000,5090000,N'Màn hình Asus ProArt PA248QV 24.1 inch FHD.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
	--HP--
(N'HP AIO ProOne 240 G9 i3 1215U 23.8 inch (6M3T0PA)',N'HP AIO ProOne 240 G9 i3 1215U 23.8 inch (6M3T0PA)',N'RAM 8GB   SSD 512GB',5,23,30000000,14790000,N'HP AIO ProOne 240 G9 i3 1215U 23.8 inch (6M3T0PA).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'PC',N' ',1),
(N'HP Slim Desktop S01 pF2025d i5 12400 (6K7A3PA)',N'HP Slim Desktop S01 pF2025d i5 12400 (6K7A3PA)',N'RAM 8GB   SSD 512GB',5,23,30000000,18190000,N'HP Slim Desktop S01 pF2025d i5 12400 (6K7A3PA).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'PC',N' ',1),
(N'HP AIO 22 dd2002d i5 1235U 21.5 inch (6K7G1PA)',N'HP AIO 22 dd2002d i5 1235U 21.5 inch (6K7G1PA)',N'RAM 8GB   SSD 512GB',5,23,30000000,21990000,N'HP AIO 22 dd2002d i5 1235U 21.5 inch (6K7G1PA).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'PC',N' ',1),
(N'HP AIO ProOne 240 G9 i5 1235U 23.8 inch (6M3V2PA)',N'HP AIO ProOne 240 G9 i5 1235U 23.8 inch (6M3V2PA)',N'RAM 8GB   SSD 512GB',5,23,30000000,11190000,N'HP AIO ProOne 240 G9 i5 1235U 23.8 inch (6M3V2PA).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'PC',N' ',1),
(N'HP ProOne 440 G9 AIO i5 12500T 23.8 inch (6M3X9PA)',N'HP ProOne 440 G9 AIO i5 12500T 23.8 inch (6M3X9PA)',N'RAM 8GB   SSD 512GB',5,23,30000000,11190001,N'HP ProOne 440 G9 AIO i5 12500T 23.8 inch (6M3X9PA).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'PC',N' ',1),
(N'HP ProOne 440 G9 AIO i5',N'HP ProOne 440 G9 AIO i5',N'8 GB, 512 GB SSD, Intel UHD, Windows 11',3,15,22990000,21490000,N'HP ProOne 440 G9 AIO i5.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'HP AIO 22 dd2002d i5',N'HP AIO 22 dd2002d i5',N'8 GB, 512 GB SSD, Intel UHD, Windows 11',3,15,20590000,19090000,N'HP AIO 22 dd2002d i5.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
	--Mac--
(N'iMac 24 inch 2023 4.5K/8-core GPU',N'iMac 24 inch 2023 4.5K/8-core GPU',N'RAM 8GB   SSD 512GB',5,24,30000000,41190000,N'iMac 24 inch 2023 4.5K-8-core GPU.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'PC',N' ',1),
--Phụ Kiện--
	--Ava+--
(N' AVA+ 15W JP399',N' AVA+ 15W JP399',N' Chip E-marker Smart   1m',6,25,30000000,100001,N'AVAplus 15W JP399.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phụ Kiện',N' ',1),
(N'Tai nghe Bluetooth True Wireless AVA+ FreeGo A20',N'Tai nghe Bluetooth True Wireless AVA+ FreeGo A20',N' Chip E-marker Smart   1m',6,25,30000000,100001,N'Tai nghe Bluetooth True Wireless AVAplus FreeGo A20.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phụ Kiện',N' ',1),
(N'Tai nghe Bluetooth True Wireless AVA+ Buds Life Air 2',N'Tai nghe Bluetooth True Wireless AVA+ Buds Life Air 2',N' Chip E-marker Smart   1m',6,25,30000000,100001,N'Tai nghe Bluetooth True Wireless AVAplus Buds Life Air 2.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phụ Kiện',N' ',1),

(N'Cáp Type C 2m AVA+ DS08C',N'Cáp Type C 2m AVA+ DS08C',N' Chip E-marker Smart   1m',3,15,150000,120000,N'Cáp Type C 2m AVA+ DS08C.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'AVA_ 15W DS2107',N'AVA_ 15W DS2107',N' Chip E-marker Smart   1m',3,15,500000,350000,N'AVA_ 15W DS2107.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),

	--Baseus--
(N'Baseus Comet 22.5W PPMD10 kèm Cáp Lightning và Type C',N'Baseus Comet 22.5W PPMD10 kèm Cáp Lightning và Type C',N' Chip E-marker Smart   1m',6,26,30000000,100001,N'Baseus Comet 22.5W PPMD10 kèm Cáp Lightning và Type C.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phụ Kiện',N' ',1),
(N'Cáp Lightning 1m Baseus CoolPlay CB000044',N'Cáp Lightning 1m Baseus CoolPlay CB000044',N' Chip E-marker Smart   1m',6,26,30000000,100001,N'Cáp Lightning 1m Baseus CoolPlay CB000044.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phụ Kiện',N' ',1),

(N'Baseus ioTa 220V_140W BPE14A',N'Baseus ioTa 220V_140W BPE14A',N' Chip E-marker Smart   1m',3,15,7990000,3995000,N'Baseus ioTa 220V_140W BPE14A.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Baseus 20W PPCXM06',N'Baseus 20W PPCXM06',N' Chip E-marker Smart   1m',3,15,1000000,800000,N'Baseus 20W PPCXM06.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Baseus 20W PPCXZ10',N'Baseus 20W PPCXZ10',N' Chip E-marker Smart   1m',3,15,1390000,1110000,N'Baseus 20W PPCXZ10.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
	--Xmobile--
(N'Xmobile 20W DS611',N'Xmobile 20W DS611',N' Chip E-marker Smart   1m',6,27,30000000,100001,N'Xmobile 20W DS611.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phụ Kiện',N' ',1),
(N'Xmobile 22.5W S2032 ',N'Xmobile 22.5W S2032 ',N' Chip E-marker Smart   1m',3,15,1000000,990000,N'Xmobile 22.5W S2032.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Cáp Lightning 1m Xmobile DR-L001X',N'Cáp Lightning 1m Xmobile DR-L001X',N' Chip E-marker Smart   1m',6,27,30000000,100001,N'Cáp Lightning 1m Xmobile DR-L001X.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phụ Kiện',N' ',1),
	-------	
(N'Anker 30W A1256',N'Anker 30W A1256',N' Chip E-marker Smart   1m',3,15,1180000,1120000,N'Anker 30W A1256.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Tai nghe Bluetooth AirPods Pro Gen 2 MagSafe Charge (USB-C) Apple MTJV3',N'Tai nghe Bluetooth AirPods Pro Gen 2 MagSafe Charge (USB-C) Apple MTJV3',N' Chip E-marker Smart   1m',3,15,6200000,5990000,N'Tai nghe Bluetooth AirPods Pro Gen 2 MagSafe Charge (USB-C) Apple MTJV3.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Tai nghe Bluetooth Chụp Tai Zadez GP-803B',N'Tai nghe Bluetooth Chụp Tai Zadez GP-803B',N' Chip E-marker Smart   1m',3,15,850000,590000,N'Tai nghe Bluetooth Chụp Tai Zadez GP-803B.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Tai nghe Bluetooth Chụp Tai JBL Tune 520BT',N'Tai nghe Bluetooth Chụp Tai JBL Tune 520BT',N' Chip E-marker Smart   1m',3,15,2890000,1390000,N'Tai nghe Bluetooth Chụp Tai JBL Tune 520BT.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1)
	
	select* from Product
--delete from Product




INSERT INTO DETAILPRO
VALUES
--Phone--
	--Oppo--
(1,N'AMOLED Chính 6.8" & Phụ 3.26"Full HD+', N'Android 13', N'MediaTek Dimensity 9000+ 8 nhân', N'8 GB', N'256 GB', N'Hỗ trợ 5G', N'2 Nano SIM', N'Chính 50 MP & Phụ 8 MP', N'32 MP', N'4300 mAh, 44W',N'OPPO', N'Phone'),
(2,N'AMOLED 6.7"Full HD+', N'Android 13', N'Snapdragon 695 5G', N'8 GB', N'128 GB', N'Hỗ trợ 5G', N'2 Nano SIM (SIM 2 chung khe thẻ nhớ)', N'Chính 108 MP & Phụ 2 MP', N'32 MP', N'4800 mAh, 67 W', N'OPPO', N'Phone'),
(3,N'AMOLED 6.7"Quad HD+ (2K+)', N'Android 12', N'Snapdragon 8 Gen 1', N'12 GB', N'256 GB', N'Hỗ trợ 5G', N'2 Nano SIM hoặc 1 Nano SIM + 1 eSIM', N'Chính 50 MP & Phụ 50 MP', N'32 MP', N'5000 mAh, 80 W', N'OPPO', N'Phone'),
(4,N'AMOLED 6.7"Full HD+', N'Android 13', N'Snapdragon 695 5G', N'8 GB', N'128 GB', N'Hỗ trợ 5G', N'2 Nano SIM (SIM 2 chung khe thẻ nhớ)', N'Chính 108 MP & Phụ 2 MP', N'32 MP', N'4800 mAh, 67 W', N'OPPO', N'Phone'),
(5,N'AMOLED 6.7"Full HD+', N'Android 13', N'MediaTek Dimensity 7050 5G 8 nhân', N'8 GB', N'128 GB', N'Hỗ trợ 5G', N'2 Nano SIM (SIM 2 chung khe thẻ nhớ)', N'Chính 64 MP & Phụ 32 MP, 8 MP', N'32 MP', N'5000 mAh, 80 W', N'OPPO', N'Phone'),
	--SamSung--
(6,N'Super AMOLED 6.5" Full HD+', N'Android 13', N'MediaTek Helio G99', N'8 GB', N'128 GB', N'Hỗ trợ 4G', N'2 Nano SIM ', N'Chính 50 MP & Phụ 5 MP, 2 MP', N'13 MP', N'5000 mAh, 25 W', N'Samsung', N'Phone'),
(7,N'Dynamic AMOLED 2X6.4" Full HD+', N'Android 12', N'Exynos 2100', N'8 GB', N'128 GB', N'Hỗ trợ 5G', N'2 Nano SIM ', N'Chính 12 MP & Phụ 12 MP, 8 MP', N'32 MP', N'4500 mAh, 25 W', N'Samsung', N'Phone'),
(8,N'Dynamic AMOLED 2X6.8" Quad HD+ (2K+)', N'Android 13', N'Snapdragon 8 Gen 2 for Galaxy', N'12 GB', N'512 GB', N'Hỗ trợ 5G', N'2 Nano SIM hoặc 1 Nano SIM + 1 eSIM', N'Chính 200 MP & Phụ 12 MP, 10 MP, 10 MP', N'12 MP', N'5000 mAh, 45 W', N'Samsung', N'Phone'),
(9,N'Super AMOLED6.6" Full HD+', N'Android 13', N'MediaTek Dimensity 1080 8 nhân', N'8 GB', N'128G', N'Hỗ trợ 5G', N'2 Nano SIM', N'Chính 48 MP & Phụ 8 MP, 5 MP', N'13 MP', N'5000 mAh, 25 W', N'Samsung',N'Phone'),
(10,N'Chính: Dynamic AMOLED 2X, Phụ: Super AMOLEDChính 6.7" & Phụ 3.4"Full HD+', N'Android 13', N'Snapdragon 8 Gen 2 for Galaxy', N'8 GB', N'512 GB', N'Hỗ trợ 5G', N'1 Nano SIM & 1 eSIM', N'2 camera 12 MP', N'5 MP', N'3700 mAh, 25 W', N'Samsung',N'Phone'),
(11,N'IPS LCD6.5"HD+', N'Android 12', N'Exynos 850', N'4 GB', N'64 GB', N'Hỗ trợ 4G', N'2 Nano SIM', N'Chính 50 MP & Phụ 2 MP, 2 MP', N'11 MP', N'5000 mAh, 15 W', N'Samsung',N'Phone'),
	--iphone--	
(12,N'Dynamic AMOLED 2XChính 7.6" & Phụ 6.2"Quad HD+ (2K+)', N'Android 13', N'Snapdragon 8 Gen 2 for Galaxy', N'12 GB', N'256 GB', N'Hỗ trợ 5G', N'2 Nano SIM hoặc 1 Nano SIM + 1 eSIM', N'Chính 50 MP & Phụ 12 MP, 10 MP', N'10 MP & 4 MP', N'4400 mAh, 25 W', N'Samsung',N'Phone'),
(13,N'OLED 6.1" Super Retina XDR', N'iOS 16', N'Apple A15 Bionic', N'6 GB', N'128 GB', N'Hỗ trợ 5G', N'1 Nano SIM & 1 eSIM', N'2 camera 12 MP', N'12 MP', N'3279 mAh, 20 W', N'iPhone (Apple)',N'Phone'),
(14,N'IPS LCD 6.1" Liquid Retina', N'iOS 15', N'Apple A13 Bionic', N'4 GB', N'128 GB', N'Hỗ trợ 4G', N'1 Nano SIM & 1 eSIM', N'2 camera 12 MP', N'12 MP', N'3110 mAh, 18 W', N'iPhone (Apple)',N'Phone'),
(15,N'OLED 6.7" Super Retina XDR', N'iOS 16', N'Apple A16 Bionic', N'6 GB', N'128 GB', N'Hỗ trợ 5G', N'1 Nano SIM & 1 eSIM', N'Chính 48 MP & Phụ 12 MP, 12 MP', N'12 MP', N'4323 mAh, 20 W', N'iPhone (Apple)',N'Phone'),
	--Xiaomi--
(16,N'IPS LCD 6.79" Full HD+', N'Android 13', N'MediaTek Helio G88', N'8 GB', N'128 GB', N'Hỗ trợ 4G', N'2 Nano SIM (SIM 2 chung khe thẻ nhớ)', N'Chính 50 MP & Phụ 8 MP, 2 MP', N'8 MP', N'5000 mAh, 18 W', N'Xiaomi',N'Phone'),
(17,N'IPS LCD 6.71" Full HD+', N'Android 12', N'MediaTek Helio G85', N'4 GB', N'128 GB', N'Hỗ trợ 4G', N'2 Nano SIM', N'Chính 50 MP & Phụ QVGA', N'5 MP', N'5000 mAh, 10 W', N'Xiaomi',N'Phone'),
(18,N'IPS LCD 6.52" Full HD+', N'Android 12 (Go Edition)', N'MediaTek MT6761 (Helio A22)', N'2 GB', N'32 GB', N'Hỗ trợ 4G', N'2 Nano SIM', N'Chính 8 MP & Phụ QVGA', N'5 MP', N'5000 mAh, 10 W', N'Xiaomi',N'Phone'),
(19,N'AMOLED 6.67" Full HD+', N'Android 13', N'Snapdragon 685 8 nhân', N'8 GB', N'128 GB', N'Hỗ trợ 4G', N'2 Nano SIM', N'Chính 50 MP & Phụ 8 MP, 2 MP', N'13 MP', N'5000 mAh, 33 W', N'Xiaomi',N'Phone'),
	--vivo--
(20,N'IPS LCD 6.64" Full HD+', N'Android 13', N'Snapdragon 680', N'8 GB', N'128 GB', N'Hỗ trợ 4G', N'2 Nano SIM', N'Chính 50 MP & Phụ 2 MP', N'16 MP', N'5000 mAh, 44 W', N'vivo',N'Phone'),
(21,N'IPS LCD 6.51" HD+', N'Android 13 (Go Edition)', N'MediaTek Helio P35', N'4 GB', N'64 GB', N'Hỗ trợ 4G', N'2 Nano SIM', N'8 MB', N'5 MB', N'5000 mAh, 10 W', N'vivo',N'Phone'),
(22,N'IPS LCD 6.51" HD+', N'Android 12', N'MediaTek Helio P35', N'4 GB', N'128 GB', N'Hỗ trợ 4G', N'2 Nano SIM', N'Chính 13 MP & Phụ 2 MP', N'5 MB', N'5000 mAh, 10 W', N'vivo',N'Phone'),
(23,N'IPS LCD 6.51" HD+', N'Android 12', N'MediaTek Helio P35', N'3 GB', N'64 GB', N'Hỗ trợ 4G', N'2 Nano SIM', N'8 MB', N'5 MB', N'5000 mAh, 10 W', N'vivo',N'Phone'),
(24,N'IPS LCD 6.51" HD+', N'Android 12 (Go Edition)', N'MediaTek Helio P35', N'3 GB', N'32 GB', N'Hỗ trợ 4G', N'2 Nano SIM', N'8 MB', N'5 MB', N'5000 mAh, 10 W', N'vivo',N'Phone'),
	--realme--
(25,N'IPS LCD 6.72" Full HD+', N'Android 13', N'MediaTek Helio G88', N'8 GB', N'256 GB', N'Hỗ trợ 4G', N'2 Nano SIM', N'Chính 64 MP & Phụ 2 MP', N'8 MP', N'5000 mAh, 33 W', N'realme',N'Phone'),
(26,N'IPS LCD 6.72" Full HD+', N'Android 13', N'MediaTek Helio G88', N'8 GB', N'256 GB', N'Hỗ trợ 4G', N'2 Nano SIM', N'Chính 64 MP & Phụ 2 MP', N'8 MP', N'5000 mAh, 33 W', N'realme',N'Phone'),
(27,N'Super AMOLED6.4"Full HD+', N'Android 12', N'MediaTek Helio G99', N'8 GB', N'256 GB', N'Hỗ trợ 4G', N'2 Nano SIM', N'Chính 50 MP & Phụ 2 MP', N'16 MP', N'5000 mAh, 33 W', N'realme',N'Phone'),
--Tablet--
	--ipad--
(28,N'10.2" Retina IPS LCD', N'iPadOS 15', N'Apple A13 Bionic', N'3 GB', N'256 GB', N'Nghe gọi qua FaceTime', N'                  ', N'8 MP', N'12 MP', N'32.4 Wh (~ 8600 mAh), 20 W', N'iPad (Apple).',N'Phone'),
(29,N'10.9" Retina IPS LCD', N'iPadOS 15', N'Apple M1', N'8 GB', N'64 GB', N'Nghe gọi qua FaceTime', N'                  ', N'12 MP', N'12 MP', N'28.6 Wh (~ 7587 mAh), 20 W', N'iPad (Apple).',N'Phone'),
(30,N'10.9" Retina IPS LCD', N'iPadOS 16', N'Apple A14 Bionic', N'4 GB', N'64 GB', N'Nghe gọi qua FaceTime', N'                  ', N'12 MP', N'12 MP', N'28.6 Wh (~ 7587 mAh), 20 W', N'iPad (Apple).',N'Phone'),
(31,N'12.9" Liquid Retina XDR', N'iPadOS 15', N'Apple M1', N'16 GB', N'2 TB', N'5G, Nghe gọi qua FaceTime', N'1 Nano SIM hoặc 1 eSIM', N'Chính 12 MP & Phụ 10 MP, TOF 3D LiDAR', N'12 MP', N'40.88 Wh (~ 10.835 mAh), 20 W', N'iPad (Apple).',N'Phone'),
(32,N'8.3" LED-backlit IPS LCD', N'iPadOS 15', N'Apple A15 Bionic', N'4 GB', N'256 GB', N'5G, Nghe gọi qua FaceTime', N'1 Nano SIM hoặc 1 eSIM', N'12 MP', N'12 MP', N'19.3 Wh (~ 5175 mAh), 20 W', N'iPad (Apple).',N'Phone'),
(33,N'12.9" Liquid Retina XDR', N'iPadOS 15', N'Apple M1', N'16 GB', N'2 TB', N'5G, Nghe gọi qua FaceTime', N'1 Nano SIM hoặc 1 eSIM', N'Chính 12 MP & Phụ 10 MP, TOF 3D LiDAR', N'12 MP', N'40.88 Wh (~ 10.835 mAh), 20 W', N'iPad (Apple).',N'Phone'),
(34,N'11" Liquid Retina', N'iPadOS 16', N'Apple M2 8 nhân', N'8 GB', N'128 GB', N'Nghe gọi qua FaceTime', N'                  ', N'Chính 12 MP & Phụ 10 MP, TOF 3D LiDAR', N'12 MP', N'28.6 Wh (~ 7587 mAh), 20 W', N'iPad (Apple).',N'Phone'),
(35,N'10.9" Retina IPS LCD', N'iPadOS 15', N'Apple M1', N'8 GB', N'256 GB', N'5G, Nghe gọi qua FaceTime', N'1 Nano SIM hoặc 1 eSIM', N'12 MP', N'12 MP', N'28.6 Wh (~ 7587 mAh), 20 W', N'iPad (Apple).',N'Phone'),
(36,N'8.3" LED-backlit IPS LCD', N'iPadOS 15', N'Apple A15 Bionic', N'4 GB', N'64 GB', N'5G, Nghe gọi qua FaceTime', N'1 Nano SIM hoặc 1 eSIM', N'12 MP', N'12 MP', N'19.3 Wh (~ 5175 mAh), 20 W', N'iPad (Apple).',N'Phone'),
(37,N'12.9"Liquid Retina XDR', N'iPadOS 15', N'Apple M1', N'8 GB', N'128 GB', N'5G, Nghe gọi qua FaceTime', N'1 Nano SIM hoặc 1 eSIM', N'Chính 12 MP & Phụ 10 MP, TOF 3D LiDAR', N'12 MP', N'40.88 Wh (~ 10.835 mAh), 20 W', N'iPad (Apple).',N'Phone'),
	--samsung--
(38,N'14.6" Dynamic AMOLED 2X', N'Android 13', N'Snapdragon 8 Gen 2 for Galaxy', N'16 GB', N'1 TB', N'5G, Có nghe gọi', N'1 Nano SIM & 1 eSIM', N'Chính 13 MP & Phụ 8 MP', N'2 Camera 12 MP', N'11200 mAh45 W', N'Samsung',N'Phone'),
(39,N'12.4" Dynamic AMOLED 2X', N'Android 13', N'Snapdragon 8 Gen 2 for Galaxy', N'12 GB', N'512 GB', N'5G, Có nghe gọi', N'1 Nano SIM & 1 eSIM', N'Chính 13 MP & Phụ 8 MP', N'12 MP', N'10090 mAh, 45 W', N'Samsung',N'Phone'),
(40,N'10.5" TFT LCD', N'Android 11', N'UniSOC T618', N'4 GB', N'64 GB', N'Hỗ trợ 4G, Có nghe gọi', N'1 Nano SIM', N'8 MP', N'5 MP', N'7040 mAh, 15 W', N'Samsung',N'Phone'),
(41,N'8.7" TFT LCD', N'Android 11', N'MediaTek MT8768T', N'3 GB', N'32 GB', N'Hỗ trợ 4G, Có nghe gọi', N'1 Nano SIM', N'8 MP', N'5 MP', N'5100 mAh, 15 W', N'Samsung',N'Phone'),
(42,N'12.4" Dynamic AMOLED 2X', N'Android 13', N'Snapdragon 8 Gen 2 for Galaxy', N'12 GB', N'512 GB', N'               ', N'                 ', N'Chính 13 MP & Phụ 8 MP', N'12 MP', N'10090 mAh, 45 W', N'Samsung',N'Phone'),
(43,N'11" Dynamic AMOLED 2X', N'Android 13', N'Snapdragon 8 Gen 2 for Galaxy', N'12 GB', N'256 GB', N'5G, Có nghe gọi', N'1 Nano SIM & 1 eSIM', N'13 MP', N'12 MP', N'8400 mAh, 45 W', N'Samsung',N'Phone'),
(44,N'12.4"TFT LCD', N'Android 11', N'Snapdragon 750G', N'4 GB', N'64 GB', N'Hỗ trợ 4G, Có nghe gọi', N'1 Nano SIM', N'8 MP', N'5 MP', N'10090 mAh, 45 W', N'Samsung',N'Phone'),
(45,N'11" Dynamic AMOLED 2X', N'Android 13', N'Snapdragon 8 Gen 2 for Galaxy', N'12 GB', N'256 GB', N'               ', N'                 ', N'13 MP', N'12 MP', N'8400 mAh, 45 W', N'Samsung',N'Phone'),
	--lenovo--
(46,N'8" IPS LCD', N'Android 12 (Go Edition)', N'MediaTek Helio A22', N'3 GB', N'32 GB', N'Hỗ trợ 4G, Có nghe gọi', N'1 Nano SIM', N'5 MP', N'2 MP', N'5100 mAh, 15 W', N'Lenovo',N'Phone'),
(47,N'9" IPS LCD', N'Android 12', N'MediaTek Helio G80', N'4 GB', N'64 GB', N'Hỗ trợ 4G, Có nghe gọi', N'1 Nano SIM', N'8 MP', N'2 MP', N'5100 mAh, 10W', N'Lenovo',N'Phone')
	select* from DETAILPRO
--delete from DETAILPRO




INSERT INTO DETAILLAP(ProductID, CPU ,	RAM ,	OCung ,	ManHinh,	CardMH ,CongKetNoi,DacBiet,	HeDieuHanh , ThietKe,	KichThuoc_Kl ,ThoiDiemRaMat,Hang,Loai )
VALUES
(48,N'Apple M1',N'16 GB',N'512 GB SSD',N'13.3" Retina (2560 x 1600)',N'Card tích hợp, 7 nhân GPU',N'2 x Thunderbolt 3 (USB-C), Jack tai nghe 3.5 mm',N'Có đèn bàn phím',N'macOS',N'Vỏ kim loại nguyên khối',N'Dài 304.1 mm - Rộng 212.4 mm - Dày 4.1 đến 16.1 mm - Nặng 1.29 kg',N'2020',N'MacBook',N'Laptop'),
(49,N'Apple M2, 100GB/s', N'8 GB', N'256 GB SSD', N'13.6" Liquid Retina (2560 x 1664)', N'Card tích hợp, 8 nhân GPU', N'2 x Thunderbolt 3 (USB-C), Jack tai nghe 3.5 mm', N'Có đèn bàn phím', N'macOS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 212.4 mm - Dày 4.1 đến 16.1 mm - Nặng 1.29 kg', N'2020',N'MacBook',N'Laptop'),
(50,N'Apple M2, 100GB/s', N'8 GB', N'256 GB SSD', N'13.3" Retina (2560 x 1600)', N'Card tích hợp, 10 nhân GPU', N'2 x Thunderbolt 3 (USB-C), Jack tai nghe 3.5 mm', N'Có đèn bàn phím', N'macOS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 212.4 mm - Dày 4.1 đến 16.1 mm - Nặng 1.29 kg', N'2020',N'MacBook',N'Laptop'),
(51,N'Apple M2, 100GB/s', N'8 GB', N'256 GB SSD', N'15.3" Liquid Retina (2560 x 1664)', N'Card tích hợp, 10 nhân GPU', N'2 x Thunderbolt 3 / USB 4 (lên đến 40 Gb/s), Jack tai nghe 3.5 mmMagSafe 3', N'Có đèn bàn phím', N'macOS', N'Vỏ kim loại nguyên khối', N'Dài 340.4 mm - Rộng 237.6 mm - Dày 11.5 mm - Nặng 1.51 kg', N'2020',N'MacBook',N'Laptop'),
(52,N'Apple M2, 100GB/s', N'16 GB', N'512 GB SSD', N'13.6" Liquid Retina (2560 x 1664)', N'Card tích hợp, 10 nhân GPU', N'2 x Thunderbolt 3, Jack tai nghe 3.5 mm, MagSafe 3', N'Có đèn bàn phím', N'macOS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 215 mm - Dày 11.3 mm - Nặng 1.24 kg', N'2020',N'MacBook',N'Laptop'),
(53,N'Apple M2, 100GB/s', N'8 GB', N'256 GB SSD', N'13.3" Retina (2560 x 1600)', N'Card tích hợp, 10 nhân GPU', N'2 x Thunderbolt 3 (USB-C), Jack tai nghe 3.5 mm', N'Có đèn bàn phím', N'macOS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 212.4 mm - Dày 15.6 mm - Nặng 1.4 kg', N'2022',N'MacBook',N'Laptop'),
(54,N'Apple M2 Pro, 200GB/s', N'16 GB', N'512 GB SSD', N'16.2" Liquid Retina XDR display (3456 x 2234), 120Hz', N'Card tích hợp, 19 nhân GPU', N'2 x Thunderbolt 3, Jack tai nghe 3.5 mm, MagSafe 3', N'Có đèn bàn phím', N'macOS', N'Vỏ kim loại nguyên khối', N'Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.15 kg', N'2022',N'MacBook',N'Laptop'),
(55,N'Apple M2 Pro, 200GB/s', N'16 GB', N'512 GB SSD', N'16.2" Liquid Retina XDR display (3456 x 2234), 120Hz', N'Card tích hợp, 19 nhân GPU', N'2 x Thunderbolt 3, Jack tai nghe 3.5 mm, MagSafe 3', N'Có đèn bàn phím', N'macOS', N'Vỏ kim loại nguyên khối', N'Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.15 kg', N'2023',N'MacBook',N'Laptop'),
(56,N'Apple M2, 100GB/s', N'8 GB', N'256 GB SSD', N'13.3" Retina (2560 x 1600)', N'Card tích hợp, 10 nhân GPU', N'2 x Thunderbolt 3 (USB-C), Jack tai nghe 3.5 mm', N'Có đèn bàn phím', N'macOS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 212.4 mm - Dày 15.6 mm - Nặng 1.4 kg', N'2022',N'MacBook',N'Laptop'),
(57,N'Apple M2, 100GB/s', N'8 GB', N'256 GB SSD', N'15.3" Liquid Retina (2560 x 1664)', N'Card tích hợp, 10 nhân GPU', N'2 x Thunderbolt 3 / USB 4 (lên đến 40 Gb/s), Jack tai nghe 3.5 mmMagSafe 3', N'Có đèn bàn phím', N'macOS', N'Vỏ kim loại nguyên khối', N'Dài 340.4 mm - Rộng 237.6 mm - Dày 11.5 mm - Nặng 1.51 kg', N'2023',N'MacBook',N'Laptop'),

(58,N'i5, 12450H, 2GHz', N'8 GB, DDR4 2 khe (1 khe 8 GB + 1 khe rời), 3200 MHz', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB), Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2 TB)', N'15.6" Full HD (1920 x 1080) 144Hz', N'Card rời, GTX 1650 4GB', N'1 x USB Type-C (hỗ trợ USB, DisplayPort, Thunderbolt 4), HDMILAN (RJ45), 3 x USB 3.2, Jack tai nghe 3.5 mm', N'Có đèn bàn phím', N'Windows 11 Home SL', N'Vỏ nhựa - nắp lưng bằng kim loại', N'Dài 362.3 mm - Rộng 237.4 mm - Dày 19.9 mm - Nặng 2.1 kg', N'2023',N'Acer',N'Laptop'),
(59,N'i5, 12450H, 2GHz', N'8 GB, DDR4 2 khe (1 khe 8 GB + 1 khe rời), 3200 MHz', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1 TB),512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB),Hỗ trợ thêm 1 khe cắm HDD SATA (nâng cấp tối đa 1 TB)', N'15.6" Full HD (1920 x 1080) 144Hz', N'Card rời, RTX 3050 4GB', N'HDMI, LAN (RJ45), 3 x USB 3.2, Thunderbolt 4 USB-C, Jack tai nghe 3.5 mm', N'Có đèn bàn phím', N'Windows 11 Home SL', N'Vỏ nhựa - nắp lưng bằng kim loại', N'Dài 360.4 mm - Rộng 271.09 mm - Dày 25.9 mm - Nặng 2.5 kg', N'2022',N'Acer',N'Laptop'),
(60,N'i3 chuỗi N, N305', N'8 GB, LPDDR5 (Onboard), 4800 MHz', N'256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'15.6" Full HD (1920 x 1080) 144Hz', N'Card tích hợp, Intel UHD', N'1 x USB Type-C (hỗ trợ USB, DisplayPort, Thunderbolt 4), HDMILAN (RJ45), 3 x USB 3.2, Jack tai nghe 3.5 mm', N'       ', N'Windows 11 Home SL', N'Vỏ nhựa - nắp lưng bằng kim loại', N'Dài 362.9 mm - Rộng 237.5 mm - Dày 18.9 mm - Nặng 1.7 kg', N'2023',N'Acer',N'Laptop'),
(61,N'i5, 11400H, 2.7GHz', N'8 GB, DDR4 2 khe (1 khe 8 GB + 1 khe rời), 3200 MHz', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1 TB),512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB),Hỗ trợ thêm 1 khe cắm HDD SATA (nâng cấp tối đa 1 TB)', N'15.6" Full HD (1920 x 1080) 144Hz', N'Card rời, GTX 1650 4GB', N'HDMI, LAN (RJ45), 3 x USB 3.2, Thunderbolt 4 USB-C, Jack tai nghe 3.5 mm', N'Có đèn bàn phím', N'Windows 11 Home SL', N'Vỏ nhựa - nắp lưng bằng kim loại', N'Dài 363.4 mm - Rộng 255 mm - Dày 23.9 mm - Nặng 2.2 kg', N'2021',N'Acer',N'Laptop'),

(62,N'i5, 11400H, 2.7GHz', N'8 GB, DDR4 2 khe (1 khe 8 GB + 1 khe rời), 3200 MHz', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1 TB),512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB),Hỗ trợ thêm 1 khe cắm HDD SATA (nâng cấp tối đa 1 TB)', N'15.6" Full HD (1920 x 1080) 144Hz', N'Card rời, RTX 2050 4GB', N'1 x Thunderbolt 4 (hỗ trợ DisplayPort), HDMILAN (RJ45), 3 x USB 3.2, Jack tai nghe 3.5 mm', N'Có đèn bàn phím', N'Windows 11 Home SL', N'Vỏ nhựa - nắp lưng bằng kim loại', N'Dài 359 mm - Rộng 256 mm - Dày 22.8 ~ 24.5 mm - Nặng 2.3 kg', N'2023',N'Asus',N'Laptop'),
(63,N'i3, 1115G4, 3GHz', N'8 GB, DDR4 2 khe (1 khe 8 GB + 1 khe rời), 3200 MHz', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB), Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2 TB)', N'15.6" Full HD (1920 x 1080) 144Hz', N'Card tích hợp, Intel UHD', N'HDMI, 2 x USB 2.0, USB Type-C1 x USB 3.2, Jack tai nghe 3.5 mm', N'                        ', N'Windows 11 Home SL', N'Vỏ nhựa - nắp lưng bằng kim loại', N'Dài 360 mm - Rộng 235 mm - Dày 19.9 mm - Nặng 1.8 kg', N'2022',N'Asus',N'Laptop'),
(64,N'i5, 11400H, 2.7GHz', N'16 GB, DDR4 2 khe (1 khe 8 GB + 1 khe 8 GB), 3200 MHz', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1 TB),512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB),Hỗ trợ thêm 1 khe cắm HDD SATA (nâng cấp tối đa 1 TB)', N'15.6" Full HD (1920 x 1080) 144Hz', N'Card rời, RTX 3050 4GB', N'1 x Thunderbolt 4 (hỗ trợ DisplayPort), HDMILAN (RJ45), 3 x USB 3.2, Jack tai nghe 3.5 mm', N'Có đèn bàn phím', N'Windows 11 Home SL', N'Vỏ nhựa - nắp lưng bằng kim loại', N'Dài 359 mm - Rộng 256 mm - Dày 22.8 ~ 24.5 mm - Nặng 2.3 kg', N'2022',N'Asus',N'Laptop'),

(65,N'i5, 11400H, 2.7GHz', N'8 GB, DDR4 2 khe (1 khe 8 GB + 1 khe rời), 3200 MHz', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB), Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2 TB)', N'15.6" Full HD (1920 x 1080) 144Hz', N'Card rời, GTX 1650 Max-Q 4GB', N'HDMI, LAN (RJ45), 3 x USB 3.2, Thunderbolt 4 USB-C, Jack tai nghe 3.5 mm', N'Có đèn bàn phím', N'Windows 11 Home SL', N'Vỏ kim loại ', N'Dài 359 mm - Rộng 254 mm - Dày 21.7 mm - Nặng 1.86 kg', N'2022',N'MSI',N'Laptop'),
(66,N'i3, 1115G4, 3GHz', N'8 GB, DDR4 (Onboard), 3200 MHz', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB), Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2 TB)', N'14" Full HD (1920 x 1080)', N'Card tích hợp, Intel UHD', N'1 x USB Type-C (hỗ trợ USB, DisplayPort, Thunderbolt 4), HDMILAN (RJ45), 3 x USB 3.2, Jack tai nghe 3.5 mm', N'Có đèn bàn phím', N'Windows 11 Home SL', N'Vỏ nhựa - nắp lưng bằng kim loại', N'Dài 319.9 mm - Rộng 223 mm - Dày 19.35 mm - Nặng 1.4 kg', N'2022',N'MSI',N'Laptop'),
(67,N'i5, 11400H, 2.7GHz', N'8 GB, DDR4 (Onboard), 3200 MHz', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB), Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2 TB)', N'15.6" Full HD (1920 x 1080) 144Hz', N'Card rờiRTX 4050 6GB', N'1 x USB Type-C (hỗ trợ USB, DisplayPort, Thunderbolt 4), HDMILAN (RJ45), 3 x USB 3.2, Jack tai nghe 3.5 mm', N'Có đèn bàn phím', N'Windows 11 Home SL', N'Nắp lưng và chiếu nghỉ tay bằng kim loại', N'Dài 359 mm - Rộng 254 mm - Dày 21.7 mm - Nặng 1.86 kg', N'2023',N'MSI',N'Laptop'),

(68,N'i5, 1240P, 1.7GHz', N'8 GB, DDR4 (Onboard), 3200 MHz', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB), Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2 TB)', N'15.6" Full HD (1920 x 1080) 144Hz', N'Card tích hợpIntel Iris Xe', N'HDMI, 2 x USB 2.0, USB Type-C1 x USB 3.2, Jack tai nghe 3.5 mm', N'        ', N'Windows 11 Home SL', N'Vỏ nhựa - chiếu nghỉ tay bằng kim loại', N'Dài 360.2 mm - Rộng 234 mm - Dày 17.9 mm - Nặng 1.72 kg', N'2022',N'HP',N'Laptop'),
(69,N'i5, 12450H, 2GHz', N'16 GB, DDR4 2 khe (1 khe 8 GB + 1 khe 8 GB), 3200 MHz', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB), Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2 TB)', N'15.6" Full HD (1920 x 1080) 144Hz', N'Card rời, RTX 3050 4GB', N'1 x USB Type-C (hỗ trợ USB, DisplayPort, Thunderbolt 4), HDMILAN (RJ45), 3 x USB 3.2, Jack tai nghe 3.5 mm', N'Có đèn bàn phím', N'Windows 11 Home SL', N'Vỏ nhựa', N'Dài 357.9 mm - Rộng 255 mm - Dày 23.5 mm - Nặng 2.31 kg', N'2023',N'HP',N'Laptop'),
(70,N'i3, 1115G4, 3GHz', N'8 GB, DDR4 (Onboard), 3200 MHz', N'256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'14" Full HD (1920 x 1080)', N'Card tích hợp, Intel UHD', N'HDMI, LAN (RJ45), 3 x USB 3.2, Thunderbolt 4 USB-C, Jack tai nghe 3.5 mm', N'            ', N'Windows 11 Home SL', N'Vỏ nhựa', N'Dài 324 mm - Rộng 225.9 mm - Dày 19.9 mm - Nặng 1.47 kg', N'2022',N'HP',N'Laptop'),

(71,N'i5, 12500H, 2.5GHz', N'8 GB, DDR4 (Onboard), 3200 MHz', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB), Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2 TB)', N'15.6" Full HD (1920 x 1080) 165Hz', N'Card rời, RTX 3050Ti 4GB', N'1 x Thunderbolt 4 (hỗ trợ DisplayPort), HDMILAN (RJ45), 3 x USB 3.2, Jack tai nghe 3.5 mm', N'Có đèn bàn phím', N'Windows 11 Home SL', N'Vỏ nhựa - nắp lưng bằng kim loại', N'Dài 358.8 mm - Rộng 262.35 mm - Dày 19.99 mm - Nặng 2.35 kg', N'2022',N'Lenovo',N'Laptop'),
(72,N'i3, 1115G4, 3GHz', N'8 GB, DDR4 (Onboard), 3200 MHz', N'256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'14" Full HD (1920 x 1080)', N'Card tích hợp, Intel UHD', N'1 x USB Type-C (hỗ trợ USB, DisplayPort, Thunderbolt 4), HDMILAN (RJ45), 3 x USB 3.2, Jack tai nghe 3.5 mm', N'               ', N'Windows 11 Home SL', N'Vỏ nhựa', N'Dài 359.2 mm - Rộng 236.5 mm - Dày 19.9 mm - Nặng 1.65 kg', N'2023',N'Lenovo',N'Laptop'),

(73,N'i5, 12500H, 2.5GHz', N'8 GB, DDR4 (Onboard), 3200 MHz', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB), Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2 TB)', N'15.6" Full HD (1920 x 1080) 144Hz', N'Card rời, RTX 3050 4GB', N'1 x 2-in-1 Audio Jack (Headphone / Microphone), 2 x USB Type-C 3.2 Gen 21 x Microphone jack, HDMI, LAN (RJ45), Mini DisplayPort, 1 x USB 2.0, 1 x USB 3.2', N'Có đèn bàn phím', N'Windows 11 Home SL', N'Vỏ nhựa', N'Dài 360 mm - Rộng 238 mm - Dày 22.7 mm - Nặng 1.9 kg', N'2022',N'Gigabyte',N'Laptop'),

(74,N'i5, 1235U, 1.3GHz', N'8 GB, DDR4 (Onboard), 3200 MHz', N'256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'15.6"Full HD (1920 x 1080) 120Hz', N'Card tích hợp, Intel UHD', N'HDMI, 1 x USB 2.0, 2 x USB 3.2, Jack tai nghe 3.5 mm', N'               ', N'Windows 11 Home SL', N'Vỏ nhựa', N'Dài 358.5 mm - Rộng 235.56 mm - Dày 18.9 mm - Nặng 1.9 kg', N'2022',N'Dell',N'Laptop')

select* from DETAILLAP
--delete from DETAILLAP
