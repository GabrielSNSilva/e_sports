package br.usjt.arqsw.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.validation.constraints.NotNull;

@Entity
public class Carrinho {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@NotNull
	@JoinColumn(name="nome")
	private String nome;
	
	@NotNull
	@JoinColumn(name="marca")
	private String marca;
	
	@NotNull
	@Column(name="preco")
	private int preco;
	
	@Column(name="imagem")
	private String imagem;

	@NotNull
	@Column(name="quantidade")
	private int quantidade;

	@NotNull
	@Column(name="total")
	private double total;
	
	@NotNull
	@Column(name="id_produto")
	private int id_produto;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public int getPreco() {
		return preco;
	}

	public void setPreco(int preco) {
		this.preco = preco;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public int getId_produto() {
		return id_produto;
	}

	public void setId_produto(int id_produto) {
		this.id_produto = id_produto;
	}

	@Override
	public String toString() {
		return "Carrinho [id=" + id + ", nome=" + nome + ", marca=" + marca + ", preco=" + preco + ", imagem=" + imagem
				+ ", quantidade=" + quantidade + ", total=" + total + ", id_produto=" + id_produto + "]";
	}

}
