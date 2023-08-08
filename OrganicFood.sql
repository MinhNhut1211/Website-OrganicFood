Create database Organic
GO

Use Organic
Go

Create table PhanQuyen
(
	IDQuyen int not null primary key,
	TenQuyen nvarchar(50)
)

insert into PhanQuyen
Values(1, N'admin'),
	  (2, N'user')

Create table NguoiDung
(
	MaNguoiDung int Identity(1, 1) not null primary key,
	IDQuyen int,
	HoTen nvarchar(100),
	NgaySinh datetime,
	SoDienThoai nvarchar(15),
	GioiTinh nvarchar(10),
	DiaChi nvarchar(max),
	Email nvarchar(50),
	MatKhau nvarchar(15),
	constraint fk_IDQuyen_NguoiDung foreign key (IDQuyen) references PhanQuyen(IDQuyen)
)
set dateformat dmy
insert into NguoiDung(IDQuyen, HoTen, NgaySinh, SoDienThoai, GioiTinh, DiaChi, Email, MatKhau)
values( 2, N'Trần Minh Nhựt','12/11/2002', N'0123456789', N'Nam', N'Hồ Chí Minh', N'tmn12112002@gmail.com', N'123465')
	  
set dateformat dmy
insert into NguoiDung(IDQuyen, HoTen, NgaySinh, SoDienThoai, GioiTinh, DiaChi, Email, MatKhau)
values(1, N'Admin là tôi', '12/11/2002', N'0937187003', N'Nam', N'Hồ Chí Minh', N'Admin@gmail.com', N'0123456')

select * from NguoiDung
Create table Loai
(
	IDLoai int Identity(1, 1) not null primary key,
	TenLoai nvarchar(100),
	HinhAnh nvarchar(20)
)
Insert into Loai (TenLoai, HinhAnh)
Values( N'Rau Củ', N'rau.jpg'),
	  ( N'Trái Cây', N'traicay.jpg'),
	  ( N'Quả Mọng Nước', N'quamnuoc.jpg'),
	  ( N'Trứng', N'trung.jpg')
select* from Loai
Create table SanPham
(
	MaSanPham int Identity(1, 1) not null primary key,
	TenSanPham nvarchar(50),
	HinhAnh nvarchar(20),
	GiaTien decimal,
	MoTa nvarchar(max),
	IDLoai int,
	constraint fk_IDLoai_SanPham foreign key(IDLoai) references Loai(IDLoai)
)

