package main.br.com.ifpe.estoque.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import main.br.com.ifpe.estoque.model.CategoriaProduto;
import main.br.com.ifpe.estoque.model.CategoriaProdutoDao;

@Controller
public class CategoriaProdutoController {

    @RequestMapping("/categoriaProduto/add")
    public String adicionarCategoriaProduto() {

	return "categoriaProduto/incluirCategoriaProduto";
    }

    @RequestMapping("/categoriaProduto/save")
    public String save(@Valid CategoriaProduto categoriaProduto, BindingResult result, Model model) {

	if (result.hasErrors()) {
	    return "forward:add";
	}

	CategoriaProdutoDao dao = new CategoriaProdutoDao();
	dao.salvar(categoriaProduto);

	model.addAttribute("mensagem", "Categoria de Produto Incluída com Sucesso");
	return "categoriaProduto/incluirCategoriaProduto";
    }

    @RequestMapping("/categoriaProduto/list")
    public String listarCategoriaProduto(Model model) {

	CategoriaProdutoDao dao = new CategoriaProdutoDao();
	List<CategoriaProduto> listaCategoriaProduto = dao.listar(null);
	model.addAttribute("listaCategoriaProduto", listaCategoriaProduto);

	return "categoriaProduto/listarCategoriaProduto";
    }

    @RequestMapping("/categoriaProduto/filter")
    public String filtrarCategoriaProduto(CategoriaProduto categoriaProduto, Model model) {

	CategoriaProdutoDao dao = new CategoriaProdutoDao();
	List<CategoriaProduto> listaCategoriaProduto = dao.listar(categoriaProduto);
	model.addAttribute("listaCategoriaProduto", listaCategoriaProduto);

	return "categoriaProduto/listarCategoriaProduto";
    }

    @RequestMapping("/categoriaProduto/edit")
    public String edit(@RequestParam("id") Integer id, Model model) {

	CategoriaProdutoDao dao = new CategoriaProdutoDao();
	CategoriaProduto categoriaProduto = dao.buscarPorId(id);
	model.addAttribute("categoriaProduto", categoriaProduto);

	return "categoriaProduto/alterarCategoriaProduto";
    }

    @RequestMapping("/categoriaProduto/update")
    public String update(CategoriaProduto categoriaProduto, Model model) {

	CategoriaProdutoDao dao = new CategoriaProdutoDao();
	dao.alterar(categoriaProduto);
	model.addAttribute("mensagem", "Categoria de Produto Alterada com Sucesso !");

	return "forward:list";
    }

    @RequestMapping("/categoriaProduto/delete")
    public String delete(@RequestParam("id") Integer id, Model model) {

	CategoriaProdutoDao dao = new CategoriaProdutoDao();
	dao.remover(id);
	model.addAttribute("mensagem", "Categoria de Produto Removida com Sucesso");

	return "forward:list";
    }

}
