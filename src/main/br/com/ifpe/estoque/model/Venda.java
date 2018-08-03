package main.br.com.ifpe.estoque.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Roberto Alencar
 *
 */
@Entity
@Table(name = "venda")
public class Venda {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "dt_venda")
    private Date dataVenda;

    @Column(name = "valor_total")
    private double valorTotal;

    public int getId() {
	return id;
    }

    public void setId(int id) {
	this.id = id;
    }

    public Date getDataVenda() {
	return dataVenda;
    }

    public void setDataVenda(Date dataVenda) {
	this.dataVenda = dataVenda;
    }

    public double getValorTotal() {
	return valorTotal;
    }

    public void setValorTotal(double valorTotal) {
	this.valorTotal = valorTotal;
    }

}
