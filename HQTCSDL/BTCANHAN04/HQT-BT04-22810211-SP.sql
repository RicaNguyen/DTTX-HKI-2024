--- Ho ten: Nguyễn Ba Hoài Nhựt
--- MSSV: 22810211
--- Email: 22810211@student.hcmus.edu.vn
--- Khóa: 2022-2
--- Quản lý thư viện

USE [QLTV];
GO

-- BT4-6: Viết thủ tục cập nhật trạng thái của đầu sách
CREATE OR ALTER PROC sp_CapNhatTrangthaiDausach_22810211
	@isbn INT
AS
DECLARE @SoLuongCS INT;

BEGIN
--Bước 1: xác định số lượng  cuốn sách hiện giờ còn trong thư viện có đầu sách có isbn
	SELECT @SoLuongCS = count(*)
	FROM CuonSach
--Nếu còn ít nhất 1 quyển sách cập nhật tình trạng  đầu sách là yes 
	IF @SoLuongCS >0 
	BEGIN
		UPDATE DauSach SET trangthai='Y' WHERE isbn = @isbn
	END
	--Nếu không còn quyển sách nào cập nhật tình trạng đầu sách là no 
	ELSE 
	BEGIN 
	UPDATE DauSach SET trangthai='N' WHERE isbn = @isbn
	END
END;
GO
-- EXEC sp_CapNhatTrangthaiDausach_22810211 1;
-- SELECT * FROM DauSach WHERE isbn=1
GO

-- BT4-7: Thêm tựa sách mới
CREATE OR ALTER PROC sp_ThemTuaSach_22810211
	@tuasach nvarchar(63),
	@tacgia nvarchar(31),
	@tomtat ntext
AS
BEGIN
--B1: Xác định mã tựa sách sẽ cấp cho tựa sách này thõa QĐ-2
	DECLARE @stt INT = 1;
	DECLARE @matusach_indb INT = 0;
	DECLARE matuasach_cursor CURSOR   
    FOR select ma_tuasach
	from TuaSach
	ORDER BY ma_tuasach ASC
	;
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
	INSERT INTO TuaSach
		(ma_tuasach,TuaSach, tacgia, tomtat)
	VALUES
		(@stt, @tuasach, @tacgia, @tomtat);
END;
GO
-- EXEC sp_ThemTuaSach_22810211 N'a', N'a', N'a';
GO


-- BT4-8: Thêm cuốn sách mới 
CREATE OR ALTER PROC sp_ThemCuonSach_22810211

	@isbn int,
	@TinhTrang nvarchar(1)
AS
BEGIN
	DECLARE @isISBNTonTai INT;

	SELECT @isISBNTonTai = count(*)
	FROM CuonSach
	WHERE isbn = @isbn;
	IF @isISBNTonTai <= 0
		BEGIN
		PRINT N'ISBN không tồn tại';
		RETURN
	END
	ELSE
	BEGIN
		DECLARE @stt INT = 1;
		DECLARE @macuonsach_indb INT = 0;
		DECLARE macuonsach_cursor CURSOR   
     FOR select Ma_CuonSach
		FROM CuonSach
		WHERE isbn = @isbn
		ORDER BY Ma_CuonSach ASC
		;

		OPEN macuonsach_cursor;
		FETCH NEXT FROM macuonsach_cursor INTO @macuonsach_indb;
		IF @macuonsach_indb = 1
	 BEGIN
			WHILE @@FETCH_STATUS = 0
		 BEGIN
				SET @stt=@stt+1;
				-- This is executed as long as the previous fetch succeeds.  
				FETCH NEXT FROM macuonsach_cursor INTO @macuonsach_indb;
				PRINT @macuonsach_indB
				IF @stt <> @macuonsach_indb
				BEGIN
					-- exit while
					BREAK;
				END
			END
		END
		CLOSE macuonsach_cursor;
		DEALLOCATE macuonsach_cursor;
		PRINT N'Mã cuốn sách được thêm: ' + CONVERT(nchar, @stt);
		INSERT INTO CuonSach
			(isbn, Ma_CuonSach, TinhTrang)
		VALUES
			(@isbn, @stt, @TinhTrang);
	END
END
GO

