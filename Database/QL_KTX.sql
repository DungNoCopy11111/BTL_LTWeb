create database QL_KTX
go
use QL_KTX
go
create table HopDong (
	MaHopDong int not null,
	NgayKi datetime not null,
	NgayHetHan datetime not null,
	GiaThue int,
	GhiChu nvarchar(200),
	constraint pk_HopDong primary key (MaHopDong)
)
create table Que(
	MaQue int,
	TenQue nvarchar(50),
	constraint pk_Que primary key (MaQue)
)
create table Khoa(
	MaKhoa int,
	TenKhoa nvarchar(20)
	constraint pk_Khoa primary key (MaKhoa)
)
create table Lop(
	MaLop int,
	TenLop nvarchar(20),
	MaKhoa int,
	foreign key(MaKhoa) references Khoa(MaKhoa),
	constraint pk_Lop primary key (MaLop)
)
create table Nha(
	MaNha int,
	TenNha nvarchar(20),
	constraint pk_Nha primary key (MaNha)
)
create table Phong(
	MaPhong int,
	TenPhong nvarchar(20),
	Songuoitoida int,
	LoaiPhong nvarchar(20),
	Songuoidango int,
	Ghichu nvarchar(200),
	MaNha int,
	AnhDaiDienPhong nchar(500),
	GiaPhong int,
	constraint pk_Phong primary key (MaPhong),
	foreign key(MaNha) references Nha(MaNha)
)
create table CTAnhPhong(
	MaPhong int not null,
	LinkAnh varchar(200) not null,
	constraint pk_AnhPhong primary key(MaPhong,LinkAnh),
	foreign key(MaPhong) references Phong(MaPhong)
)
create table ThietBi(
	MaThietBi int,
	TenThietBi nvarchar(50),
	MaPhong int,
	AnhThietBi nchar(200),
	constraint pk_ThietBi primary key (MaThietBi),
	foreign key(MaPhong) references Phong(MaPhong)
)
create table HoaDon(
	MaHoaDon int,
	HanThanhToan datetime,
	TongTien int,
	constraint pk_HoaDon primary key (MaHoaDon),
)
create table ChiTietHoaDon(
	MaHoaDon int,
	MaPhong int,
	Tiendien int,
	Tiennuoc int,
	Tiendichvu int,
	Tienphong int,
	constraint pk_ChiTietHoaDon primary key (MaHoaDon,MaPhong),
	foreign key(MaHoaDon) references HoaDon(MaHoaDon),
	foreign key(MaPhong) references Phong(MaPhong)
)
create table SinhVien(
	MaSinhVien int,
	TenSinhVien nvarchar(50),
	NgaySinh datetime,
	GioiTinh nvarchar(50),
	SoDienThoat nvarchar(20),
	MaHopDong int,
	MaPhong int,
	MaLop int,
	MaQue int,
	TaiKhoan nvarchar(20),
	MatKhau nvarchar(20),
	Anh nvarchar(500),
	SoCCCD nvarchar(50),
	TrangThai int,
	constraint pk_SinhVien primary key (MaSinhVien),
	foreign key(MaHopDong) references HopDong(MaHopDong),
	foreign key(MaQue) references Que(MaQue),
	foreign key(MaPhong) references Phong(MaPhong),
	foreign key(MaLop) references Lop(MaLop),
)

create table TaiKhoan(
	IdUser int,
	Username nvarchar(50),
	Pass nvarchar(50),
	LoaiTK int
)

/*insert Khoa*/
insert into Khoa values(1,N'CNTT')
insert into Khoa values(2,N'Điện - Điện tử')
insert into Khoa values(3,N'Công trình')
insert into Khoa values(4,N'Kinh tế vận tải')
insert into Khoa values(5,N'Cơ khí')

/*insert Lop*/
insert into Lop values(1,N'CNTT6-K62',1)
insert into Lop values(2,N'TDH2-K62',2)
insert into Lop values(3,N'TDH1-K62',2)
insert into Lop values(4,N'KTVT1-K62',4)
insert into Lop values(5,N'OTO1-K62',5)

/*insert Que*/
insert into Que values(1,N'Hà Nam')
insert into Que values(2,N'Hà Tĩnh')
insert into Que values(3,N'Hà Nội')
insert into Que values(4,N'Bắc Giang')

/*insert HopDong*/
insert into HopDong values(1,'2023-03-10 00:00:00.000','2024-01-10 00:00:00.000',400000,N'100% thiết bị sử dụng ok')
insert into HopDong values(2,'2022-06-01 00:00:00.000','2023-06-01 00:00:00.000',600000,N'80% thiết bị sử dụng tốt')
insert into HopDong values(3,'2022-12-01 00:00:00.000','2022-03-01 00:00:00.000',500000,N'80% thiết bị sử dụng tốt')
insert into HopDong values(4,'2022-03-02 00:00:00.000','2022-09-02 00:00:00.000',500000,N'100% thiết bị sử dụng ok')
insert into HopDong values(5,'2022-05-01 00:00:00.000','2023-05-01 00:00:00.000',400000,N'Bàn hỏng, còn lại ok')
insert into HopDong values(6,'2022-06-01 00:00:00.000','2023-06-01 00:00:00.000',600000,N'Bàn hỏng, còn lại ok')

/*insert Nha*/
insert into Nha values(1,N'Nhà A1')
insert into Nha values(2,N'Nhà B1')
insert into Nha values(3,N'Nhà C1')
insert into Nha values(4,N'Nhà D1')

/*insert HoaDon*/
insert into HoaDon values(1,'2023-04-01 00:00:00.000',1500000)
insert into HoaDon values(2,'2023-06-01 00:00:00.000',1200000)
insert into HoaDon values(3,'2023-02-01 00:00:00.000',1200000)
insert into HoaDon values(5,'2023-01-01 00:00:00.000',1300000)


/*insert Phong*/
insert into Phong values(1, N'P101', 4, N'Bình thường', 1, NULL, 1, 'anhdaidien1.jpg', 1200000)
insert into Phong values(2, N'P102', 4, N'Cao cấp', 2, NULL, 2, 'anhdaidien2.jpg', 1500000)
insert into Phong values(3, N'P201', 6, N'Cao cấp', 2, NULL, 3, 'anhdaidien3.jpg', 1500000)
insert into Phong values(4, N'P202', 4, N'Bình thường', 1, NULL, 3, 'anhdaidien4.jpg',1200000)
insert into Phong values(5, N'P104', 8, N'Bình thường', 1, NULL, 4, 'anhdaidien5.jpg', 1200000)


/*insert ThietBi*/
insert into ThietBi values(1,N'Bàn',1,N'ban_thietbi1.png')                                                                                                                                                                                     
insert into ThietBi values(2,N'Bàn',2,N'ban_thietbi2.png')                                                                       
insert into ThietBi values(3,N'Tủ',1,N'tu_thietbi1.png')                                                                      
insert into ThietBi values(4,N'Tủ',2,N'tu_thietbi2.png')                                                                      
insert into ThietBi values(5,N'Bàn',3,N'ban_thietbi3.png')                                                                       
insert into ThietBi values(6,N'Bàn',4,N'ban_thietbi4.png')                                                                       
insert into ThietBi values(7,N'Tủ',3,N'tu_thietbi3.png')  

/*insert ChiTietHoaDon*/
insert into ChiTietHoaDon values(1,1,200000,150000,200000,1200000)
insert into ChiTietHoaDon values(2,2,200000,200000,150000,1500000)
insert into ChiTietHoaDon values(3,3,150000,150000,200000,1500000)
insert into ChiTietHoaDon values(4,4,200000,200000,200000,1200000)
insert into ChiTietHoaDon values(5,5,150000,100000,150000,1500000)

/*insert CTAnhPhong */
insert into CTAnhPhong values(1,'chitietp1_1.jpg')
insert into CTAnhPhong values(2,'chitietp2_1.jpg')
insert into CTAnhPhong values(2,'chitietp2_2.jpg')
insert into CTAnhPhong values(2,'chitietp2_3.jpg')
insert into CTAnhPhong values(3,'chitietp3_1.jpg')
insert into CTAnhPhong values(3,'chitietp3_2.jpg')
insert into CTAnhPhong values(3,'chitietp3_3.jpg')
insert into CTAnhPhong values(3,'chitietp3_4.jpg')
insert into CTAnhPhong values(4,'chitietp4_1.jpg')
insert into CTAnhPhong values(4,'chitietp4_2.jpg')
insert into CTAnhPhong values(5,'chitietp5_1.jpg')
insert into CTAnhPhong values(5,'chitietp5_2.jpg')

/*insert SinhVien */

insert into SinhVien values(1001,N'Nguyễn Tiến Dũng','2003-07-12','Nam','0856893561',1,1,1,1,'admin','123','anhthe1.jpg','261828424',-1)
insert into SinhVien values(1002,N'Âu Đức Ngà','2002-02-02','Nam','0568486465',2,2,2,2,'username','123','anhthe2.jpg','201515155',NULL)
insert into SinhVien values(1003,N'Trần Đức An','2002-04-12','Nam','0458465151',3,3,4,1,'ad','212','anhthe3.jpg','112121121',NULL)
insert into SinhVien values(1004,N'Trần Khoa Trường','2002-09-12','Nam','0654415151',4,2,3,3,'add','123','anhthe4.jpg','211515151',NULL)
insert into SinhVien values(1005,N'Nguyễn Đăng Hoàng Bình','2002-04-12','Nam','0351511515',5,4,5,3,'addd','12','anhthe5.jpg','211201231',NULL)
insert into SinhVien values(1006,N'Nguyễn Quang Huy','2002-05-13','Nam','0356874554',6,5,2,2,NULL,NULL,'anhthe5.jpg',NULL,NULL)
select *from SinhVien
