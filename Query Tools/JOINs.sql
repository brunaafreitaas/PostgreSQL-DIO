SELECT numero, nome FROM banco;
SELECT banco_numero, numero, nome FROM agencia;
SELECT numero, nome, email FROM cliente;
SELECT banco_numero, agencia_numero, numero, digito, cliente_numero FROM conta_corrente;
SELECT if, nome FROM tipo_transacoes
SELECT banco_numero, agencia_numero, conta_corrente_numero, conta_corrente_digito, cliente_numero, valor FROM cliente_transacoes;

SELECT count(1) FROM banco; --151
SELECT count(1) FROM agencia; --296 

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

SELECT banco.numero
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero
GROUP BY banco.numero;

SELECT count (distinct banco.numero)
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
LEFT JOIN agencia ON agencia.banco_numero = banco.numero;
-- 438

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
RIGHT JOIN agencia ON agencia.banco_numero = banco.numero;
--296

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
RIGHT JOIN agencia ON banco.numero = agencia.banco_numero;
-- 438

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
FULL JOIN agencia ON agencia.banco_numero = banco.numero;
--438 

--438 = todos os bancos e agencias 
--296 = todos os bancos com agencia