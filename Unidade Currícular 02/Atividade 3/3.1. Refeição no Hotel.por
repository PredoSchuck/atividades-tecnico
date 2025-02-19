programa{
	// incluindo biblioteca matematica
	inclua biblioteca Matematica --> mat
	funcao inicio(){
		// declarando variavel vetor
		inteiro valor [4], arredondamento
		real pagar
		// PARA cada vez que o valor da mesa seja escrito se reescreva
		para(inteiro i = 1; i <= 4; i++){
			escreva("Informe o valor da mesa ", i, ":\n")
			leia(valor[i - 1])
		}
		// PARA cada vez que o valor a ser pago seja escrito
		para(inteiro i = 1; i <= 4; i++){
			// SE o valor ser menor que 30,99 não paga nada
			se(valor[i - 1] <= 30.99){
				escreva("Mesa ", i, " nada a pagar!\n")
			}
			// SENAO paga o restante
			senao{
				// arredondando o valor a ser pago
				pagar = mat.arredondar(valor[i - 1] - 30.99, 2)
				escreva("Mesa ", i, " precisa pagar: R$ ", pagar, ".\n")
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 655; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */