package br.com.ifpe.estoque.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.estoque.model.Produto;
import br.com.ifpe.estoque.model.ProdutoDao;

@Controller
public class ProdutoController {

    @RequestMapping("/produto/add")
    public String adicionarProduto() {

	return "produto/incluirProduto";
    }

    @RequestMapping("/produto/save")
    public String save(Produto produto) {

	ProdutoDao dao = new ProdutoDao();
	dao.salvar(produto);
	return "produto/incluirProdutoSucesso";
    }
}