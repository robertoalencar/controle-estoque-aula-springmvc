package br.com.ifpe.estoque.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author Roberto Alencar
 *
 */
@Entity
@Table(name = "produto")
public class Produto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "categoria_id")
    private CategoriaProduto categoriaProduto;

    @Column
    private String codigo;

    @Column
    private String descricao;

    @Column(name = "preco_custo")
    private double precoCusto;

    @Column(name = "preco_venda")
    private double precoVenda;

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column
    private Date garantia;

    @Column
    private int quantidade;

    @Column
    private String imagem;

    public int getId() {
	return id;
    }

    public void setId(int id) {
	this.id = id;
    }

    public CategoriaProduto getCategoriaProduto() {
	return categoriaProduto;
    }

    public void setCategoriaProduto(CategoriaProduto categoriaProduto) {
	this.categoriaProduto = categoriaProduto;
    }

    public String getCodigo() {
	return codigo;
    }

    public void setCodigo(String codigo) {
	this.codigo = codigo;
    }

    public String getDescricao() {
	return descricao;
    }

    public void setDescricao(String descricao) {
	this.descricao = descricao;
    }

    public double getPrecoCusto() {
	return precoCusto;
    }

    public void setPrecoCusto(double precoCusto) {
	this.precoCusto = precoCusto;
    }

    public double getPrecoVenda() {
	return precoVenda;
    }

    public void setPrecoVenda(double precoVenda) {
	this.precoVenda = precoVenda;
    }

    public Date getGarantia() {
	return garantia;
    }

    public void setGarantia(Date garantia) {
	this.garantia = garantia;
    }

    public int getQuantidade() {
	return quantidade;
    }

    public void setQuantidade(int quantidade) {
	this.quantidade = quantidade;
    }

    public String getImagem() {
	return imagem;
    }

    public void setImagem(String imagem) {
	this.imagem = imagem;
    }

}