insert into SanPham (TenSanPham, HinhAnh, GiaTien, MoTa, IDLoai)
Values ( N'Táo Đỏ', N'01.jpg', 20000, N'Táo đỏ là một loại quả có nguồn gốc từ họ Rosaceae, với màu sắc thường là hồng, đỏ hoặc hồng đậm. Quả táo đỏ có hương vị ngọt ngào và thường được sử dụng tươi hoặc trong các món ăn và thức uống.Chức năng của táo đỏ là cung cấp dinh dưỡng và vitamin cho cơ thể, đặc biệt là vitamin C và chất xơ. Nó giúp tăng cường hệ miễn dịch, duy trì sức khỏe tim mạch và hỗ trợ quá trình tiêu hóa. Táo đỏ cũng chứa chất chống oxy hóa, có thể giúp giảm nguy cơ mắc một số bệnh mãn tính.', 2),
	   ( N'Chuối', N'02.jpg', 10000, N'Chuối là loại quả vỏ màu vàng/xanh lá cây, thịt ngọt mềm. Cung cấp năng lượng, vitamin, khoáng chất, tốt cho sức khỏe tim mạch, hỗ trợ tiêu hóa.', 2),
	   ( N'Xoài', N'03.jpg', 15000,N'Xoài là một loại quả có vỏ mỏng, màu sắc thường là vàng hoặc xanh, thịt quả mềm và ngọt ngào. Chức năng của xoài là cung cấp vitamin A, vitamin C và chất xơ, tăng cường miễn dịch, bảo vệ mắt và hỗ trợ tiêu hóa.', 2),
	   ( N'Mận Hà Nội',N'04.jpg', 35000,N'Mận Hà Nội là một giống mận đặc biệt của Việt Nam, có màu đỏ tươi, thịt quả mềm mịn và ngọt ngào. Chức năng của mận Hà Nội là cung cấp vitamin C, chất chống oxi hóa và chất xơ, hỗ trợ sức khỏe tim mạch, giảm nguy cơ mắc bệnh và tăng cường hệ miễn dịch.', 2 ),
	   ( N'Dâu Tây', N'05.jpg', 60000, N'Dâu tây là loại quả nhỏ, hình tròn và màu đỏ tươi. Thịt quả mềm mịn, ngọt ngào và có hương vị đặc trưng. Chức năng của dâu tây là cung cấp nhiều vitamin C, chất chống oxy hóa và chất xơ, hỗ trợ hệ miễn dịch, giảm nguy cơ mắc bệnh và có lợi cho sức khỏe tim mạch.',3),
	   ( N'Sầu Riêng', N'06.jpg', 85000, N'Sầu riêng là một loại quả có vỏ nâu gai, thịt quả mềm, màu trắng và có mùi thơm đặc trưng. Quả sầu riêng thường có hương vị ngọt đậm và độc đáo. Chức năng của sầu riêng là cung cấp năng lượng, vitamin C và chất xơ, hỗ trợ hệ tiêu hóa và tăng cường sức khỏe da.',2),
	   ( N'Dưa Lưới', N'07.jpg', 50000, N'Dưa lưới là loại quả có vỏ màu xanh nhạt hoặc trắng với các đường gân dọc vàng nhạt. Thịt quả mềm, mọng nước và có hương vị ngọt ngào. Chức năng của dưa lưới là cung cấp nước và khoáng chất, giúp giữ cho cơ thể được cân bằng nước và duy trì sự mát mẻ trong những ngày nóng.',2),
	   ( N'Ổi Xá Lị', N'08.jpg', 26000, N'Ổi xá lị là một loại cây ổi có trái nhỏ, hình cầu với màu sắc từ xanh đến vàng. Thịt quả mềm mịn, có hương vị độc đáo, hậu ngọt và chua. Chức năng của ổi xá lị là cung cấp nhiều vitamin C, chất xơ và chất chống oxy hóa, hỗ trợ hệ miễn dịch, duy trì sức khỏe da và giảm nguy cơ mắc bệnh.',2),
	   ( N'Nho', N'09.jpg', 180000, N'Nho là quả nhỏ, tròn có màu tím, xanh hoặc đỏ. Thịt quả mềm mịn và hương vị ngọt ngào. Chức năng của nho là cung cấp nhiều vitamin, chất chống oxy hóa và chất xơ, giúp bảo vệ sức khỏe tim mạch, hỗ trợ hệ miễn dịch và duy trì sức khỏe tốt.',3),
	   ( N'Dưa Hấu', N'10.jpg', 20000, N'Dưa hấu là quả hình cầu có vỏ màu xanh, thịt quả mềm, mọng nước và ngọt ngào. Chức năng của dưa hấu là cung cấp nước và vitamin C, giúp giảm nhiệt độ cơ thể, giải khát và làm dịu cảm giác mệt mỏi trong những ngày nóng.',1),
	   ( N'Cải Xà Lách', N'11.jpg', 30000, N'Cải xà lách là loại rau xanh, lá mềm mướt và có hương vị nhẹ nhàng. Chức năng của cải xà lách là cung cấp nhiều chất xơ, vitamin C và khoáng chất, giúp duy trì hệ tiêu hóa khỏe mạnh, hỗ trợ sức khỏe da và tăng cường miễn dịch.',1),
	   ( N'Cải Ngọt', N'12.jpg', 40000, N'Cải ngọt là loại rau xanh, có lá mềm và hương vị dịu nhẹ. Chức năng của cải ngọt là cung cấp chất xơ, vitamin A, C và các khoáng chất, giúp tăng cường hệ miễn dịch, duy trì sức khỏe da và hỗ trợ quá trình tiêu hóa.',1),
	   ( N'Rau Muống', N'13.jpg', 22000, N'Rau muống là loại rau có cành mềm và mọng nước. Chức năng của rau muống là cung cấp nhiều chất xơ, vitamin C, sắt và canxi, giúp bảo vệ sức khỏe tim mạch, hỗ trợ hệ tiêu hóa và tăng cường xương khớp',1),
	   ( N'Củ Cà Rốt', N'14.jpg', 55000, N'Củ cà rốt là loại củ màu da cam hoặc tím, có thịt chắc và ngọt. Chức năng của củ cà rốt là cung cấp beta-caroten, vitamin A và các chất chống oxy hóa, giúp duy trì tầm nhìn, bảo vệ da khỏi tia tử ngoại và hỗ trợ hệ miễn dịch',1),
	   ( N'Củ Khoai Tây', N'16.jpg', 26000, N'Củ khoai tây là loại củ màu trắng hoặc vàng, có thịt mềm và hương vị ngọt. Chức năng của củ khoai tây là cung cấp carbohydrate, vitamin C, B6 và chất xơ, giúp cung cấp năng lượng cho cơ thể, hỗ trợ hệ tiêu hóa và duy trì sức khỏe tốt.',1),
	   ( N'Dưa Leo', N'17.jpg', 35000, N'Dưa leo là loại quả dài, xanh, có vỏ mỏng và thịt mọng nước. Chức năng của dưa leo là cung cấp nước, vitamin K và chất xơ, giúp duy trì cân bằng nước trong cơ thể và hỗ trợ quá trình tiêu hóa.',1),
	   ( N'Củ Cải Trắng', N'15.jpg', 26000, N'Cải trắng là loại rau xanh, lá dày và củ trắng. Chức năng của cải trắng là cung cấp chất xơ, vitamin C và các khoáng chất, giúp tăng cường hệ miễn dịch, duy trì sức khỏe tim mạch và hỗ trợ quá trình tiêu hóa.',1),
	   ( N'Quả Cà Chua', N'18.jpg', 50000, N'Quả cà chua có màu đỏ, hình cầu và thịt mềm. Chức năng của quả cà chua là cung cấp vitamin C, chất chống oxy hóa và lycopene, giúp bảo vệ tim mạch, chống viêm nhiễm và duy trì làn da khỏe mạnh',3),
	   ( N'Trứng Gà', N'19.jpg', 30000, N'Trứng gà là loại trứng phổ biến, có vỏ màu trắng hoặc nâu. Chức năng của trứng gà là cung cấp protein, vitamin B12 và choline, hỗ trợ xây dựng cơ bắp, duy trì sức khỏe thần kinh và não bộ',4),
	   ( N'Trứng Cút', N'20.jpg', 20000, N'Trứng cút là loại trứng nhỏ, có vỏ màu gần như trắng. Chức năng của trứng cút là cung cấp nhiều protein, vitamin B và sắt, hỗ trợ sức khỏe tế bào và hồng cầu',4),
	   ( N'Trứng Vịt', N'21.jpg', 35000, N'Trứng vịt là loại trứng lớn, có vỏ màu xám. Chức năng của trứng vịt là cung cấp nhiều protein, chất béo không bão hòa và vitamin D, giúp duy trì sức khỏe xương và cơ bắp.',4),
	   ( N'Trứng Đà Điểu', N'22.jpg', 60000, N'Trứng đà điểu là loại trứng lớn, có vỏ màu xanh da trời hoặc xám. Chức năng của trứng đà điểu là cung cấp nhiều chất dinh dưỡng, bao gồm protein, chất béo không bão hòa và sắt, hỗ trợ sức khỏe tim mạch và hệ tiêu hóa.',4),
	   ( N'Trứng Đà Điểu Emu', N'23.jpg', 100000, N'Trứng đà điểu emu có kích thước lớn và vỏ màu xanh da trời. Chức năng của trứng đà điểu emu là cung cấp nhiều chất dinh dưỡng, bao gồm protein, chất béo không bão hòa và sắt, hỗ trợ sức khỏe tim mạch và hệ tiêu hóa.',4),
	   ( N'Bơ', N'24.jpg', 25000, N'Quả bơ có hình bầu dục, vỏ màu xanh lá và thịt mềm, màu vàng hoặc xanh nhạt. Chức năng của quả bơ là cung cấp chất béo không bão hòa, vitamin E và K, giúp duy trì sức khỏe tim mạch, da và hệ miễn dịch.',2)

