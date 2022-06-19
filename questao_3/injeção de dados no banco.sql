insert into d_loja (ds_nome,ds_uf,ds_cidade,ds_empresa,nu_cep) values 
('Loja 1', 'CE', 'Fortaleza', 'empresa 1', '60000-000');

insert into d_pessoa (nm_pessoa) values ('Jonathan'), ('Rebeca');

insert into d_tempo (dt_ref, nu_semana, nu_mes, nu_trimestre, nu_semestre, nu_ano) values
('2020-01-22', 4, 1, 1, 1, 2020),
('2020-03-22', 4, 1, 1, 1, 2020);

insert into f_vendas (vl_venda, nu_venda, vl_lucro, vl_custo, d_tempo_id_tempo, d_pessoa_id_pessoa, d_loja_id_loja) values 
(1000, 1, 100, 900, 1, 1, 1),
(1000, 2, 100, 900, 2, 1, 1); 
