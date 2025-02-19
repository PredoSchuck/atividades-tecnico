programa{
	// COMO FAZER COM QUE OS HOSPEDES SEJAM CADASTRADOS
	funcao inicio(){
		// declarando variaveis
		inteiro opcao, ordem = 0
		cadeia hospedes[7], nome, nome_pesquisa
		logico parar = verdadeiro, encontrado = falso
		// FACA a repeticao
		faca{
			// Digite a opção a ser executada
			escreva("Digite, 1 para cadastrar; 2 para pesquisar; 3 para sair.\n")
			leia(opcao)
			escolha(opcao){
				// CASO seja para cadastrar
				caso 1:
					// SE ordem for igual ou menor que, realize
					se(ordem <= 6){
						escreva("Digite o nome do hóspede a ser cadastrado:\n")
						leia(nome)
						hospedes[ordem] = nome
						ordem++
						escreva("Hóspede cadastrado.\n")
					}
					// SENAO, realize
					senao{
						escreva("Quantidade máxima de hóspedes atingida.")
					}
					pare
				// CASO seja para pesquisar
				caso 2:
					// digite o nome do hospede
					escreva("Digite o nome do hóspede a ser pesquisado:\n")
					leia(nome_pesquisa)
					para(inteiro i = 0; i <= 6; i++){
						se(hospedes[i] == nome_pesquisa){
							escreva("Hóspede, ", nome_pesquisa, " foi encontrado no índice ", i, ".\n")
							// SE encontrado for verdadeiro, parar de pesquisar
							encontrado = verdadeiro
						}
					}
					se(encontrado == falso){
						escreva("Hóspede não foi encontrado")
					}
					pare
				// CASO seja para encerrar
				caso 3:
					parar = falso
					pare
				// CASO a opção não seja de 1 a 3
				caso contrario:
					escreva("Opção inválida!\n")
			}
		}
		// ENQUANTO parar for verdadeiro continuará a funcionar
		enquanto(parar == verdadeiro)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 697; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */