-- EXTRAÇÃO, TRANFORMAÇÃO E CARGA DE DADOS PARA ANÁLISE DE DADOS EM LINGUAGEM SQL

-- Criando a tabela que receberá os dados,
CREATE TABLE tbl_pense2015Estudantes_am2(
								texto varchar(1600));

                                                      --EXTRAÇÃO--
--Copiando os dados para a tabela  
COPY tbl_pense2015Estudantes_am2 FROM 'C:\Users\Pedro\Desktop\Pense1215\PENSE_AMOSTRA2_ALUNO.csv';
DELETE FROM tbl_pense2015Estudantes_am2 WHERE texto LIKE '%ANO%';

--Criando a tabela que receberá os dados para análise.
CREATE TABLE tbl_Alunos_am2(
					REGIAO varchar(5), 					
					SEXO varchar(2), 
					IDADE varchar(30), 
					ESCOLAR_MAE varchar(30),
					OCUPANTES_RESIDENCIA varchar(3),
					MORA_MAE varchar(3),
					COMPUTADOR_CASA varchar(2),
					INTERNET varchar(2),
					ALI_FEJAO varchar(2),
					REFRI varchar(2),
					USO_DROGA varchar(2),
					ATI_SEXUAL varchar(2),
					SAUDE_INFRA varchar(3)					
					);
                                                       CARGA DE DADOS--
--Selecionar os dados para análise 
INSERT INTO tbl_Alunos_am2(
   SELECT split_part(texto, ';' ,'3'), 
       split_part(texto, ';' ,'5'),
	   split_part(texto, ';' ,'7'),
	   split_part(texto, ';' ,'12'),
	   split_part(texto, ';' ,'13'), 
	   split_part(texto, ';' ,'10'), 
       split_part(texto, ';' ,'18'),
	   split_part(texto, ';' ,'19'),
	   split_part(texto, ';' ,'30'),
	   split_part(texto, ';' ,'35'),
	   split_part(texto, ';' ,'81'),
	   split_part(texto, ';' ,'97'),
	   split_part(texto, ';' ,'149')
   FROM pense2015Estudantes_am2);

                                                     --TRANFORMAÇÃO E CARGA DE DADOS--
   
--Criação de uma view para consumo do POWER BI 
CREATE VIEW vw_Pense_15am_2 AS
SELECT CASE WHEN REGIAO = '1' THEN 'Norte' 
			WHEN REGIAO = '2' THEN 'Nordeste'
			WHEN REGIAO = '3' THEN 'Sudeste'
			WHEN REGIAO = '4' THEN 'Sul'
			WHEN REGIAO = '5' THEN 'Centro-Oeste'
	   END AS REGIAO,
	   CASE WHEN SEXO = '1' THEN 'Masculino' ELSE 'Feminino' END AS SEXO,
	   CASE WHEN IDADE = '11' THEN '11 ou menos'
			WHEN IDADE = '12' THEN '12'
			WHEN IDADE = '13' THEN '13'
			WHEN IDADE = '14' THEN '14'
			WHEN IDADE = '15' THEN '15'
			WHEN IDADE = '16' THEN '16'
			WHEN IDADE = '17' THEN '17'
			WHEN IDADE = '18' THEN '18'
			WHEN IDADE = '19' THEN '19 ou mais'
	   END AS IDADE,
	   CASE WHEN ESCOLAR_MAE = '1' THEN 'Não estudou'
			WHEN ESCOLAR_MAE = '2' THEN 'Fundamental incompleto'
			WHEN ESCOLAR_MAE = '3' THEN 'Fundamental completo'
			WHEN ESCOLAR_MAE = '4' THEN 'Médio incompleto'
			WHEN ESCOLAR_MAE = '5' THEN 'Médio completo'
			WHEN ESCOLAR_MAE = '6' THEN 'Superior incompleto'
			WHEN ESCOLAR_MAE = '7' THEN 'Superior completo/pós graduação'
			WHEN ESCOLAR_MAE = '8' THEN 'Não soube'
		ELSE 'Não informado' END AS ESCOLAR_MAE,  
       OCUPANTES_RESIDENCIA,
	   CASE WHEN MORA_MAE = '1' THEN 'Sim' ELSE 'Não' END AS MORA_MAE,
	   CASE WHEN COMPUTADOR_CASA =  '1' THEN 'Sim' 
	        WHEN COMPUTADOR_CASA = '2' THEN 'Não'
	   ELSE 'Não informado' END AS COMPUTADOR_CASA,
	   CASE WHEN INTERNET = '1' THEN 'Sim' 
			WHEN INTERNET = '2' THEN 'Não' 
	   ELSE 'Não informado' END AS INTERNET,
	   CASE WHEN ALI_FEJAO = '1' THEN 'Não comi feijão nos últimos sete dias'
			WHEN ALI_FEJAO = '2' THEN '1 dia nos últimos sete dias'
			WHEN ALI_FEJAO = '3' THEN '2 dias nos últimos sete dias'
			WHEN ALI_FEJAO = '4' THEN '3 dias nos últimos sete dias'
			WHEN ALI_FEJAO = '5' THEN '4 dias nos últimos sete dias'
			WHEN ALI_FEJAO = '6' THEN '5 dias nos últimos sete dias'
			WHEN ALI_FEJAO = '7' THEN '6 dias nos últimos sete dias'
			WHEN ALI_FEJAO = '8' THEN '7 dias nos últimos sete dias'
			WHEN ALI_FEJAO = '8' THEN 'Todos os dias nos últimos sete dias'
	   ELSE 'Não informado' END AS ALI_FEJAO,
	   CASE WHEN REFRI = '1' THEN 'Não tomei refrigerante  nos últimos sete dias'
			WHEN REFRI = '2' THEN '1 dia nos últimos sete dias'
			WHEN REFRI = '3' THEN '2 dias nos últimos sete dias'
			WHEN REFRI = '4' THEN '3 dias nos últimos sete dias'
			WHEN REFRI = '5' THEN '4 dias nos últimos sete dias'
			WHEN REFRI = '6' THEN '5 dias nos últimos sete dias'
			WHEN REFRI = '7' THEN '6 dias nos últimos sete dias'
			WHEN REFRI = '8' THEN '7 dias nos últimos sete dias'
			WHEN REFRI = '8' THEN 'Todos os dias nos últimos sete dias'
	    ELSE 'Não informado' END AS REFRI,
	   CASE WHEN USO_DROGA = '1' THEN 'Sim' ELSE 'Não' END AS USO_DROGA,
	   CASE WHEN ATI_SEXUAL = '1' THEN 'Sim' 
			WHEN ATI_SEXUAL = '2' THEN 'Não' 
	   ELSE 'Não informado' END AS ATI_SEXUAL,
	   CASE WHEN SAUDE_INFRA = '-1' THEN 'Pulo no questionário'
	        WHEN SAUDE_INFRA = '1' THEN 'Posto de Saúde (Unidade Básica de Saúde)'
            WHEN SAUDE_INFRA = '2' THEN 'Consultório médico particular'
            WHEN SAUDE_INFRA = '3' THEN 'Consultório odontológico'
            WHEN SAUDE_INFRA = '4' THEN 'Consultório de outro profissional de saúde (fonoaudiólogo, psicólogo, etc.)'
            WHEN SAUDE_INFRA = '5' THEN 'Serviço de especialidades médicas ou Policlínica'
            WHEN SAUDE_INFRA = '6' THEN 'Pronto-socorro ou emergência'
            WHEN SAUDE_INFRA = '7' THEN 'Hospital'
			WHEN SAUDE_INFRA = '8' THEN 'Laboratório ou clínica para exames complementares'
			WHEN SAUDE_INFRA = '9' THEN 'Serviço de atendimento domiciliar'
			WHEN SAUDE_INFRA = '10' THEN  'Farmácia'
			WHEN SAUDE_INFRA = '9' THEN  'Outro'
	   ELSE 'Não utilizou' END AS SAUDE_INFRA
		
	   
FROM tbl_Alunos_am2;