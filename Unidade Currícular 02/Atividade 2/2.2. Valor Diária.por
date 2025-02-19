programa{
	funcao inicio(){
		// variaveis
		inteiro  hospedes, quarto, diaria, total_diarias = 0, menor_diaria = 0, maior_diaria = 0
		// qual a quantidade de hospedes para ser realizado na repeticao
		escreva("Qual a quantidade de hóspedes?\n")
		leia(hospedes)
		// PARA cada hospede repita
		para(inteiro i = 1; i <= hospedes; i++){
			// informe o quarto e a diaria
			escreva("Informe o quarto e o valor da diária.\n")
			leia(quarto, diaria)
			// informando o quarto e a dioria
			escreva("Quarto ", quarto, ": R$ ", diaria,"\n")
			// fazendo o calculo do total das diarias
			total_diarias += diaria
			// SE diaria menor que menor_diaria, nao sendo 0, guarde o valor
			se(diaria < menor_diaria ou menor_diaria == 0){
				menor_diaria = diaria
			}
			// SE diaria maior que maior_diaria, nao sendo 0, guarde o valor
			se(diaria > maior_diaria ou maior_diaria == 0){
				maior_diaria = diaria
			}
		}
		// escreva o resultado
		escreva("Total de diárias: R$ ", total_diarias, "\nMenor valor: R$ ", menor_diaria, "\nMaior valor: R$ ", maior_diaria)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 344; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */