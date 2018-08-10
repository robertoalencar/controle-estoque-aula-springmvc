package main.br.com.ifpe.estoque.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExemplosAula {

    @RequestMapping("/aula/jquery")
    public String exemplosAulaJquery() {

	return "aulaJQuery/exemplos";
    }
}
