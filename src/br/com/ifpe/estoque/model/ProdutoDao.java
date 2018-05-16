package br.com.ifpe.estoque.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ProdutoDao {

    protected static final String PERSISTENCE_UNIT = "estoque";

    public void salvar(Object obj) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();

	manager.getTransaction().begin();
	manager.persist(obj);
	manager.getTransaction().commit();

	manager.close();
	factory.close();
    }

    public List<Produto> listar() {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	List<Produto> lista = manager.createQuery("FROM Produto ORDER BY descricao").getResultList();

	manager.close();
	factory.close();

	return lista;
    }

}
