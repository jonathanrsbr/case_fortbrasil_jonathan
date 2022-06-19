CREATE DATABASE IF NOT EXISTS desafio;
USE desafio;

CREATE TABLE IF NOT EXISTS `d_tempo` (
  `id_tempo` INT NOT NULL AUTO_INCREMENT,
  `dt_ref` DATE NOT NULL,
  `nu_semana` INT NOT NULL,
  `nu_mes` INT NOT NULL,
  `nu_trimestre` INT NOT NULL,
  `nu_semestre` INT NOT NULL,
  `nu_ano` INT NOT NULL,
  PRIMARY KEY (`id_tempo`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `d_pessoa` (
  `id_pessoa` INT NOT NULL AUTO_INCREMENT,
  `nm_pessoa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_pessoa`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `d_loja` (
  `id_loja` INT NOT NULL AUTO_INCREMENT,
  `ds_nome` VARCHAR(45) NOT NULL,
  `ds_uf` VARCHAR(2) NOT NULL,
  `ds_cidade` VARCHAR(45) NOT NULL,
  `ds_empresa` VARCHAR(45) NOT NULL,
  `nu_cep` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_loja`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `f_vendas` (
  `id_venda` INT NOT NULL AUTO_INCREMENT,
  `vl_venda` DECIMAL(10,2) NOT NULL,
  `nu_venda` VARCHAR(45) NOT NULL,
  `vl_lucro` DECIMAL(10,2) NOT NULL,
  `vl_custo` DECIMAL(10,2) NOT NULL,
  `d_tempo_id_tempo` INT NOT NULL,
  `d_pessoa_id_pessoa` INT NOT NULL,
  `d_loja_id_loja` INT NOT NULL,
  PRIMARY KEY (`id_venda`),
  INDEX `fk_f_vendas_d_tempo_idx` (`d_tempo_id_tempo` ASC) VISIBLE,
  INDEX `fk_f_vendas_d_pessoa1_idx` (`d_pessoa_id_pessoa` ASC) VISIBLE,
  INDEX `fk_f_vendas_d_loja1_idx` (`d_loja_id_loja` ASC) VISIBLE,
  CONSTRAINT `fk_f_vendas_d_tempo`
    FOREIGN KEY (`d_tempo_id_tempo`)
    REFERENCES `d_tempo` (`id_tempo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_f_vendas_d_pessoa1`
    FOREIGN KEY (`d_pessoa_id_pessoa`)
    REFERENCES `d_pessoa` (`id_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_f_vendas_d_loja1`
    FOREIGN KEY (`d_loja_id_loja`)
    REFERENCES `d_loja` (`id_loja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;