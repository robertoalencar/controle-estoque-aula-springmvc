package test.br.com.ifpe.estoque.produto;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.Test;

import main.br.com.ifpe.estoque.model.CategoriaProduto;
import main.br.com.ifpe.estoque.model.CategoriaProdutoDao;

public class TesteCategoriaProduto {

    @Test
    public void testeIncluirCategoria() {

	CategoriaProdutoDao dao = new CategoriaProdutoDao();
	List<CategoriaProduto> lista;

	CategoriaProduto categoria = new CategoriaProduto();
	categoria.setCodigo("FG241");
	categoria.setDescricao("Gabinete");

	lista = dao.listar(null);
	int qtdAntes = lista.size();

	dao.salvar(categoria);

	lista = dao.listar(null);
	int qtdDepois = lista.size();

	assertEquals(qtdAntes + 1, qtdDepois);
    }
}
