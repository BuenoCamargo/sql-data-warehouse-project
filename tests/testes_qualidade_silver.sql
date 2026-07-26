/*
===============================================================================
Verificações de Qualidade (Quality Checks)
===============================================================================
Objetivo do Script:
    Este script realiza várias verificações de qualidade para garantir a 
    consistência, precisão e padronização dos dados na camada 'silver'. 
    Inclui verificações para:
    - Chaves primárias nulas ou duplicadas.
    - Espaços indesejados em campos de texto.
    - Padronização e consistência dos dados.
    - Intervalos e ordens de datas inválidas.
    - Consistência de dados entre campos relacionados.

Notas de Uso:
    - Execute estas verificações após carregar os dados na Camada Silver.
    - Investigue e resolva quaisquer discrepâncias encontradas durante os testes.
===============================================================================
*/

-- ====================================================================
-- Verificando 'silver.crm_cust_info'
-- ====================================================================
-- Verificar valores NULOS ou Duplicados na Chave Primária
-- Expectativa: Nenhum resultado
SELECT 
    cst_id,
    COUNT(*) 
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Verificar Espaços Indesejados
-- Expectativa: Nenhum resultado
SELECT 
    cst_key 
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key);

-- Padronização e Consistência dos Dados
SELECT DISTINCT 
    cst_marital_status 
FROM silver.crm_cust_info;

-- ====================================================================
-- Verificando 'silver.crm_prd_info'
-- ====================================================================
-- Verificar valores NULOS ou Duplicados na Chave Primária
-- Expectativa: Nenhum resultado
SELECT 
    prd_id,
    COUNT(*) 
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Verificar Espaços Indesejados
-- Expectativa: Nenhum resultado
SELECT 
    prd_nm 
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Verificar valores NULOS ou Negativos no Custo
-- Expectativa: Nenhum resultado
SELECT 
    prd_cost 
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- Padronização e Consistência dos Dados
SELECT DISTINCT 
    prd_line 
FROM silver.crm_prd_info;

-- Verificar Ordem de Datas Inválida (Data Inicial > Data Final)
-- Expectativa: Nenhum resultado
SELECT 
    * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

-- ====================================================================
-- Verificando 'silver.crm_sales_details'
-- ====================================================================
-- Verificar Datas Inválidas
-- Expectativa: Nenhuma data inválida
SELECT 
    NULLIF(sls_due_dt, 0) AS sls_due_dt 
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0 
    OR LEN(sls_due_dt) != 8 
    OR sls_due_dt > 20500101 
    OR sls_due_dt < 19000101;

-- Verificar Ordem de Datas Inválida (Data do Pedido > Data de Envio/Vencimento)
-- Expectativa: Nenhum resultado
SELECT 
    * 
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt 
   OR sls_order_dt > sls_due_dt;

-- Verificar Consistência dos Dados: Vendas = Quantidade * Preço
-- Expectativa: Nenhum resultado
SELECT DISTINCT 
    sls_sales,
    sls_quantity,
    sls_price 
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL 
   OR sls_quantity IS NULL 
   OR sls_price IS NULL
   OR sls_sales <= 0 
   OR sls_quantity <= 0 
   OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price;

-- ====================================================================
-- Verificando 'silver.erp_cust_az12'
-- ====================================================================
-- Identificar Datas Fora do Intervalo Permitido
-- Expectativa: Datas de nascimento entre 1924-01-01 e Hoje
SELECT DISTINCT 
    bdate 
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' 
   OR bdate > GETDATE();

-- Padronização e Consistência dos Dados
SELECT DISTINCT 
    gen 
FROM silver.erp_cust_az12;

-- ====================================================================
-- Verificando 'silver.erp_loc_a101'
-- ====================================================================
-- Padronização e Consistência dos Dados
SELECT DISTINCT 
    cntry 
FROM silver.erp_loc_a101
ORDER BY cntry;

-- ====================================================================
-- Verificando 'silver.erp_px_cat_g1v2'
-- ====================================================================
-- Verificar Espaços Indesejados
-- Expectativa: Nenhum resultado
SELECT 
    * 
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat) 
   OR subcat != TRIM(subcat) 
   OR maintenance != TRIM(maintenance);

-- Padronização e Consistência dos Dados
SELECT DISTINCT 
    maintenance 
FROM silver.erp_px_cat_g1v2;
