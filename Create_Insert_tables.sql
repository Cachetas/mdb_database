create table endereco
(morada_porta varchar2(50) not null,
localidade varchar2(20) not null,
codigo_postal varchar2(8),
concelho varchar2(15) not null,
constraint ident_pk primary key (morada_porta));


insert all
into endereco (morada_porta, localidade, codigo_postal, concelho)
values ('Rua Santa Marta, Nº 1', 'Lisboa', '1200-568', 'Lisboa')
into endereco (morada_porta, localidade, codigo_postal, concelho)
values ('Avenida da Liberdade, Nº 5', 'Lisboa', '1200-238', 'Lisboa')
into endereco (morada_porta, localidade, codigo_postal, concelho)
values ('Travessa à Lapa, Nº 46 1ºDir', 'Lisboa', '1200-213', 'Lisboa')
into endereco (morada_porta, localidade, codigo_postal, concelho)
values ('Rua Áurea, Nº 10 2ªEsq', 'Lisboa', '1200-100', 'Lisboa')
into endereco (morada_porta, localidade, codigo_postal, concelho)
values ('Rua Instituto Industrial, Nº 11', 'Lisboa', '1200-200', 'Lisboa')
into endereco (morada_porta, localidade, codigo_postal, concelho)
values ('Rua do Miradouro, Nº 46 2ºDir', 'Lisboa', '1200-213', 'Lisboa')
into endereco (morada_porta, localidade, codigo_postal, concelho)
values ('Rua Infante Santo, Nº 55 4ªEsq', 'Lisboa', '1200-300', 'Lisboa')
into endereco (morada_porta, localidade, codigo_postal, concelho)
values ('Rua São Caetano, Nº 32 1ºDir', 'Lisboa', '1200-829', 'Lisboa')
into endereco (morada_porta, localidade, codigo_postal, concelho)
values ('Rua Buenos Aires, Nº 14', 'Lisboa', '1200-700', 'Lisboa')
select 1 from dual;

select * from endereco;


create table proprietario
(numero_cc int not null,
nome_de_proprietario varchar2(80) not null,
sexo varchar2(1) not null,
data_de_nascimento date not null,
idade int,
endereco varchar2(50) not null,
constraint prop_pk primary key (numero_cc),
constraint fk_ender foreign key (endereco) references endereco (morada_porta));


insert all
into proprietario (numero_cc, nome_de_proprietario, sexo, data_de_nascimento, endereco)
values (111111111, 'Ernesto Gomes', 'M', '04071988', 'Rua Santa Marta, Nº 1')
into proprietario (numero_cc, nome_de_proprietario, sexo, data_de_nascimento, endereco)
values (222222222, 'Maria da Silva', 'F', '01031982', 'Avenida da Liberdade, Nº 5')
into proprietario (numero_cc, nome_de_proprietario, sexo, data_de_nascimento, endereco)
values (333333333, 'Paula Saramago', 'F', '10301975', 'Travessa à Lapa, Nº 46 1ºDir')
into proprietario (numero_cc, nome_de_proprietario, sexo, data_de_nascimento, endereco)
values (444444444, 'Carolina Queiroz', 'F', '11021968', 'Rua Áurea, Nº 10 2ªEsq')
into proprietario (numero_cc, nome_de_proprietario, sexo, data_de_nascimento, endereco)
values (555555555, 'Lucas Carvalho', 'M', '07211996', 'Rua Instituto Industrial, Nº 11')
into proprietario (numero_cc, nome_de_proprietario, sexo, data_de_nascimento, endereco)
values (666666666, 'Fátima Figueira', 'F', '03211980', 'Rua do Miradouro, Nº 46 2ºDir')
into proprietario (numero_cc, nome_de_proprietario, sexo, data_de_nascimento, endereco)
values (777777777, 'Francisco Oliveira', 'M', '05131978', 'Rua Infante Santo, Nº 55 4ªEsq')
into proprietario (numero_cc, nome_de_proprietario, sexo, data_de_nascimento, endereco)
values (888888888, 'Pedro Martins', 'M', '07281976', 'Rua São Caetano, Nº 32 1ºDir')
into proprietario (numero_cc, nome_de_proprietario, sexo, data_de_nascimento, endereco)
values (999999999, 'Manuela Pessoa', 'F', '09211958', 'Rua Buenos Aires, Nº 14')
select 1 from dual;


