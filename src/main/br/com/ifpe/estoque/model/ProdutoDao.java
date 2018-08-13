package main.br.com.ifpe.estoque.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 * @author Roberto Alencar
 */
public class ProdutoDao {

    protected static final String PERSISTENCE_UNIT = "estoque";

    public void salvar(Produto obj) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();

	manager.getTransaction().begin();
	manager.persist(obj);
	manager.getTransaction().commit();

	manager.close();
	factory.close();
    }

    public List<Produto> listar(String descricao, Integer idCategoria) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Query query = null;

	if ((descricao != null && !descricao.equals("")) && idCategoria == null) {
	    query = manager.createQuery("FROM Produto WHERE descricao LIKE :paramDescricao ORDER BY descricao");
	    query.setParameter("paramDescricao", "%" + descricao + "%");
	} else if ((descricao == null || descricao.equals("")) && idCategoria != null) {
	    query = manager
		    .createQuery("FROM Produto WHERE categoriaProduto.id LIKE :paramCategoria ORDER BY descricao");
	    query.setParameter("paramCategoria", idCategoria);
	} else if ((descricao != null && !descricao.equals("")) && idCategoria != null) {
	    query = manager.createQuery(
		    "FROM Produto WHERE categoriaProduto.id LIKE :paramCategoria AND descricao LIKE :paramDescricao ORDER BY descricao");
	    query.setParameter("paramCategoria", idCategoria);
	    query.setParameter("paramDescricao", "%" + descricao + "%");
	} else {
	    query = manager.createQuery("FROM Produto ORDER BY descricao");
	}

	List<Produto> lista = query.getResultList();

	manager.close();
	factory.close();

	return lista;
    }

    public Produto buscarPorId(int id) {

	Produto obj = null;

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	obj = manager.find(Produto.class, id);
	manager.close();
	factory.close();

	return obj;
    }

    public void alterar(Produto produto) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();

	manager.getTransaction().begin();
	manager.merge(produto);
	manager.getTransaction().commit();

	manager.close();
	factory.close();
    }

    public void remover(int id) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Produto produto = manager.find(Produto.class, id);

	manager.getTransaction().begin();
	manager.remove(produto);
	manager.getTransaction().commit();

	manager.close();
	factory.close();
    }

}