select * from NguoiDung

Create table DonHang
(
	MaDonHang int Identity(1, 1) not null primary key,
	MaNguoiDung int,
	NgayDat datetime,
	ThanhToan int,
	TinhTrangGiaoHang int,
	TongTien decimal,
	DiaChiNhanHang nvarchar(max)
	constraint fk_MaNguoiDung_DonHang foreign key (MaNguoiDung) references NguoiDung(MaNguoiDung)
)

Create table ChiTietDonHang
(
	MaDonHang int not null,
	MaSanPham int not null,
	SoLuong int,
	DonGia decimal,
	ThanhTien decimal,
	PhuongThucThanhToan int,
	constraint pk_ChiTietDonHang primary key(MaDonHang, MaSanPham),
	constraint fk_MaDonHang_ChiTietDonHang foreign key (MaDonHang) references DonHang(MaDonHang),
	constraint fk_MaSanPham_ChiTietDonHang foreign key (MaSanPham) references SanPham(MaSanPham)
)

select TenLoai, TenSanPham, GiaTien, SanPham.HinhAnh from Loai, SanPham where SanPham.IDLoai=Loai.IDLoai


set dateformat dmy
insert into NguoiDung(IDQuyen, HoTen, NgaySinh, SoDienThoai, GioiTinh, DiaChi, Email, MatKhau)
values(2, N'Đinh Thị C', '10/01/2002', N'0123654987', N'Nữ', N'Hồ Chí Minh', N'CDinhThi@gmail.com', N'0123456')

insert into SanPham (TenSanPham, HinhAnh, GiaTien, MoTa, IDLoai)
Values ( N'Chôm Chôm', N'25.jpg', 20000, N'Táo đỏ là một loại quả có nguồn gốc từ họ Rosaceae, với màu sắc thường là hồng, đỏ hoặc hồng đậm. Quả táo đỏ có hương vị ngọt ngào và thường được sử dụng tươi hoặc trong các món ăn và thức uống.Chức năng của táo đỏ là cung cấp dinh dưỡng và vitamin cho cơ thể, đặc biệt là vitamin C và chất xơ. Nó giúp tăng cường hệ miễn dịch, duy trì sức khỏe tim mạch và hỗ trợ quá trình tiêu hóa. Táo đỏ cũng chứa chất chống oxy hóa, có thể giúp giảm nguy cơ mắc một số bệnh mãn tính.', 2)

Insert into Loai (TenLoai, HinhAnh)
Values( N'Củ cải', N'cucai.jpg')