--EXEC sp_ThemCuonSach_22810211 1658885, 'Y';
GO
-- BT4-9: Thêm độc giả người lớn
CREATE OR ALTER PROC sp_ThemNguoiLon_22810211
	@sonha nvarchar(15),
	@duong nvarchar(63),
	@quan nvarchar(2),
	@dienthoai nvarchar(13),
	@Han_SD smalldatetime
AS
BEGIN
	DECLARE @stt INT = 1;
	DECLARE @madocgia_indb INT = 0;
	DECLARE madocgia_cursor CURSOR   
     FOR select MaDocGia
	FROM NguoiLon
	ORDER BY MaDocGia ASC
	;

	OPEN madocgia_cursor;
	FETCH NEXT FROM madocgia_cursor INTO @madocgia_indb;
	IF @madocgia_indb = 1
	 BEGIN
		WHILE @@FETCH_STATUS = 0
		 BEGIN
			SET @stt=@stt+1;
			-- This is executed as long as the previous fetch succeeds.  
			FETCH NEXT FROM madocgia_cursor INTO @madocgia_indb;
			PRINT @madocgia_indb
			IF @stt <> @madocgia_indb
				BEGIN
				-- exit while
				BREAK;
			END
		END
		CLOSE madocgia_cursor;
		DEALLOCATE madocgia_cursor;
		PRINT N'Mã doc gia được thêm: ' + CONVERT(nchar, @stt);
		INSERT INTO NguoiLon
			(MaDocGia,SoNha,Duong, Quan, DTHoai, Han_SD)
		VALUES
			(@stt , @sonha, @duong, @quan, @dienthoai, @Han_SD);
	END
END 
GO
 -- EXEC sp_ThemNguoiLon_22810211 12,N'Phan Boi Chau', '10','012345','2002-06-20 00:00:00';
 GO
-- BT4-10: Thêm đọc giả trẻ em
CREATE OR ALTER PROC sp_Themdocgiatreem_22810211
	@Ho NVARCHAR,
	@TenLot NVARCHAR,
	@Ten NVARCHAR,
	@NgaySinh DATETIME,
	@MaDocGia_nguoilon SMALLINT
AS

BEGIN
	DECLARE @stt INT = 1;
	DECLARE @madocgia_indb INT = 0;
	DECLARE madocgia_cursor CURSOR   
    FOR SELECT MaDocGia FROM DocGia ORDER BY MaDocGia ASC;

	BEGIN TRAN
		OPEN madocgia_cursor;
		FETCH NEXT FROM madocgia_cursor INTO @madocgia_indb;
		IF @madocgia_indb = 1
			BEGIN
				WHILE @@FETCH_STATUS = 0
	 				 BEGIN
						SET @stt=@stt+1;
						-- This is executed as long as the previous fetch succeeds.  
						FETCH NEXT FROM madocgia_cursor INTO @madocgia_indb;
						--PRINT @madocgia_indb
						IF @stt <> @madocgia_indb
							-- exit while
							BREAK;
					 END
			END
		
		CLOSE madocgia_cursor;
		DEALLOCATE madocgia_cursor;

		-- thêm độc giả
		PRINT N'Mã doc gia được thêm: ' + CONVERT(nchar, @stt);

		INSERT INTO DocGia (MaDocGia, Ho, TenLot,Ten, NgaySinh)
		VALUES (@stt ,@Ho, @TenLot,@Ten, @NgaySinh);

		DECLARE @countSLTreEm SMALLINT = 0;
		SELECT @countSLTreEm = count(*) FROM TreEm WHERE MaDocGia_nguoilon = @MaDocGia_nguoilon;
	
		IF @countSLTreEm >=2
			BEGIN
				PRINT N'Mã độc giả người lớn đã bảo lãnh đủ 2 trẻ em';
				-- rollback record độc giả đã thêm bên trên
				ROLLBACK TRAN;
				RETURN
			END
		
	
		INSERT INTO TreEm(MaDocGia,MaDocGia_nguoilon)
		VALUES (@stt ,@MaDocGia_nguoilon);
	COMMIT TRAN;
END 
GO

-- EXEC sp_Themdocgiatreem_22810211 'Banh', 'T', 'Buoi','2002-06-20 00:00:00', 2;