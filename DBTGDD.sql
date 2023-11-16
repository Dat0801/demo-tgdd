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

CREATE TABLE Slide 
(
	ID int identity (1,1),
	Image nvarchar(250),
	Link nvarchar(250),
	Description NVARCHAR(250),
	CreatedDate DATETIME DEFAULT GETDATE(),
	CreatedBy VARCHAR(50),
	ModifiedDate DATETIME DEFAULT GETDATE(),
	ModifiedBy VARCHAR(50),
	Active BIT DEFAULT 1,
)

CREATE TABLE Footer
(
	ID int IDENTITY(1,1),
	Content nvarchar(500),
	Active BIT DEFAULT 1,
	constraint PK_Footer Primary key (ID)
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
	CreatedDate DATETIME DEFAULT GETDATE(),
	ShipDate DATETIME DEFAULT GETDATE(),
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

INSERT INTO Slide(Image,Link,Description,CreatedBy,Active)
VALUES
(N'banner1.jpg',N'~/Content/img/...',N'Banner1','admin1',1),
(N'banner1.jpg',N'~/Content/img/...',N'Banner1','admin1',1),
(N'banner1.jpg',N'~/Content/img/...',N'Banner1','admin1',1),
(N'banner1.jpg',N'~/Content/img/...',N'Banner1','admin1',1),
(N'banner1.jpg',N'~/Content/img/...',N'Banner1','admin1',1),
(N'banner2.jpg',N'~/Content/img/...',N'Banner2','admin1',1),
(N'banner2.jpg',N'~/Content/img/...',N'Banner2','admin1',1),
(N'banner2.jpg',N'~/Content/img/...',N'Banner2','admin1',1),
(N'banner2.jpg',N'~/Content/img/...',N'Banner2','admin1',1),
(N'banner2.jpg',N'~/Content/img/...',N'Banner2','admin1',1),
(N'banner3.jpg',N'~/Content/img/...',N'Banner3','admin1',1),
(N'banner3.jpg',N'~/Content/img/...',N'Banner3','admin1',1),
(N'banner3.jpg',N'~/Content/img/...',N'Banner3','admin1',1),
(N'banner3.jpg',N'~/Content/img/...',N'Banner3','admin1',1),
(N'banner3.jpg',N'~/Content/img/...',N'Banner3','admin1',1)
select * from Slide
--delete from Slide

INSERT INTO Footer(Content)
VALUES
(N'Trường Đại Học Công Thương'),
(N'Nhóm 8'),
(N'Link facebool'),
(N'Link insta')
select*from Footer
--delete from Footer



INSERT INTO Users(UserName,Password,Name,Phone,Email,Address,CreatedBy,Role)
VALUES
('admin1','123456',N'Lê Trần Công','09876543154','ltc@gmail.com','TP.HCM',null, 'Admin'),
('user1','123',N'Nguyễn Văn An','0987623456','nva@gmail.com','TP.HCM','admin1', 'User')
select*from Users
--delete from Accounts


INSERT INTO Product
VALUES
--Phone--
	--Oppo--
(N'OPPO Find N2 Flip 5G',N'OPPO Find N2 Flip 5G',N'Full HD+',1,1,30000000,5990000,N'OPPO Find N2 Flip 5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'OPPO Reno8 T 5G',N'OPPO Reno8 T 5G',N'Full HD+',1,1,30000000,8490000,N'OPPO Reno8 T 5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'OPPO Find X5 Pro 5G',N'OPPO Find X5 Pro 5G',N'Full HD+',1,1,30000000,17990000,N'OPPO Find X5 Pro 5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'OPPO Reno8 series',N'OPPO Reno8 series',N'Full HD+',1,1,30000000,13990000,N'OPPO Reno8 series.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'OPPO Reno10 5G',N'OPPO Reno10 5G',N'Full HD+',1,1,10190000,9990000,N'OPPO-Reno10-5G.jpg',1,12,'02/07/2022','admin1','02/07/2022','admin1',N'Phone',N' Reno10 5G',1),
	--SamSung--
(N'Samsung Galaxy A24',N'Samsung Galaxy A24',N'Full HD+',1,2,30000000,3790000,N'Samsung Galaxy A24.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'Samsung Galaxy S21 FE 5G',N'Samsung Galaxy S21 FE 5G',N'Full HD+',1,2,30000000,9990000,N'Samsung Galaxy S21 FE 5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'Samsung Galaxy S23 Ultra 5G',N'Samsung Galaxy S23 Ultra 5G',N'Quad HD+ (2K+)',1,2,30000000,23590000,N'Samsung Galaxy S23 Ultra 5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'Samsung Galaxy A34 5G',N'Samsung Galaxy A34 5G',N'Full HD+',1,2,30000000,7590000,N'Samsung Galaxy A34 5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'Samsung Galaxy Z Flip5 5G',N'Samsung Galaxy Z Flip5 5G',N'Full HD+',1,2,30000000,21990000,N'Samsung Galaxy Z Flip5 5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'Samsung Galaxy A04s',N'Samsung Galaxy A04s',N'Full HD+',1,2,30000000,3340000,N'Samsung Galaxy A04s.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' ',1),
(N'Samsung Galaxy Z Fold5 5G',N'Samsung Galaxy Z Fold5 5G',N'Quad HD+ (2K+)',1,2,10190000,9990000,N'Samsung-Galaxy-Z-Fold5-5G.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phone',N' Z Fold5 5G',1),
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
--SmartWatch--
	--Apple--
(N'Apple Watch Series 9 GPS + Cellular 45mm ',N'Apple Watch Series 9 GPS + Cellular 45mm ',N'• Man hinh OLED 19 inch • Theo dõi sức khỏe. Theo dõi mức độ stress. Tính quãng đường chạy. Điện tâm đồ',4,18,30000000,13890000,N'Apple Watch Series 9 GPS plus Cellular 45mm.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Apple Watch Series 9 GPS + Cellular 41mm ',N'Apple Watch Series 9 GPS + Cellular 41mm ',N'• Man hinh OLED 19 inch • Theo dõi sức khỏe. Theo dõi mức độ stress. Tính quãng đường chạy. Điện tâm đồ',4,18,30000000,13890001,N'Apple Watch Series 9 GPS plus Cellular 41mm.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Apple Watch Series 9 GPS  45mm ',N'Apple Watch Series 9 GPS  45mm ',N'• Man hinh OLED 19 inch • Theo dõi sức khỏe. Theo dõi mức độ stress. Tính quãng đường chạy. Điện tâm đồ',4,18,30000000,13890002,N'Apple Watch Series 9 GPS  45mm .jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Apple Watch Series 9 GPS  41mm ',N'Apple Watch Series 9 GPS  41mm ',N'• Man hinh OLED 19 inch • Theo dõi sức khỏe. Theo dõi mức độ stress. Tính quãng đường chạy. Điện tâm đồ',4,18,30000000,13890003,N'Apple Watch Series 9 GPS  41mm .jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Apple Watch SE 2023 GPS + Cellular 44mm ',N'Apple Watch SE 2023 GPS + Cellular 44mm ',N'• Man hinh OLED 19 inch • Theo dõi sức khỏe. Theo dõi mức độ stress. Tính quãng đường chạy. Điện tâm đồ',4,18,30000000,13890004,N'Apple Watch SE 2023 GPS plus Cellular 44mm.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
	--Xiaomi--
(N'Xiaomi Mi Band 8 dây TPU',N'Xiaomi Mi Band 8 dây TPU',N'Màn hình: TFT, 1.47 inch      Theo dõi sức khỏe: Theo dõi mức độ stress, Tính quãng đường chạy, Đếm số bước chân       Thông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)',4,19,30000000,5999000,N'Xiaomi Mi Band 8 dây TPU.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'Xiaomi Watch 2 Pro 46 mm dây silicone',N'Xiaomi Watch 2 Pro 46 mm dây silicone',N'Màn hình: TFT, 1.47 inch      Theo dõi sức khỏe: Theo dõi mức độ stress, Tính quãng đường chạy, Đếm số bước chân       Thông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)',4,19,30000000,5999001,N'Xiaomi Watch 2 Pro 46 mm dây silicone.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
	--BeFit--
(N'BeFit Watch Ultra S 52.1mm dây silicone',N'BeFit Watch Ultra S 52.1mm dây silicone',N'Màn hình: AMOLED, 1.95 inch     Theo dõi sức khỏe: Đo nồng độ oxy (SpO2), Đo nhịp tim, Đo huyết áp  Thông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)',4,20,30000000,840999,N'BeFit Watch Ultra S 52.1mm dây silicone.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'BeFit Watch Ultra 52.6mm dây silicone',N'BeFit Watch Ultra 52.6mm dây silicone',N'Màn hình: AMOLED, 1.95 inch     Theo dõi sức khỏe: Đo nồng độ oxy (SpO2), Đo nhịp tim, Đo huyết áp  Thông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)',4,20,30000000,840999,N'BeFit Watch Ultra 52.6mm dây silicone.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
	--imoo--
(N'imoo Z1 41mm dây TPU Hồng nhạt',N'imoo Z1 41mm dây TPU Hồng nhạt',N'Màn hình: TFT-LCD, 1.3 inch      Theo dõi sức khỏe: Đếm số bước chân',4,21,30000000,2720000,N'imoo Z1 41mm dây TPU Hồng nhạt.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),
(N'imoo Z1 41mm dây TPU Xanh dương',N'imoo Z1 41mm dây TPU Xanh dương',N'Màn hình: TFT-LCD, 1.3 inch      Theo dõi sức khỏe: Đếm số bước chân',4,21,30000000,2720001,N'imoo Z1 41mm dây TPU Xanh dương.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'SmartWatch',N' ',1),

--PC--	
	--Asus--
(N'Asus S500SD i5 12400 (512400050W)',N'Asus S500SD i5 12400 (512400050W)',N'RAM 8GB   SSD 512GB',5,22,30000000,15590000,N'Asus S500SD i5 12400 (512400050W).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'PC',N' ',1),
(N'Asus ExpertCenter AIO A3202WBAK i3 1215U 21.45 inch (WA018W)',N'Asus ExpertCenter AIO A3202WBAK i3 1215U 21.45 inch (WA018W)',N'RAM 8GB   SSD 512GB',5,22,30000000,17590001,N'Asus ExpertCenter AIO A3202WBAK i3 1215U 21.45 inch (WA018W).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'PC',N' ',1),
(N'Asus ExpertCenter AIO A5402WVAK i5 1340P 23.8 inch (BA016W)',N'Asus ExpertCenter AIO A5402WVAK i5 1340P 23.8 inch (BA016W)',N'RAM 8GB   SSD 512GB',5,22,30000000,17590000,N'Asus ExpertCenter AIO A5402WVAK i5 1340P 23.8 inch (BA016W).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'PC',N' ',1),
	--HP--
(N'HP AIO ProOne 240 G9 i3 1215U 23.8 inch (6M3T0PA)',N'HP AIO ProOne 240 G9 i3 1215U 23.8 inch (6M3T0PA)',N'RAM 8GB   SSD 512GB',5,23,30000000,14790000,N'HP AIO ProOne 240 G9 i3 1215U 23.8 inch (6M3T0PA).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'PC',N' ',1),
(N'HP Slim Desktop S01 pF2025d i5 12400 (6K7A3PA)',N'HP Slim Desktop S01 pF2025d i5 12400 (6K7A3PA)',N'RAM 8GB   SSD 512GB',5,23,30000000,18190000,N'HP Slim Desktop S01 pF2025d i5 12400 (6K7A3PA).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'PC',N' ',1),
(N'HP AIO 22 dd2002d i5 1235U 21.5 inch (6K7G1PA)',N'HP AIO 22 dd2002d i5 1235U 21.5 inch (6K7G1PA)',N'RAM 8GB   SSD 512GB',5,23,30000000,21990000,N'HP AIO 22 dd2002d i5 1235U 21.5 inch (6K7G1PA).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'PC',N' ',1),
(N'HP AIO ProOne 240 G9 i5 1235U 23.8 inch (6M3V2PA)',N'HP AIO ProOne 240 G9 i5 1235U 23.8 inch (6M3V2PA)',N'RAM 8GB   SSD 512GB',5,23,30000000,11190000,N'HP AIO ProOne 240 G9 i5 1235U 23.8 inch (6M3V2PA).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'PC',N' ',1),
(N'HP ProOne 440 G9 AIO i5 12500T 23.8 inch (6M3X9PA)',N'HP ProOne 440 G9 AIO i5 12500T 23.8 inch (6M3X9PA)',N'RAM 8GB   SSD 512GB',5,23,30000000,11190001,N'HP ProOne 440 G9 AIO i5 12500T 23.8 inch (6M3X9PA).jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'PC',N' ',1),
	--Mac--
(N'iMac 24 inch 2023 4.5K/8-core GPU',N'iMac 24 inch 2023 4.5K/8-core GPU',N'RAM 8GB   SSD 512GB',5,24,30000000,41190000,N'iMac 24 inch 2023 4.5K-8-core GPU.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'PC',N' ',1),
--Phụ Kiện--
	--Ava+--
(N' AVA+ 15W JP399',N' AVA+ 15W JP399',N' Chip E-marker Smart   1m',6,25,30000000,100001,N'AVAplus 15W JP399.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phụ Kiện',N' ',1),
(N'Tai nghe Bluetooth True Wireless AVA+ FreeGo A20',N'Tai nghe Bluetooth True Wireless AVA+ FreeGo A20',N' Chip E-marker Smart   1m',6,25,30000000,100001,N'Tai nghe Bluetooth True Wireless AVAplus FreeGo A20.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phụ Kiện',N' ',1),
(N'Tai nghe Bluetooth True Wireless AVA+ Buds Life Air 2',N'Tai nghe Bluetooth True Wireless AVA+ Buds Life Air 2',N' Chip E-marker Smart   1m',6,25,30000000,100001,N'Tai nghe Bluetooth True Wireless AVAplus Buds Life Air 2.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phụ Kiện',N' ',1),
	--Baseus--
(N'Baseus Comet 22.5W PPMD10 kèm Cáp Lightning và Type C',N'Baseus Comet 22.5W PPMD10 kèm Cáp Lightning và Type C',N' Chip E-marker Smart   1m',6,26,30000000,100001,N'Baseus Comet 22.5W PPMD10 kèm Cáp Lightning và Type C.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phụ Kiện',N' ',1),
(N'Cáp Lightning 1m Baseus CoolPlay CB000044',N'Cáp Lightning 1m Baseus CoolPlay CB000044',N' Chip E-marker Smart   1m',6,26,30000000,100001,N'Cáp Lightning 1m Baseus CoolPlay CB000044.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phụ Kiện',N' ',1),
	--Xmobile--
(N'Xmobile 20W DS611',N'Xmobile 20W DS611',N' Chip E-marker Smart   1m',6,27,30000000,100001,N'Xmobile 20W DS611.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phụ Kiện',N' ',1),
(N'Cáp Lightning 1m Xmobile DR-L001X',N'Cáp Lightning 1m Xmobile DR-L001X',N' Chip E-marker Smart   1m',6,27,30000000,100001,N'Cáp Lightning 1m Xmobile DR-L001X.jpg',1,12,'02/07/2022','admin1','02/07/2022',null,N'Phụ Kiện',N' ',1)
	select* from Product
--delete from Product