select * from proprietario;


create table numero_de_contato
(numero_telefone int not null,
numero_fixo int,
numero_cc int not null,
constraint num_pk primary key (numero_telefone, numero_cc),
constraint fk_tel foreign key (numero_cc) references proprietario (numero_cc));


insert all
into numero_de_contato (numero_telefone, numero_fixo, numero_cc)
values (900000001, 200000001, 111111111)
into numero_de_contato (numero_telefone, numero_fixo, numero_cc)
values (900000002, 200000002, 222222222)
into numero_de_contato (numero_telefone, numero_fixo, numero_cc)
values (900000003, '', 333333333)
into numero_de_contato (numero_telefone, numero_fixo, numero_cc)
values (900000004, '', 444444444)
into numero_de_contato (numero_telefone, numero_fixo, numero_cc)
values (900000005, '', 555555555)
into numero_de_contato (numero_telefone, numero_fixo, numero_cc)
values (900000006, 200000006, 666666666)
into numero_de_contato (numero_telefone, numero_fixo, numero_cc)
values (900000007, '', 777777777)
into numero_de_contato (numero_telefone, numero_fixo, numero_cc)
values (900000008, 200000008, 888888888)
into numero_de_contato (numero_telefone, numero_fixo, numero_cc)
values (900000009, 200000009, 999999999)
select 1 from dual;

select * from numero_de_contato;


create table veiculo
(cc_proprietario int not null,
matricula varchar2(10)not null,
chassis varchar2(10) not null,
cor varchar2(15) not null,
modelo varchar2 (30),
categoria varchar2(15),
ano_de_fabricacao int not null,
constraint mat_pk primary key (matricula),
constraint fk_prop foreign key (cc_proprietario) references proprietario (numero_cc));


insert all
into veiculo (cc_proprietario, matricula, chassis, cor, modelo, categoria, ano_de_fabricacao)
values (111111111, '68 JDF 93', 'BJD872BDFJ', 'Preto', '100100', '55', '2018')
into veiculo (cc_proprietario, matricula, chassis, cor, modelo, categoria, ano_de_fabricacao)
values (222222222, '24 DYB 23', 'NDOW74BDUS', 'Branco', '200200', '44', '2015')
into veiculo (cc_proprietario, matricula, chassis, cor, modelo, categoria, ano_de_fabricacao)
values (333333333, '93 CNR 19', 'MSJDBOW803', 'Vermelho', '400400', '11', '2017')
into veiculo (cc_proprietario, matricula, chassis, cor, modelo, categoria, ano_de_fabricacao)
values (444444444, '48 NMK 84', '8ENWDNEBAS', 'Roxo', '600600', '33', '2018')
into veiculo (cc_proprietario, matricula, chassis, cor, modelo, categoria, ano_de_fabricacao)
values (555555555, '52 RTA 90', 'MCBSP8EBW0', 'Preto', '100100', '55', '2004')
into veiculo (cc_proprietario, matricula, chassis, cor, modelo, categoria, ano_de_fabricacao)
values (666666666, '83 HRK 99', 'NVHS93EIEB', 'Azul', '500500', '22', '2016')
into veiculo (cc_proprietario, matricula, chassis, cor, modelo, categoria, ano_de_fabricacao)
values (777777777, '19 YRN 00', 'QPEEBSI39S', 'Branco', '300300', '77', '2018')
into veiculo (cc_proprietario, matricula, chassis, cor, modelo, categoria, ano_de_fabricacao)
values (888888888, '47 BEN 14', 'LIDBSYROSW', 'Preto', '300300', '77', '2014')
into veiculo (cc_proprietario, matricula, chassis, cor, modelo, categoria, ano_de_fabricacao)
values (999999999, '89 NSO 12', 'XBEYW93BDY', 'Gris', '700700', '66', '2017')
select 1 from dual;

select * from veiculo;


create table agente_de_transito
(codigo_de_agente varchar2(10) not null,
nome_do_agente varchar2(20) not null,
data_de_contratacao date not null,
tempo_de_servico varchar2(10),
constraint codi_pk primary key (codigo_de_agente));


