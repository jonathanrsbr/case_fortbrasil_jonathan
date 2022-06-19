-- 3.1 - Todas as compras realizadas no mês de janeiro de 2020 em lojas do estado do Ceará (CE)
-- 	ID da pessoa
-- 	Nome da pessoa
-- 	Data Referência da Venda
-- 	Valor da Venda
select d_pessoa.id_pessoa as idPessoa, d_pessoa.nm_pessoa as cliente, d_tempo.dt_ref as dataRef, f_vendas.vl_venda as valor from f_vendas 
left join d_pessoa on f_vendas.d_pessoa_id_pessoa = d_pessoa.id_pessoa
left join d_tempo on f_vendas.d_tempo_id_tempo = d_tempo.id_tempo
where month(d_tempo.dt_ref) = 1;


-- 3.2 - Quantidade de compras por cliente no mês de março de 2020
-- 	ID da pessoa
-- 	Quantidade de compras
select d_pessoa.id_pessoa as idPessoa, count(f_vendas.id_venda) as qtdCompras from f_vendas
left join d_pessoa on f_vendas.d_pessoa_id_pessoa = d_pessoa.id_pessoa
left join d_tempo on f_vendas.d_tempo_id_tempo = d_tempo.id_tempo
where month(d_tempo.dt_ref) = 3
group by d_pessoa.id_pessoa;


-- 3.3 – Todos os clientes que não fizeram compras no mês de março de 2020
select d_pessoa.id_pessoa from d_pessoa 
where d_pessoa.id_pessoa not in (
	select d_pessoa.id_pessoa from f_vendas
	left join d_pessoa on f_vendas.d_pessoa_id_pessoa = d_pessoa.id_pessoa
	left join d_tempo on f_vendas.d_tempo_id_tempo = d_tempo.id_tempo
	where month(d_tempo.dt_ref) = 3
	group by d_pessoa.id_pessoa
);


-- 3.4 – Data da última compra por cliente
select d_pessoa.id_pessoa as idCliente, max(d_tempo.dt_ref) as CompraMaisRecente from f_vendas
join d_tempo on f_vendas.d_tempo_id_tempo = d_tempo.id_tempo
join d_pessoa on f_vendas.d_pessoa_id_pessoa = d_pessoa.id_pessoa
group by d_pessoa.id_pessoa;