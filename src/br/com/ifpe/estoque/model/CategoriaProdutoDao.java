package br.com.ifpe.estoque.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 * @author Roberto Alencar
 */
public class CategoriaProdutoDao {

    protected static final String PERSISTENCE_UNIT = "estoque";

    public void salvar(CategoriaProduto obj) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();

	manager.getTransaction().begin();
	manager.persist(obj);
	manager.getTransaction().commit();

	manager.close();
	factory.close();
    }

    public List<CategoriaProduto> listar(CategoriaProduto categoriaProduto) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	Query query = null;

	String codigo = categoriaProduto != null ? categoriaProduto.getCodigo() : "";
	String descricao = categoriaProduto != null ? categoriaProduto.getDescricao() : "";

	if (!codigo.equals("") && descricao.equals("")) {
	    query = manager.createQuery("FROM CategoriaProduto WHERE codigo LIKE :paramCodigo ORDER BY descricao");
	    query.setParameter("paramCodigo", "%" + codigo + "%");
	} else if (codigo.equals("") && !descricao.equals("")) {
	    query = manager
		    .createQuery("FROM CategoriaProduto WHERE descricao LIKE :paramDescricao ORDER BY descricao");
	    query.setParameter("paramDescricao", "%" + descricao + "%");
	} else if (!codigo.equals("") && !descricao.equals("")) {
	    query = manager.createQuery(
		    "FROM CategoriaProduto WHERE codigo LIKE :paramCodigo AND descricao LIKE :paramDescricao ORDER BY descricao");
	    query.setParameter("paramCodigo", "%" + codigo + "%");
	    query.setParameter("paramDescricao", "%" + descricao + "%");
	} else {
	    query = manager.createQuery("FROM CategoriaProduto ORDER BY descricao");
	}

	List<CategoriaProduto> lista = query.getResultList();

	manager.close();
	factory.close();

	return lista;
    }

    public CategoriaProduto buscarPorId(int id) {

	CategoriaProduto obj = null;

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	obj = manager.find(CategoriaProduto.class, id);
	manager.close();
	factory.close();

	return obj;
    }

    public void alterar(CategoriaProduto categoriaProduto) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();

	manager.getTransaction().begin();
	manager.merge(categoriaProduto);
	manager.getTransaction().commit();

	manager.close();
	factory.close();
    }

    public void remover(int id) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();
	CategoriaProduto categoriaProduto = manager.find(CategoriaProduto.class, id);

	manager.getTransaction().begin();
	manager.remove(categoriaProduto);
	manager.getTransaction().commit();

	manager.close();
	factory.close();
    }
}
