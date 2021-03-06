USE [ShoppingEngine]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetItemsByName]    Script Date: 22-08-2020 17:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetItemsByName]
@CategoryName varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		SELECT 
    Category.Name as CategoryName,
    SubCategory.Name as SubCategoryName,
    Item.Name as ItemName,
    Item.Description 
FROM
    Category
INNER JOIN
    SubCategory ON Category.Id = SubCategory.CategoryId
INNER JOIN
    Item ON Item.SubCategoryId = SubCategory.Id where Category.Id IN (SELECT Category.Id from Category where Name=@CategoryName)

END