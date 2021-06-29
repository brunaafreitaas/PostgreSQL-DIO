SELECT numero, nome, ativo
FROM banco;

CREATE OR REPLACE VIEW vw_banco AS (
	SELECT numero, nome, ativo
	FROM banco
);

SELECT numero, nome, ativo
FROM vw_banco;

CREATE OR REPLACE VIEW vw_banco_2 (banco_numero, banco_nome, banco_ativo) AS (
	SELECT numero, nome, ativo
	FROM banco
);

SELECT banco_numero, banco_nome, banco_ativo
FROM vw_banco_2;

INSERT INTO vw_banco_2 (banco_numero, banco_nome, banco_ativo)
VALUES (52, 'Banco Nacional', TRUE);

SELECT banco_numero, banco_nome, banco_ativo FROM vw_banco_2 WHERE banco_numero = 52;
SELECT numero, nome, ativo FROM banco WHERE numero = 52;

UPDATE vw_banco_2 SET banco_ativo = FALSE WHERE banco_numero = 52;

DELETE FROM vw_banco_2 WHERE banco_numero = 52;

CREATE OR REPLACE TEMPORARY VIEW vw_agencia AS (
	SELECT nome FROM agencia
);

SELECT nome FROM vw_agencia;
-- essa view fica visível apenas nessa query tool

CREATE OR REPLACE VIEW vw_bancos_ativos AS (
	SELECT numero, nome, ativo
	FROM banco
	WHERE ativo IS TRUE
)WITH LOCAL CHECK OPTION;

INSERT INTO vw_bancos_ativos (numero, nome, ativo) VALUES (52, 'Banco Nacional', FALSE);

CREATE OR REPLACE VIEW vw_bancos_com_a AS (
	SELECT numero, nome, ativo
	FROM vw_bancos_ativos
	WHERE nome ILIKE 'a%'
)WITH LOCAL CHECK OPTION;

SELECT numero, nome, ativo FROM vw_bancos_com_a;

INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (52, 'Alfa Bank', TRUE);



