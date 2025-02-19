programa{
	funcao inicio(){
		// definindo variavies
		inteiro convidados, cadeiras
		// definindo constantes
		const inteiro alfa = 150
		const inteiro beta = 350
		// quantidade de convidados
		escreva("Qual a quantidade de convidados?\n")
		leia(convidados)
		// SE no somente auditorio alfa
		se(convidados >= 0 e convidados <= 150){
			escreva("Use o auditório Alfa")
	}
		// SE no auditorio alfa com cadeiras a mais
		se(convidados >= 151 e convidados <= 220){
			escreva("Use o auditório Alfa \n")
			cadeiras = convidados - alfa
			escreva("Inclua mais ", cadeiras, " cadeiras")
		}
		// SE no auditorio beta
		se(convidados >= 221 e convidados <= 350){
			escreva("Use o auditório Beta")
		}
		// senao geral
		senao{
			escreva("Número de convidados inválido")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 239; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */