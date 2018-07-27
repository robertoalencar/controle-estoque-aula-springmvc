package main.br.com.ifpe.estoque.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "categoria_produto")
public class CategoriaProduto {

    @Id
    private int id;

    @NotEmpty(message="O código deve ser preenchido")
    @Size(min = 5, max = 5, message="O código deve deve ter um tamanho de 5 caracteres")
    @Column
    private String codigo;

    @NotEmpty(message="A descrição deve ser preenchida")
    @Size(max = 50, message="A descrição deve ter um tamanho máximo de 50 caracteres")
    @Column
    private String descricao;

    public int getId() {
	return id;
    }

    public void setId(int id) {
	this.id = id;
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

}
