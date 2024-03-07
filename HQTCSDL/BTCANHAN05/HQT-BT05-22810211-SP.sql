--- Ho ten: Nguyễn Ba Hoài Nhựt
--- MSSV: 22810211
--- Email: 22810211@student.hcmus.edu.vn
--- Khóa: 2022-2
--- Quản lý thư viện

USE [QLTV];
GO

-- BT5-11: Viết thủ tục xóa độc giả
CREATE OR ALTER PROC sp_XoaDocGia_22810211
	@MaDocGia INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
		--Bước 1: kiểm tra độc giả có tồn tại hay không
			DECLARE @slDocGia INT = 0;
			SELECT @slDocGia = count(*) FROM DocGia WHERE MaDocGia = @MaDocGia;
			IF @slDocGia = 0
				BEGIN
					PRINT N'Không tồn tại đọc giả';
					-- Kết thúc thủ tục
					PRINT '>> ROLLING BACK'
					ROLLBACK TRAN;
					RETURN;
				END
		-- Bước 2: kiểm tra độc giả có đang mượn sách hay không
			DECLARE @slSachDangMuon INT = 0;
			SELECT @slSachDangMuon = count(*) FROM QuaTrinhMuon WHERE MaDocGia = @MaDocGia AND ngay_tra IS NULL;
			IF @slSachDangMuon > 0
				BEGIN
					PRINT N'Không thể xóa độc giả được';
					-- Kết thúc thủ tục
					PRINT '>> ROLLING BACK'
					ROLLBACK TRAN;
					RETURN;
				END
		-- Bước 3: kiểm tra độc giả này là người lớn hay trẻ em
			DECLARE @isDocGiaNguoiLon SMALLINT = 0;
			SELECT @isDocGiaNguoiLon = count(*) FROM NguoiLon WHERE MaDocGia = @MaDocGia;

			-- nếu độc giả là người lớn
			IF @isDocGiaNguoiLon > 0
				BEGIN
					DECLARE @slBaoLanhTreEm SMALLINT = 0;
					SELECT @slBaoLanhTreEm = count(*) FROM TreEm WHERE MaDocGia_nguoilon = @MaDocGia;
					-- kiểm tra độc giả có bảo lãnh trẻ em hay không
					-- nếu độc giả không bảo lanh trẻ em
					IF @slBaoLanhTreEm = 0
						BEGIN
							DELETE NguoiLon WHERE MaDocGia = @MaDocGia;
							DELETE QuaTrinhMuon WHERE MaDocGia = @MaDocGia;
							DELETE DangKy WHERE MaDocGia = @MaDocGia;
							DELETE DocGia WHERE MaDocGia = @MaDocGia;
						END
					ELSE
						BEGIN
							-- xóa dữ liệu trẻ em mà độc giả này bảo lãnh
							DELETE QuaTrinhMuon WHERE MaDocGia IN (SELECT MaDocGia FROM TreEm WHERE MaDocGia_nguoilon = @MaDocGia);
							DELETE DangKy WHERE MaDocGia IN (SELECT MaDocGia FROM TreEm WHERE MaDocGia_nguoilon = @MaDocGia);
							DELETE DocGia WHERE MaDocGia IN (SELECT MaDocGia FROM TreEm WHERE MaDocGia_nguoilon = @MaDocGia);
							DELETE TreEm WHERE MaDocGia_nguoilon = @MaDocGia;

							-- xóa dữ liệu độc giả
							DELETE NguoiLon WHERE MaDocGia = @MaDocGia;
							DELETE QuaTrinhMuon WHERE MaDocGia = @MaDocGia;
							DELETE DangKy WHERE MaDocGia = @MaDocGia;
							DELETE DocGia WHERE MaDocGia = @MaDocGia;
						END
				END

			ELSE
				BEGIN
					DELETE TreEm WHERE MaDocGia = @MaDocGia;
					DELETE QuaTrinhMuon WHERE MaDocGia = @MaDocGia;
					DELETE DangKy WHERE MaDocGia = @MaDocGia;
					DELETE DocGia WHERE MaDocGia = @MaDocGia;
				END
		PRINT '>> COMMIT BACK'		
		COMMIT TRAN;
	END TRY
	BEGIN CATCH
		PRINT '>> ROLLING BACK'
		ROLLBACK TRAN;

	END CATCH
END;
GO
EXEC sp_XoaDocGia_22810211 23;
GO
