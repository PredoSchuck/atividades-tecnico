programa{
	funcao inicio(){
		// declarando variaveis
		caracter quarto[10] = {'L', 'L', 'L', 'L', 'L', 'L', 'L', 'L', 'L', 'L'}, estado, continuar = 'S'
		inteiro numero
		// PARA cada vez o código iniciar seja todos 'L'
		para(inteiro i = 0; i <= 9; i++){
			quarto[i] = 'L'
		}
		// FACA sempre a repetica ENQUANTO for poistiva a resposta
		faca{
			// numero do quarto
			escreva("Qual o número do quarto? Digite um número de 1 a 10.\n")
			leia(numero)
			// estado do quarto
			escreva("O quarto está livre ou ocupado? Digite L ou O.\n")
			leia(estado)
			// sempre que o numero for digitado, diminuir ele em 1 para se encaixar nos vetores
			numero += -1
			// SE o número for menor que 1 ou maior que 10, será comunicado que
			se(numero < 0 ou numero > 9){
				escreva("Esse quarto não existe!\n")
			}
			// SENAO SE o estado solicitado for 'L' E o anterior for 'L', será comunicado que
			senao se(estado == 'L' e quarto[numero] == 'L'){
				escreva("O quarto já está vazio.\n")
			}
			// SENAO SE o estado solicitado for 'O' E o anterior for 'L', será comunicado que
			senao se(estado == 'O' e quarto[numero] == 'L'){
				quarto[numero] = 'O'
				escreva("O quarto foi ocupado.\n")
			}
			// SENAO SE o estado solicitado for 'L' E o anterior for 'O', será comunicado que
			senao se(estado == 'L' e quarto[numero] == 'O'){
				quarto[numero] = 'L'
				escreva("O quarto foi liberado.\n")
			}
			// SENAO SE o estado soliciatado for 'O' E o anterior for 'O', será comunicado que
			senao se(estado == 'O' e quarto[numero] == 'O'){
				escreva("O quarto já está ocupado.\n")
			}
			// depois, deseja continuar?
			escreva("Você deseja continuar? Digite S ou N.\n")
			leia(continuar)
		}
		// ENQUANTO o "continuar" for 'S', recomeçe
		enquanto(continuar == 'S')
		// PARA cada quarto, será comunicado que
		para(inteiro i = 1; i <= 10; i++){
			escreva(i, "-", quarto[i - 1], "\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1821; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */