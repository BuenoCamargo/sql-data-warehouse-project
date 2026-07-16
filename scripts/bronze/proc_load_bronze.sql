CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '=====================================================';
		PRINT 'Carregando Camada Bronze';
		PRINT '=====================================================';

		PRINT '-----------------------------------------------------';
		PRINT 'Carregando Tabelas CRM';
		PRINT '-----------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncando Tabela: bronze.crm_cust_info <<';
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT '>> Inserindo Dados Em: bronze.crm_cust_info <<';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\sql\dwh_project\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Duração do carregamento: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' segundos';
		PRINT '>> -------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncando tabela: bronze.crm_prd_info <<';
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>> Inserindo Dados Em: bronze.crm_prd_info <<';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\sql\dwh_project\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Duração do carregamento: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' segundos';
		PRINT '>> -------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncando tabela: bronze.crm_sales_details <<';
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>> Inserindo Dados Em: bronze.crm_sales_details <<';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\sql\dwh_project\datasets\source_crm\sales_details.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Duração do carregamento: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' segundos';
		PRINT '>> -------------';

		PRINT '-----------------------------------------------------';
		PRINT 'Carregando tabelas ERP';
		PRINT '-----------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncando tabela: bronze.erp_cust_az12 <<';
		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT '>> Inserindo Dados Em: bronze.erp_cust_az12 <<';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\sql\dwh_project\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Duração do carregamento: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' segundos';
		PRINT '>> -------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncando tabela: bronze.erp_loc_a101 <<';
		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT '>> Inserindo Dados Em: bronze.erp_loc_a101 <<';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\sql\dwh_project\datasets\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Duração do carregamento: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' segundos';
		PRINT '>> -------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncando tabela: bronze.erp_px_cat_g1v2 <<';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		PRINT '>> Inserindo Dados Em: bronze.erp_px_cat_g1v2 <<';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\sql\dwh_project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Duração do carregamento: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' segundos';
		PRINT '>> -------------';

		SET @batch_end_time = GETDATE();
		PRINT '=========================================='
		PRINT 'Dados da camada bronze carregados com sucesso';
        PRINT '   - Duração total: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' segundos';
		PRINT '=========================================='

	END TRY
	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERRO OCORRIDO DURANTE O CARREGAMENTO DA CAMADA BRONZE'
		PRINT 'Mensagem de erro' + ERROR_MESSAGE();
		PRINT 'Mensagem de erro' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Mensagem de erro' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END
