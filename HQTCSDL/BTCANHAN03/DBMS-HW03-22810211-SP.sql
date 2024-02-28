--- Ho ten: Nguyễn Ba Hoài Nhựt
--- MSSV: 22810211
--- Email: 22810211@student.hcmus.edu.vn
--- Khóa: 2022-2
--- Quản lý thư viện

USE [QLTV];
GO

-- YC1: Viết thủ tục xem thông tin độc giả
GO
CREATE OR ALTER PROCEDURE [dbo].sp_ThongtinDocGia_22810211 
    @MaDocGia INT
AS
BEGIN
	DECLARE @isDocGiaTonTai INT;

	SELECT @isDocGiaTonTai = count(*) FROM DocGia WHERE MaDocGia = @MaDocGia;

	IF @isDocGiaTonTai <= 0
		BEGIN
			PRINT N'Độc giả không tồn tại';
			RETURN
		END
	ELSE
		BEGIN
			SELECT * FROM DocGia WHERE MaDocGia = @MaDocGia;

			-- kiểm tra độc giả là người lớn hay trẻ em
			DECLARE @isDocGiaNguoiLon INT;

			SELECT @isDocGiaNguoiLon = count(*) FROM NguoiLon WHERE MaDocGia = @MaDocGia;

			IF @isDocGiaNguoiLon > 0
				SELECT * FROM NguoiLon WHERE MaDocGia = @MaDocGia;
			ELSE
				SELECT * FROM TreEm JOIN NguoiLon ON TreEm.MaDocGia_nguoilon = NguoiLon.MaDocGia WHERE TreEm.MaDocGia = @MaDocGia;
		END
END
GO

-- EXEC sp_ThongtinDocGia_22810211 1;
-- EXEC sp_ThongtinDocGia_22810211 2;

-- YC2: Viết thủ tục xem thông tin đầu sách
GO
CREATE OR ALTER PROCEDURE [dbo].sp_ThongtinDauSach_22810211 
    @isbn INT
AS
BEGIN
	DECLARE @isDauSachTonTai INT;

	SELECT @isDauSachTonTai = count(*) FROM DauSach WHERE @isbn = @isbn;

	IF @isDauSachTonTai <= 0
		BEGIN
			PRINT N'Đầu sách không tồn tại';
			RETURN
		END
	ELSE
		BEGIN
			DECLARE @slSachChuaChoMuon INT;
			SELECT @slSachChuaChoMuon = count(*) FROM CuonSach WHERE isbn = @isbn AND TinhTrang = 'N';
			SELECT *, @slSachChuaChoMuon AS N'SL sách chưa cho mượn' FROM DauSach JOIN TuaSach ON DauSach.ma_tuasach = TuaSach.ma_tuasach WHERE isbn = @isbn;
		END
END
GO

-- EXEC sp_ThongtinDauSach_22810211 1;

-- YC3: Liệt kê độc giả người lớn đang mượn sách
GO
CREATE OR ALTER PROCEDURE [dbo].sp_ThongtinNguoiLonDangMuon_22810211
AS
BEGIN
	SELECT * FROM QuaTrinhMuon JOIN NguoiLon ON QuaTrinhMuon.MaDocGia = NguoiLon.MaDocGia AND QuaTrinhMuon.ngay_tra IS NULL;
END
GO

-- EXEC sp_ThongtinNguoiLonDangMuon_22810211;


-- YC4: Liệt kê độc giả người lớn đang mượn sách quá hạn
GO
CREATE OR ALTER PROCEDURE [dbo].sp_ThongtinNguoiLonQuaHan_22810211
AS
BEGIN
	SELECT * FROM QuaTrinhMuon JOIN NguoiLon
	ON QuaTrinhMuon.MaDocGia = NguoiLon.MaDocGia
	AND QuaTrinhMuon.ngay_tra IS NULL
	AND QuaTrinhMuon.ngay_hethan < GETDATE();
END
GO

EXEC sp_ThongtinNguoiLonQuaHan_22810211;

-- YC5: Liệt kê những độc giả người lớn đang mượn sách có trẻ em củng đang mượn sách
GO
CREATE OR ALTER PROCEDURE [dbo].sp_DocGiaCoTreEmMuon_22810211
AS
BEGIN
	SELECT * FROM
	DocGia JOIN NguoiLon ON DocGia.MaDocGia = NguoiLon.MaDocGia 
	JOIN TreEm ON NguoiLon.MaDocGia = TreEm.MaDocGia_nguoilon
	WHERE NguoiLon.MaDocGia IN (SELECT QuaTrinhMuon.MaDocGia FROM QuaTrinhMuon WHERE QuaTrinhMuon.MaDocGia = NguoiLon.MaDocGia AND QuaTrinhMuon.ngay_tra IS NULL)
	AND TreEm.MaDocGia IN (SELECT QuaTrinhMuon.MaDocGia FROM QuaTrinhMuon WHERE QuaTrinhMuon.MaDocGia = TreEm.MaDocGia AND QuaTrinhMuon.ngay_tra IS NULL)
END
GO

EXEC sp_DocGiaCoTreEmMuon_22810211;