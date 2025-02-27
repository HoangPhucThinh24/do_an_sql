create database QuanLyRapPhim;
use QuanLyRapPhim;

create table rap_phim(
id int primary key auto_increment,
tenrap varchar(100) not null,
diachi varchar(100),
sodienthoai varchar(20) unique
);

create table phong_chieu_phim (
id int primary key auto_increment,
tenphong varchar(100) not null,
soghengoi int,
idrapphim int,
foreign key (idrapphim) references rap_phim(id)
);

create table phim  (
id int primary key auto_increment,
tenphim varchar(100) not null,
theloai varchar(100),
ngaykhoichieu date,
thoiluong int, -- phút
mota text
);

create table lich_chieu (
id int primary key auto_increment,
idphim int,
idphongchieuphim int,
thoigianchieu datetime,
foreign key (idphim) references phim(id),
foreign key (idphongchieuphim) references phong_chieu_phim(id)
);

create table vi_tri_ngoi (
id int primary key auto_increment,
idphongchieuphim int,
soghe int,
foreign key (idphongchieuphim) references phong_chieu_phim(id)
);

create table nhan_vien (
id int primary key auto_increment,
hoten varchar(50) not null,
email varchar(50) unique,
sodienthoai varchar(100) unique,
age int,
chucvu varchar(50),
idrapphim int,
foreign key (idrapphim) references rap_phim(id)
);

create table khach_hang (
id int primary key auto_increment,
hoten varchar(50) not null,
email varchar(50) unique,
sodienthoai varchar(100) unique,
age int
);

create table don_thanh_toan (
id int primary key auto_increment,
idlichchieu int,
idkhachhang int,
thoigiandatve datetime,
trangthai varchar(50),
foreign key (idlichchieu) references lich_chieu(id),
foreign key (idkhachhang) references khach_hang(id)
);

create table thong_tin_chieu_phim (
id int auto_increment primary key,
phim_id int,
lichchieu_id int,
foreign key (phim_id) references phim(id),
foreign key (lichchieu_id) references lich_chieu(id)
);

-- Thêm dữ liệu vào bảng rap_phim
INSERT INTO rap_phim (id, tenrap, diachi, sodienthoai) VALUES
(1, 'CGV Vincom', '123 Nguyễn Trãi, Hà Nội', '0123456789'),
(2, 'Lotte Cinema', '456 Lê Văn Sỹ, TP.HCM', '0987654321'),
(3, 'BHD Star', '789 Cách Mạng Tháng 8, Đà Nẵng', '0369852147'),
(4, 'Galaxy Cinema', '159 Võ Văn Kiệt, Cần Thơ', '0912345678'),
(5, 'Mega GS', '753 Trần Hưng Đạo, Hải Phòng', '0876543210');

-- Thêm dữ liệu vào bảng phong_chieu_phim
INSERT INTO phong_chieu_phim (id, tenphong, soghengoi, idrapphim) VALUES
(1, 'Phòng 1', 100, 1),
(2, 'Phòng 2', 120, 1),
(3, 'Phòng 3', 80, 2),
(4, 'Phòng 4', 150, 3),
(5, 'Phòng 5', 90, 4);

-- Thêm dữ liệu vào bảng phim
INSERT INTO phim (id, tenphim, theloai, ngaykhoichieu, thoiluong, mota) VALUES
(1, 'Avengers: Endgame', 'Hành động', '2019-04-26', 181, 'Bom tấn của Marvel'),
(2, 'Parasite', 'Tâm lý', '2019-05-30', 132, 'Phim Hàn Quốc đạt giải Oscar'),
(3, 'Interstellar', 'Khoa học viễn tưởng', '2014-11-07', 169, 'Du hành vũ trụ và thời gian'),
(4, 'The Dark Knight', 'Hành động', '2008-07-18', 152, 'Batman đối đầu với Joker'),
(5, 'Inception', 'Khoa học viễn tưởng', '2010-07-16', 148, 'Giấc mơ trong giấc mơ');

-- Thêm dữ liệu vào bảng lich_chieu
INSERT INTO lich_chieu (id, idphongchieuphim, thoigianchieu) VALUES
(1, 1, '2025-03-01 18:00:00'),
(2, 2, '2025-03-01 20:30:00'),
(3, 3, '2025-03-02 15:00:00'),
(4, 4, '2025-03-02 19:45:00'),
(5, 5, '2025-03-03 21:00:00');

