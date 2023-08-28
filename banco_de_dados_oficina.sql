-- criação do banco de dados para Oficina
create database machineShop;
use machineShop;

-- criar tabela cliente
create table clients(
		clientID int auto_increment primary key,
        Fname varchar(15),
        Minit varchar(10),
        Lname varchar(20),
        CPF char(11) not null,
        adress varchar(255),
        constraint unique_cpf_client unique (CPF)
);

-- criar tabela dados de veículos
create table vehicles(
		vehicleID int primary key,
        brand varchar(30),
        model varchar(30),
        yearVehicle int,
        plate char(7),
        clientID int references clients(clientID)
);

-- criar tabela ordens de serviço
create table serviceOrders (
		orderID int primary key,
        vehicleID int references vehicles(vehicleID),
        serviceDescription varchar(300),
        orderStatus enum ('Pendente', 'Em processamento', 'Finalizado')
);

-- criar tabela mecânicos
create table mechanics(
		mechanicID int auto_increment primary key,
        mechanicName varchar(50),
        specialty varchar(100)
);

-- criar tabela fornecedores
create table supplier(
		supplierID int auto_increment primary key,
        SocialName varchar(255) not null,
		CNPJ char(15) not null,
        contact char(11) not null,
        constraint unique_cnpj_supplier unique (CNPJ)
);

-- criar tabela pagamentos
create table payments(
		clientID int,
        paymentID int,
        typePayment enum('Boleto', 'Cartão', 'Dois cartões', 'Dinheiro'),
        primary key (clientID, paymentID)
);
