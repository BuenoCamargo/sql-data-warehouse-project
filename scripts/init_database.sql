/*
=============================================================
Criação do Banco de Dados e Schemas (Camadas)
=============================================================
Objetivo do Script:
    Este script cria um novo banco de dados chamado 'DataWarehouse' após verificar 
    se ele já existe. Se o banco de dados existir, ele será excluído (dropped) e 
    recriado do zero. Além disso, o script configura os três schemas fundamentais 
    dentro do banco: 'bronze', 'silver' e 'gold'.
	
PERIGO / ATENÇÃO:
    A execução deste script irá ELIMINAR COMPLETAMENTE o banco de dados 'DataWarehouse', 
    caso ele já exista. Todos os dados armazenados serão deletados permanentemente. 
    Proceda com extrema cautela e certifique-se de possuir backups válidos 
    antes de rodar este script.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
