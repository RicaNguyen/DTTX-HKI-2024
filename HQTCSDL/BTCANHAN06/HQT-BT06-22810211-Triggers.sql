--- Ho ten: Nguyễn Ba Hoài Nhựt
--- MSSV: 22810211
--- Email: 22810211@student.hcmus.edu.vn
--- Khóa: 2022-2
--- Quản lý thư viện

USE [QLTV];
GO

-- BT6.1 tg_delMuon: Viết trigger trên quan hệ mượn... 
CREATE OR ALTER TRIGGER tg_delMuon ON muon FOR DELETE
AS
BEGIN
	UPDATE CuonSach SET TinhTrang = 'Y' WHERE Ma_CuonSach IN (SELECT ma_cuonsach FROM deleted)
END
GO

-- BT6.2 tg_insMuon: Viết trigger trên quan hệ mượn... 
CREATE OR ALTER TRIGGER tg_insMuon ON muon FOR INSERT
AS
BEGIN
	UPDATE CuonSach SET TinhTrang = 'N' WHERE Ma_CuonSach IN (SELECT ma_cuonsach FROM inserted)
END
GO

-- BT6.3 tg_updCuonSach: Viết trigger trên quan hệ mượn... 
CREATE OR ALTER TRIGGER tg_updCuonSach ON CuonSach FOR UPDATE
AS
BEGIN
	DECLARE @slCuonSachChuaChoMuon INT = 0;
	SELECT @slCuonSachChuaChoMuon = count(*) FROM CuonSach WHERE TinhTrang = 'N';
	IF @slCuonSachChuaChoMuon = 0
		BEGIN
			UPDATE DauSach SET trangthai = 'N'
		END
END
GO