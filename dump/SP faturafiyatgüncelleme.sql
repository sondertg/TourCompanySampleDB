USE [TourCompany]
GO
/****** Object:  StoredProcedure [dbo].[FaturaToplamFiyatHesapla]    Script Date: 1/14/2023 02:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[FaturaToplamFiyatHesapla]
AS
BEGIN
    UPDATE f
    SET f.ToplamFiyat = (
        SELECT SUM(t.TurFiyatı)
        FROM TurSatislari ts
        JOIN Turlar t ON ts.TurID = t.TurID
        WHERE ts.MüşteriID = f.MüşteriID
    )
    FROM Faturalar f
END