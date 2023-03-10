USE [TourCompany]
GO
/****** Object:  Trigger [dbo].[tr_update_sales]    Script Date: 1/14/2023 02:50:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[tr_update_sales]
ON [dbo].[Faturalar]
AFTER INSERT
AS
BEGIN
    UPDATE F
    SET Satıslar = (
        SELECT CAST(TS.TurID as varchar(20)) + ', ' 
        FROM TurSatislari TS
        WHERE TS.MüşteriID = F.MüşteriID
        FOR XML PATH('')
    )
    FROM Faturalar F
    JOIN inserted i ON F.MüşteriID = i.MüşteriID
END
