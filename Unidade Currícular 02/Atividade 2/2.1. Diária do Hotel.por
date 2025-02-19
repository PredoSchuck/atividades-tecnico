programa{
	funcao inicio(){
		// variaveis
		inteiro diaria, dias 
		// FACA a repeticao
		faca{
			// definindo a diaria e os dias
			escreva("Informe o valor da diária e a quantidade de dias, respectivamente.\n")
			leia(diaria, dias)
			// SE diaria igual ou menor que 0 OU dias igual ou menor que 0 OU dias maior que 30 ESCREVA e comece de novo
			se(diaria <= 0 ou dias <= 0 ou dias > 30)
				escreva("Valor inválido.\n")
			}
			// SE falhar comece ENQUANTO e ESCREVA
		enquanto(diaria <= 0 ou dias <= 0 ou dias > 30)
			escreva("Fim do Programa")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 473; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */