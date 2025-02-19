programa{
	funcao inicio(){
		// definindo variaveis
		real garcons, horas, valor_evento
		// denfinindo constante
		const real preco = 10.5
		// definindo a quantidade de garçons
		escreva("Qual a quantidade de garçons no evento?\n")
		leia(garcons)
		// definindo a quantidade de horas
		escreva("Quantas horas terá o evento?\n")
		leia(horas)
		// multiplicando tudo
		valor_evento = garcons * horas * preco
		// mostrando o valor
		escreva("O valor a ser pago para os garçons será ", valor_evento)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 506; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */