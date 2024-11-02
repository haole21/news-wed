﻿-- XEM CÁC DANH SÁCH 
SELECT * FROM SANPHAM 
GO 

SELECT * FROM NHANVIEN 
GO 

SELECT * FROM THANHPHO 
GO 

SELECT * FROM KHACHHANG 
GO 

SELECT * FROM HOADON
GO 

SELECT * FROM CHITIETHD
GO 



-- THÊM SẢN PHẨM 
CREATE PROC SP_THEMSP (@MASP CHAR (6),@TEN NVARCHAR (20) , @DVTINH CHAR(10), @DONGIA MONEY ,@HINH NVARCHAR (225)) 
AS 
 INSERT INTO SANPHAM VALUES (@MASP,@TEN,@DVTINH,@DONGIA,@HINH)
 GO 

-- EXEC SP_THEMSP'6', N'DƯA HẤU','Kg','8000' ,N'duahau.png'
 GO 

 -- XOÁ SẢN PHẨM 
  CREATE PROC SP_XOASP (@MASP CHAR(6))
  AS
   DELETE SANPHAM WHERE  MASP = @MASP
   GO 

  -- EXEC SP_XOASP '6'
   GO
   
   -- SỬA SẢN PHẨM 
   CREATE PROC SP_SUASP (@MASP CHAR (6),@TEN NVARCHAR (20) , @DVTINH CHAR(10), @DONGIA MONEY ,@HINH NVARCHAR (225))
   AS
   UPDATE SANPHAM 
   SET TENSP = @TEN 
   , DVTINH = @DVTINH , 
   DONGIA = @DONGIA ,
   HINH = @HINH 
   WHERE MASP = @MASP 
   GO 
  -- EXEC SP_SUASP '6', N'DƯA GANG','Kg','9000' ,N'duagang.png'
   go

   -- THÊM NHÂN VIÊN 
CREATE PROC SP_THEMNV ( @MANV CHAR (6), @HO  NVARCHAR (20), @TEN  NVARCHAR (20), @NU CHAR (10) , @NGAYNV DATETIME , @DCHI NVARCHAR (225), @DTH  NVARCHAR (10), @HINH NVARCHAR (225)) 
AS 
 INSERT INTO NHANVIEN VALUES (@MANV ,@HO  ,@TEN , @NU , @NGAYNV  , @DCHI , @DTH , @HINH )
 GO 

 --EXEC SP_THEMNV '6' ,N'LÊ', N'NHÀN','NU','12/06/2021',N'Q.6 , TPHCM',N'0129837456',N'nv6.png'
 GO 

 -- XOÁ NHÂN VIÊN 
  CREATE PROC SP_XOANV (@MANV CHAR(6))
  AS
   DELETE  NHANVIEN WHERE  MANV = @MANV
   GO 

  -- EXEC SP_XOANV '6'
   GO
   
   -- SỬA NHÂN VIÊN 
   CREATE PROC SP_SUANV (@MANV CHAR (6), @HO  NVARCHAR (20), @TEN  NVARCHAR (20), @NU CHAR (10) , @NGAYNV DATETIME , @DCHI NVARCHAR (225), @DTH  NVARCHAR (10), @HINH NVARCHAR (225))
   AS
   UPDATE  NHANVIEN
   SET HO = @HO ,
   TEN = @TEN , 
   NU = @NU , 
   NGAYNV = @NGAYNV , 
   DCHI = @DCHI , 
   DTH = @DTH , 
   HINH = @HINH 
   WHERE MANV = @MANV
   GO 
   --EXEC SP_SUANV '6' ,N'LÊ', N'NỮ','NU','02/06/2021',N'Q BÌNH THẠNH, TPHCM',N'0129837443',N'nv6.png'
   go

   -- THÊM KHÁCH HÀNG 
CREATE PROC SP_THEMKH (@MAKH CHAR (6),@DCHI NVARCHAR (225),@TENCTY NVARCHAR (225),@TP CHAR (6) ,@DTH NVARCHAR (10)) 
AS 
INSERT INTO KHACHHANG VALUES (@MAKH ,@DCHI ,@TENCTY ,@TP  ,@DTH)
GO 