insert all
into agente_de_transito (codigo_de_agente, nome_do_agente, data_de_contratacao, tempo_de_servico)
values ('AAA', 'Ana', '09211979', '39 anos')
into agente_de_transito (codigo_de_agente, nome_do_agente, data_de_contratacao, tempo_de_servico)
values ('BBB', 'António', '02052008', '10 anos')
into agente_de_transito (codigo_de_agente, nome_do_agente, data_de_contratacao, tempo_de_servico)
values ('CCC', 'Paula', '05271999', '19 anos')
into agente_de_transito (codigo_de_agente, nome_do_agente, data_de_contratacao, tempo_de_servico)
values ('DDD', 'Diego', '11302010', '8 anos')
into agente_de_transito (codigo_de_agente, nome_do_agente, data_de_contratacao, tempo_de_servico)
values ('EEE', 'Isaac', '06152015', '3 anos')
into agente_de_transito (codigo_de_agente, nome_do_agente, data_de_contratacao, tempo_de_servico)
values ('FFF', 'Teresa', '09012007', '11 anos')
into agente_de_transito (codigo_de_agente, nome_do_agente, data_de_contratacao, tempo_de_servico)
values ('HHH', 'Mário', '09222000', '18 anos')
into agente_de_transito (codigo_de_agente, nome_do_agente, data_de_contratacao, tempo_de_servico)
values ('III', 'Pedro', '05152010', '8 anos')
into agente_de_transito (codigo_de_agente, nome_do_agente, data_de_contratacao, tempo_de_servico)
values ('JJJ', 'Patrícia', '03012016', '2 anos')
select 1 from dual;

select * from agente_de_transito;


create table local
(codigo_de_local varchar2(10) not null,
velocidade_permitida int not null,
posicao_geografica varchar2(20) not null,
constraint codloc_pk primary key (codigo_de_local));

insert all
into local (codigo_de_local, velocidade_permitida, posicao_geografica)
values ('D1', 40, 'Marqués de Pombal')
into local (codigo_de_local, velocidade_permitida, posicao_geografica)
values ('D2', 30, 'Baixa')
into local (codigo_de_local, velocidade_permitida, posicao_geografica)
values ('D3', 40, 'Alfama')
into local (codigo_de_local, velocidade_permitida, posicao_geografica)
values ('D4', 40, 'Oriente')
into local (codigo_de_local, velocidade_permitida, posicao_geografica)
values ('D5', 40, 'Arroios')
into local (codigo_de_local, velocidade_permitida, posicao_geografica)
values ('D6', 50, 'Cascais')
into local (codigo_de_local, velocidade_permitida, posicao_geografica)
values ('D7', 30, 'Martin Moniz')
into local (codigo_de_local, velocidade_permitida, posicao_geografica)
values ('D8', 30, 'Santos')
into local (codigo_de_local, velocidade_permitida, posicao_geografica)
values ('D9', 20, 'Mouraria')
select 1 from dual;

select * from local;


create table infracao
(numero int generated always as identity minvalue 1 start with 1 increment by 1 order,
codigo_de_infracao varchar2(50) not null,
valor_da_coima float not null,
codigo_agente varchar2(10) not null,
codigo_local varchar2(10) not null,
constraint nume_pk primary key (numero),
constraint fk_cod_age foreign key (codigo_agente)
references agente_de_transito (codigo_de_agente),
constraint fk_codloc foreign key (codigo_local)
references local (codigo_de_local));


insert into infracao (codigo_de_infracao, valor_da_coima, codigo_agente, codigo_local)
values ('Não parar no STOP', 200, 'CCC', 'D2');
insert into infracao (codigo_de_infracao, valor_da_coima, codigo_agente, codigo_local)
values ('Excesso de velocidade', 300, 'EEE', 'D5');
insert into infracao (codigo_de_infracao, valor_da_coima, codigo_agente, codigo_local)
values ('Avançar no vermelho', 490.90, 'AAA', 'D3');
insert into infracao (codigo_de_infracao, valor_da_coima, codigo_agente, codigo_local)
values ('Estacionamento para minusválidos', 600, 'FFF', 'D1');
insert into infracao (codigo_de_infracao, valor_da_coima, codigo_agente, codigo_local)
values ('Não parar no STOP', 200, 'CCC', 'D1');
insert into infracao (codigo_de_infracao, valor_da_coima, codigo_agente, codigo_local)
values ('Excesso de velocidade', 300, 'EEE', 'D2');
insert into infracao (codigo_de_infracao, valor_da_coima, codigo_agente, codigo_local)
values ('Excesso de velocidade', 490.90, 'AAA', 'D2');
insert into infracao (codigo_de_infracao, valor_da_coima, codigo_agente, codigo_local)
values ('Estacionamento para minusválidos', 600, 'FFF', 'D3');
insert into infracao (codigo_de_infracao, valor_da_coima, codigo_agente, codigo_local)
values ('Uso do telemóvel enquenato dirige', 1000, 'III', 'D9');
insert into infracao (codigo_de_infracao, valor_da_coima, codigo_agente, codigo_local)
values ('Não parar no STOP', 200, 'BBB', 'D6');

