programa{
	funcao inicio(){
		// definindo varivel
		real convidados, cafe_total, agua_total, salgadinhos_total
		// definindo constantes
		const real cafe = 0.2
		const real agua = 0.5
		const real salgadinhos = 7.0
		// quantidade de convidades
		escreva("Qual a quantidade de convidados?\n")
		leia(convidados)
		// cálculos
		cafe_total = convidados * cafe
		agua_total = convidados * agua
		salgadinhos_total = convidados * salgadinhos
		// SE
		se(convidados >= 30 e convidados <= 350){
			escreva(cafe_total, " litro(s) de café, ", agua_total, " litro(s) de água ", salgadinhos_total, " salgadinhos")
		}
		// SENAO
		senao{
			escreva("Quantidade de convidados superior ou inferior à capacidade")
		}
	}
}





/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 622; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */