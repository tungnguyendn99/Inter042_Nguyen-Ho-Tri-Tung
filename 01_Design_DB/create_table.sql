create table NhanVien (
id bigint primary key not null auto_increment,
HoTen varchar(45),
id_vi_tri bigint not null,
id_trinh_do bigint not null,
id_bo_phan bigint not null,
NgaySinh DATE,
SoCMTND VARCHAR(45),
Luong VARCHAR(45),
SDT VARCHAR(45),
Email VARCHAR (45),
DiaChi VARCHAR (45)
);


create table KhachHang (
id bigint not null primary key auto_increment,
id_loai_khach bigint not null,
HoTen VARCHAR(45),
NgaySinh DATE,
SoCMTND VARCHAR(45),
Luong VARCHAR(45),
SDT VARCHAR(45),
Email VARCHAR (45),
DiaChi VARCHAR (45)
);

create table ViTri (
id bigint not null primary key auto_increment,
TenViTri varchar(45)
);
 
create table BoPhan (
ID bigint not null primary key auto_increment,
TenBoPhan varchar(45)
);

create table TrinhDo (
ID bigint not null primary key auto_increment,
TrinhDo varchar(45)
);

create table LoaiKhach (
id bigint primary key not null,
TenLoaiKhach varchar(45)
);

create table DichVu (
id bigint primary key not null auto_increment,
TenDichVu varchar(45),
DienTich int,
SoTang int,
SoNguoiToiDa varchar(45),
ChiPhiThue varchar(45),
id_kieu_thue bigint not null,
id_loaidichvu bigint not null,
TrangThai varchar(45)
);

create table DichVuDiKem (
id bigint primary key not null auto_increment,
TenDichVuDiKem varchar(45),
Gia int,
DonVi int,
TrangThaiKhaDung varchar(45)
);

create table HopDong (
id bigint primary key not null auto_increment,
id_nhan_vien bigint not null,
id_khach_hang bigint not null,
id_dich_vu bigint not null,
NgayLamHopDong date,
NgayKetThuc date,
TienDatCoc int,
TongTien int
);

create table HopDongChiTiet (
IDHopDongChiTiet bigint primary key not null auto_increment,
id_hop_dong bigint not null,
id_dichvudikem bigint not null,
SoLuong int
);

create table KieuThue (
id bigint not null primary key auto_increment,
TenKieuThue varchar(45),
Gia int
);

create table LoaiDichVu (
id bigint not null primary key auto_increment,
TenLoaiDichVu varchar(45)
); 

alter table NhanVien add foreign key (id_vi_tri) references Vitri(id); 
alter table NhanVien add foreign key(id_vi_tri) references TrinhDo(ID);
alter table NhanVien add foreign key(id_bo_phan) references BoPhan(ID);
	
alter table HopDong add foreign key(id_nhan_vien) references NhanVien(id);
alter table HopDong add foreign key(id_khach_hang) references KhachHang(id);
alter table HopDong add foreign key(id_dich_vu) references DichVu(id);    

alter table HopDongChiTiet add foreign key(id_hop_dong) references HopDong(id);
alter table HopDongChiTiet add foreign key(id_dichvudikem) references DichVuDiKem(id);

alter table KhachHang add foreign key(id_loai_khach) references LoaiKhach(id);

alter table DichVu add foreign key(id_kieu_thue) references KieuThue(id);
alter table DichVu add foreign key(id_loaidichvu) references LoaiDichVu(id);