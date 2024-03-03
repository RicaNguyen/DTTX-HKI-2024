--- Ho ten: Nguyễn Ba Hoài Nhựt
--- MSSV: 22810211
--- Email: 22810211@student.hcmus.edu.vn
--- Khóa: 2022-2
--- Quản lý thư viện

USE [QLTV];
GO

-- YC1: Viết thủ tục cập nhật trạng thái của đầu sách
CREATE OR ALTER PROC sp_CapNhatTrangthaiDausach_22810211
	@isbn INT
AS
DECLARE @SoLuongCS INT;

BEGIN
	SELECT @SoLuongCS = count(*)
	FROM CuonSach
	WHERE isbn = @isbn AND TinhTrang = 'Y';
	IF @SoLuongCS >0 
	BEGIN
		UPDATE DauSach SET trangthai='Y' WHERE isbn = @isbn
	END
END;
GO
 --EXEC sp_CapNhatTrangthaiDausach_22810211 1;
GO

-- YC2: Thêm tựa sách mới
CREATE OR ALTER PROC sp_ThemTuaSach_22810211
	@tuasach nvarchar(63),
	@tacgia nvarchar(31),
	@tomtat ntext
AS
BEGIN
	DECLARE @stt INT = 1;
	DECLARE @matusach_indb INT = 0;
	DECLARE matuasach_cursor CURSOR   
    FOR select ma_tuasach
	from TuaSach
	ORDER BY ma_tuasach ASC;

	OPEN matuasach_cursor;
	FETCH NEXT FROM matuasach_cursor INTO @matusach_indb;
	IF @matusach_indb = 1
	BEGIN
		WHILE @@FETCH_STATUS = 0
		 BEGIN
			SET @stt=@stt+1;
			-- This is executed as long as the previous fetch succeeds.  
			FETCH NEXT FROM matuasach_cursor INTO @matusach_indb;

			IF @stt <> @matusach_indb
				BEGIN
				-- exit while
				BREAK;
			END
		END
	END


	CLOSE matuasach_cursor;
	DEALLOCATE matuasach_cursor;
	PRINT N'Mã tựa sách được thêm: ' + CONVERT(nchar, @stt);
	INSERT INTO TuaSach(ma_tuasach,TuaSach, tacgia, tomtat)
	VALUES (@stt, @tuasach, @tacgia, @tomtat);
END;
GO
EXEC sp_ThemTuaSach_22810211 N'a', N'a', N'a';
GO 


-- YC3: Thêm cuốn sách mới 
-- YC4: Thêm tựa độc giả người lớn