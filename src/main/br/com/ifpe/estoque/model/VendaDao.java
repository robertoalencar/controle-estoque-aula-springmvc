package main.br.com.ifpe.estoque.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * @author Roberto Alencar
 */
public class VendaDao {

    protected static final String PERSISTENCE_UNIT = "estoque";

    public void salvar(Venda venda, List<ItemVenda> itens) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	manager.getTransaction().begin();

	//Salva a Venda
	manager.persist(venda);

	for (ItemVenda itemVenda : itens) {
	    
	    //Salva o item da venda
	    itemVenda.setVenda(venda);
	    manager.persist(itemVenda);

	    //Debita a quantidade vendida do produto
	    Produto produto = itemVenda.getProduto();
	    produto.setQuantidade(produto.getQuantidade() - itemVenda.getQuantidade());
	    manager.merge(produto);
	}

	manager.getTransaction().commit();
	manager.close();
	factory.close();
    }
}