-- EXEC SP_THEMKH '6',N'Q.10 THHCM',N'CÔNG TY TRANG TRÍ TIỆC CƯỚI', '1',N'0487502345'
 GO 

 -- XOÁ SẢN PHẨM 
  CREATE PROC SP_XOAKH (@MAKH CHAR(6))
  AS
   DELETE KHACHHANG WHERE  MAKH = @MAKH
   GO 

  -- EXEC SP_XOAKH '6'
   GO
   
   -- SỬA SẢN PHẨM 
   CREATE PROC SP_SUAKH (@MAKH CHAR (6),@DCHI NVARCHAR (225),@TENCTY NVARCHAR (225),@TP CHAR (6) ,@DTH NVARCHAR (10)) 
   AS
   UPDATE KHACHHANG
   SET DCHI = @DCHI , 
   TENCTY = @TENCTY , 
   TP= @TP , 
   DTH = @DTH 
   WHERE MAKH = @MAKH
   GO 
  -- EXEC SP_SUAKH '6',N'Q.10 THHCM',N'CÔNG TY TRANG TRÍ ', '1',N'0487502345'
   go

   
   -- THÊM THÀNH PHỐ 
CREATE PROC SP_THEMTP ( @MATP CHAR (6),@TENTP NVARCHAR (20)) 
AS 
INSERT INTO THANHPHO VALUES ( @MATP ,@TENTP)
GO 

-- EXEC SP_THEMTP '5',N'HÀ NỘI'
 GO 

 -- XOÁ THÀNH PHỐ 
  CREATE PROC SP_XOATP (@MATP CHAR(6))
  AS
   DELETE THANHPHO  WHERE  MATP = @MATP
   GO 

  -- EXEC SP_XOATP '5'
   GO
   
   -- SỬA THÀNH PHỐ 
   CREATE PROC SP_SUATP ( @MATP CHAR (6),@TENTP NVARCHAR (20)) 
   AS
   UPDATE THANHPHO 
   SET TENTP = @TENTP
   WHERE MATP = @MATP
   GO 
  -- EXEC SP_SUATP '5',N'HUẾ'
   go

     -- THÊM HOÁ ĐƠN 
CREATE PROC SP_THEMHD (@MAHD CHAR (6), @MAKH CHAR (6), @MANV CHAR (6), @NGAYLAPHD DATETIME, @NGAYNHANHANG DATETIME ) 
AS 
INSERT INTO HOADON VALUES (@MAHD , @MAKH , @MANV , @NGAYLAPHD , @NGAYNHANHANG )
GO 

-- EXEC SP_THEMHD '7','2','4','2/04/2024','2/13/2024'
 GO 

 -- XOÁ HOÁ ĐƠN 
  CREATE PROC SP_XOAHD (@MAHD CHAR (6))
  AS
   DELETE HOADON  WHERE  MAHD = @MAHD
   GO 

  -- EXEC SP_XOAHD '7'
   GO
   
   -- SỬA HOÁ ĐƠN 
   CREATE PROC SP_SUAHD (@MAHD CHAR (6), @MAKH CHAR (6), @MANV CHAR (6), @NGAYLAPHD DATETIME, @NGAYNHANHANG DATETIME) 
   AS
   UPDATE HOADON
   SET MAKH = @MAKH,
   MANV = @MANV , 
   NGAYLAPHD = @NGAYLAPHD , 
   NGAYNHANHANG = @NGAYNHANHANG
   WHERE MAHD = @MAHD
   GO 
  -- EXEC SP_SUAHD '7','3','1','2/09/2024','2/13/2024'
   go

 -- THÊM  CHI TIẾT HOÁ ĐƠN 
CREATE PROC SP_THEMCTHD (@MAHD CHAR (6), @MASP CHAR(6 ), @SL INT) 
AS 
INSERT INTO CHITIETHD VALUES (@MAHD, @MASP, @SL  )
GO 

-- EXEC SP_THEMCTHD '7','4',150
 GO 

 -- XOÁ CHI TIẾT HOÁ ĐƠN 
  CREATE PROC SP_XOACTHD  (@MAHD CHAR (6), @MASP CHAR(6 ))
  AS
   DELETE CHITIETHD  WHERE   MAHD = @MAHD AND MASP = @MASP 
   GO 

  -- EXEC SP_XOACTHD  '7','4'
   GO
   
   -- SỬA CHI TIẾT HOÁ ĐƠN 
   CREATE PROC SP_SUACTHD  (@MAHD CHAR (6), @MASP CHAR(6 ), @SL INT) 
   AS
   UPDATE CHITIETHD
   SET SL = @SL 
   WHERE  MAHD = @MAHD AND MASP = @MASP 
   GO 
  -- EXEC SP_SUACTHD '7','4',2000
   go

 