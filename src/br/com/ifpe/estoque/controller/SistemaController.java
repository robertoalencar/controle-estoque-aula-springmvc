package br.com.ifpe.estoque.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Roberto Alencar
 *
 */
@Controller
public class SistemaController {

    @RequestMapping("olaMundoSpring")
    public String olaMundo() {

	System.out.println("Executando a lógica com Spring MVC.");
	return "olaMundo";
    }

}