-- Thêm dữ liệu vào bảng thong_tin_chieu_phim (Bảng trung gian)
INSERT INTO thong_tin_chieu_phim (phim_id, lichchieu_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Thêm dữ liệu vào bảng vi_tri_ngoi
INSERT INTO vi_tri_ngoi (id, idphongchieuphim, soghe) VALUES
(1, 1, 10),
(2, 2, 20),
(3, 3, 30),
(4, 4, 40),
(5, 5, 50);

-- Thêm dữ liệu vào bảng khach_hang
INSERT INTO khach_hang (id, hoten, email, sodienthoai, age) VALUES
(1, 'Nguyễn Văn A', 'nguyenvana@gmail.com', '0901122334', 25),
(2, 'Trần Thị B', 'tranthib@gmail.com', '0912233445', 30),
(3, 'Lê Hoàng C', 'lehoangc@gmail.com', '0923344556', 22),
(4, 'Phạm Minh D', 'phamminhd@gmail.com', '0934455667', 28),
(5, 'Đỗ Thanh E', 'dothanhe@gmail.com', '0945566778', 35);

-- Thêm dữ liệu vào bảng don_thanh_toan
INSERT INTO don_thanh_toan (id, idlichchieu, idkhachhang, thoigiandatve) VALUES
(1, 1, 1, '2025-03-01 18:00:00'),
(2, 2, 2, '2025-03-01 20:30:00'),
(3, 3, 3, '2025-03-02 15:00:00'),
(4, 4, 4, '2025-03-02 19:45:00'),
(5, 5, 5, '2025-03-03 21:00:00');

-- Thêm dữ liệu vào bảng nhan_vien
INSERT INTO nhan_vien (id, hoten, email, sodienthoai, age, chucvu, idrapphim) VALUES
(1, 'Hoàng Anh', 'hoanganh@gmail.com', '0956677889', 29, 'Quản lý', 1),
(2, 'Lê Thanh', 'lethanh@gmail.com', '0967788990', 35, 'Nhân viên bán vé', 2),
(3, 'Trần Hùng', 'tranhung@gmail.com', '0978899001', 26, 'Nhân viên kỹ thuật', 3),
(4, 'Nguyễn Minh', 'nguyenminh@gmail.com', '0989900112', 32, 'Nhân viên bảo vệ', 4),
(5, 'Phạm Bảo', 'phambao@gmail.com', '0990011223', 27, 'Nhân viên vệ sinh', 5);

--  lấy danh sách tất cả các phim và thể loại của chúng
select tenphim, theloai from phim;

--  lấy danh sách khách hàng đã đặt vé, cùng với thời gian đặt vé
select hoten, thoigiandatve
from khach_hang join don_thanh_toan on khach_hang.id = don_thanh_toan.idkhachhang;

--  lấy ra nhân viên , chức vụ và rạp phim làm việc  
select hoten, chucvu, tenrap  
from nhan_vien join rap_phim on nhan_vien.idrapphim = rap_phim.id;

-- and/or/not
-- lấy phim có thời lượng trên 160 phút và thể loại hành động  
select tenphim, theloai from phim  
where thoiluong > 160 and theloai = 'Hành động';

--  lấy khách hàng có tuổi dưới 18 hoặc trên 50  
select hoten, age from khach_hang  
where age < 18 or age > 50;

-- lấy nhân viên không phải là quản lý  
select hoten, chucvu from nhan_vien  
where not chucvu = 'Quản lý';

-- lấy ra thông tin nhân viên có tuổi lớn nhất ( max/min )
select * from nhan_vien where age = (select max(age) from nhan_vien);

select * from nhan_vien where age = (select min(age) from nhan_vien);

-- lấy danh sách phim sắp xếp theo ngày khởi chiếu mới nhất trước  (order by)
select tenphim, ngaykhoichieu from phim  order by ngaykhoichieu desc;

--  đếm số lượng phim theo thể loại, chỉ lấy thể loại có từ 2 phim trở lên  ( group by - having , count )
select theloai, count(*) as 'số lượng phim'  from phim group by theloai having count(*) >= 2;

-- lấy ra số tuổi trung bình của tất cả nhân viên ( avg )
select avg(age) from nhan_vien;

-- tìm phim có tên bắt đầu bằng chữ a
select * from phim  where tenphim like 'a%';

--  lấy danh sách phim có thể loại thuộc hành động và kinh dị 
select * from phim where theloai in ('Hành động', 'Kinh dị');

-- tạo view lấy danh sách phim và thời gian chiếu
create view lichchieuphim as 
select tenphim, thoigianchieu from phim 
join thong_tin_chieu_phim on phim.id = thong_tin_chieu_phim.phim_id  
join lich_chieu on thong_tin_chieu_phim.lichchieu_id = lich_chieu.id;

select*from lichchieuphim;

-- tạo funtion tổng số nhân viên theo chức vụ
DELIMITER $$
create function tongsonhanvientheochucvu( chucvu_nhanvien varchar(50) )  
returns int  
deterministic  
begin  
declare so_nhan_vien int;  
select count(*) into so_nhan_vien from nhan_vien where chucvu = chucvu_nhanvien;  
return so_nhan_vien;  
end $$
DELIMITER ;

select tongsonhanvientheochucvu ('Quản lý') as 'tổng số quản lý' ;

-- tạo procedure tìm phim theo thể loại
DELIMITER $$
create procedure timphimtheotheloai (in theloai_phim varchar(50))  
begin  
select tenphim from phim where theloai = theloai_phim;  
end $$
DELIMITER ;

call timphimtheotheloai ('Hành động');