select * from infracao;


create table comete_ocorrencia
(infracao_id int not null,
matricula varchar2(10)not null,
velocidade_do_veiculo int not null,
data_de_ocorrencia date not null,
hora_de_ocorrencia varchar2(5) not null,
constraint comete_pk primary key (infracao_id, matricula, data_de_ocorrencia, hora_de_ocorrencia),
constraint fk_matri foreign key (matricula)
references veiculo (matricula),
constraint fk_iden foreign key (infracao_id)
references infracao (numero));


insert all
into comete_ocorrencia (infracao_id, matricula, velocidade_do_veiculo, data_de_ocorrencia, hora_de_ocorrencia)
values (1, '89 NSO 12', 67, '11262018', '10:25')
into comete_ocorrencia (infracao_id, matricula, velocidade_do_veiculo, data_de_ocorrencia, hora_de_ocorrencia)
values (2, '47 BEN 14', 64, '05182018', '00:45')
into comete_ocorrencia (infracao_id, matricula, velocidade_do_veiculo, data_de_ocorrencia, hora_de_ocorrencia)
values (3, '19 YRN 00', 84, '07052018', '19:55')
into comete_ocorrencia (infracao_id, matricula, velocidade_do_veiculo, data_de_ocorrencia, hora_de_ocorrencia)
values (4, '83 HRK 99', 46, '04032018', '17:40')
into comete_ocorrencia (infracao_id, matricula, velocidade_do_veiculo, data_de_ocorrencia, hora_de_ocorrencia)
values (5, '52 RTA 90', 58, '12262018', '13:25')
into comete_ocorrencia (infracao_id, matricula, velocidade_do_veiculo, data_de_ocorrencia, hora_de_ocorrencia)
values (6, '48 NMK 84', 73, '03212018', '22:32')
into comete_ocorrencia (infracao_id, matricula, velocidade_do_veiculo, data_de_ocorrencia, hora_de_ocorrencia)
values (7, '68 JDF 93', 90, '05162018', '20:50')
into comete_ocorrencia (infracao_id, matricula, velocidade_do_veiculo, data_de_ocorrencia, hora_de_ocorrencia)
values (8, '52 RTA 90', 59, '09192018', '18:20')
into comete_ocorrencia (infracao_id, matricula, velocidade_do_veiculo, data_de_ocorrencia, hora_de_ocorrencia)
values (9, '83 HRK 99', 63, '02202018', '10:42')
into comete_ocorrencia (infracao_id, matricula, velocidade_do_veiculo, data_de_ocorrencia, hora_de_ocorrencia)
values (10, '19 YRN 00', 75, '06082018', '09:55')
select 1 from dual;

select * from comete_ocorrencia;


select * from proprietario inner join numero_de_contato on proprietario.numero_cc = numero_de_contato.numero_cc;
select * from proprietario inner join endereco on proprietario.endereco= endereco.morada_porta;
select * from proprietario inner join veiculo on proprietario.numero_cc = veiculo.cc_proprietario;
select * from comete_ocorrencia inner join infracao on comete_ocorrencia.infracao_id = infracao.numero;
select * from comete_ocorrencia inner join veiculo on comete_ocorrencia.matricula = veiculo.matricula;
select * from agente_de_transito inner join infracao on agente_de_transito.codigo_de_agente = infracao.codigo_agente;
select * from local inner join infracao on local.codigo_de_local = infracao.codigo_local;