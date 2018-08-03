package main.br.com.ifpe.estoque.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import main.br.com.ifpe.estoque.model.ItemVenda;
import main.br.com.ifpe.estoque.model.Produto;
import main.br.com.ifpe.estoque.model.ProdutoDao;
import main.br.com.ifpe.estoque.model.Venda;
import main.br.com.ifpe.estoque.model.VendaDao;

@Controller
public class VendaController {

    @RequestMapping("/venda/addCarrinho")
    public String addCarrinho(@RequestParam("id") Integer id, @RequestParam("qtdCarrinho") Integer quantidade,
	    HttpSession session, Model model) {

	ProdutoDao dao = new ProdutoDao();
	Produto produto = dao.buscarPorId(id);

	ItemVenda itemVenda = new ItemVenda();
	itemVenda.setProduto(produto);
	itemVenda.setQuantidade(quantidade);

	List<ItemVenda> listaItens = (List<ItemVenda>) session.getAttribute("carrinho");
	if (listaItens == null) {
	    listaItens = new ArrayList<ItemVenda>();
	}

	listaItens.add(itemVenda);

	session.setAttribute("carrinho", listaItens);

	return "forward:viewCarrinho";
    }

    @RequestMapping("/venda/viewCarrinho")
    public String viewCarrinho(HttpSession session, Model model) {

	List<ItemVenda> listaItens = (List<ItemVenda>) session.getAttribute("carrinho");
	model.addAttribute("valorTotal", calcularValorTotal(listaItens));

	return "venda/exibirCarrinho";
    }

    @RequestMapping("/venda/save")
    public String save(HttpSession session, Model model) {

	List<ItemVenda> itens = (List<ItemVenda>) session.getAttribute("carrinho");
	if (itens != null && !itens.isEmpty()) {
	    double valorTotal = calcularValorTotal(itens);

	    Venda venda = new Venda();
	    venda.setValorTotal(valorTotal);
	    venda.setDataVenda(new Date());

	    VendaDao dao = new VendaDao();
	    dao.salvar(venda, itens);
	    model.addAttribute("mensagem", "Venda Concluída com Sucesso");

	    session.setAttribute("carrinho", null);

	    return "forward:/produto/list";
	}

	model.addAttribute("mensagem", "Não é possível realizar a venda, não existe itens no carrinho.");

	return "forward:/venda/viewCarrinho";
    }

    private double calcularValorTotal(List<ItemVenda> listaItens) {

	double valorTotal = 0;

	if (listaItens != null) {

	    for (ItemVenda itemVenda : listaItens) {
		valorTotal = valorTotal + (itemVenda.getProduto().getPrecoVenda() * itemVenda.getQuantidade());
	    }
	}

	return valorTotal;
    }
}
