package br.com.ifpe.estoque.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.estoque.model.CategoriaProduto;
import br.com.ifpe.estoque.model.CategoriaProdutoDao;

public class CategoriaProdutoConverter implements Converter<String, CategoriaProduto> {

    public CategoriaProduto convert(String id) {

	CategoriaProdutoDao dao = new CategoriaProdutoDao();
	return dao.buscarPorId(Integer.valueOf(id));
    }
}
