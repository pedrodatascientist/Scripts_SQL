-- Criando banco de dados
CREATE DATABASE VENDAS
-- Criando a tabela para receber os dados de vendas
-- Sem constraints(restrições) nem chaves(será uma tabela sem relacinamentos)
CREATE TABLE TBLVENDACARTAO(	
		Datavenda DATE,
		Plano INT,
		Statusp VARCHAR(20),
		Lote VARCHAR(30),
		NSU VARCHAR(32),
		Autorizador VARCHAR(30),
		Vvenda VARCHAR(8),
		Txadim VARCHAR(8),
		Txantec VARCHAR(8),
		Liquidoreceber VARCHAR(8),
		Txpratic VARCHAR(8),
		DataCred DATE,
		Produto VARCHAR(40),
		Operadora VARCHAR(40));
GO
--Inserindo dados em massa a partir de um arquito texto .txt
BULK INSERT TBLVENDACARTAO
FROM 'C:\Users\Pedr0\Desktop\ReportConMar.txt'
WITH (FIRSTROW = 2,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n');

--Query para visualizar os dados na tabela
SELECT * FROM TBLVENDACARTAO
		

