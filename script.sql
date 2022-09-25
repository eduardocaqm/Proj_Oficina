create database oficina;

use oficina;

-- criar tabela cliente
create table clientes(
	idCliente int auto_increment primary key,
    Nome varchar(10),
    CPF char(11) not null,
    Tel char(12) not null,
    email varchar(35),
    idPagamentos int,
    constraint fk_pagamentos foreign key (Pagamentos) references pagamentos(idPagamentos),
    constraint unique_cpf_client unique(CPF)
);
-- criar tabela pagamento
create table pagamentos(
	idCliente int,
    idPagamentos int,
    CNome varchar(20),
    DataVali varchar(5),
    NumCartão varchar(10),
    primary key (idCliente, idPagamentos),
    constraint fk_idCliente foreign key (Clientes) references Clientes(idClientes)
);
-- criar tabela produto
create table OS(
	idOS int auto_increment primary key,
	DataOs varchar(10) not null,
    OSStatus enum('confirmado', 'Em processo', 'Cancelado') default 'Processando',
    Valor float(20) not null,
    DataFim char(11) not null,
    Description varchar(15),
    constraint unique_cpf_client unique(CPF)
);
-- criar tabela pedido
create table Mecanico(
	idMecanico int auto_increment primary key,
    MNome varchar (30),
    Endereço varchar(30),
    Especialidade varchar(30)
);
-- criando tabela estoque
create table serviço(
	idServiço int auto_increment primary key,
    SValor float(10) default 0,
    SDesc varchar(50) not null
);

-- criando tabela fornecedor
create table peças(
	idPeças int auto_increment primary key,
    PValor char(15)
);
create table revisão(
	idRevisão int auto_increment primary key,
    RValor char(15)
);
create table peçasOS(
	idPos int,
    idOSp int,
    Pqtd int default 0,
    primary key (idPos, idOSp),
    constraint fk_peças_OS foreign key (idPos) references os (idOS),
    constraint fk__peças_peças foreign key (idOSp) references peças(idPeças)
);

create table mecanicoOS(
	idMos int,
    idOSm int,
    primary key (idMos, idOSm),
    constraint fk_mecanico_OS foreign key (idMos) references os (idOS),
    constraint fk__mecanico_mecanico foreign key (idOSm) references mecanico(idMecanico)
);

create table serviçoOS(
	idSos int,
    idOSs int,
    primary key (idSos, idOSs),
    constraint fk_serviço_OS foreign key (idSos) references os (idOS),
    constraint fk__serviço_serviço foreign key (idOSs) references serviço(idServiço)
);