programa{
	funcao inicio(){
		// variaveis
		cadeia nome
		inteiro idade = 0, diaria = 0, total = 0, gratuidade = 0, meia = 0
		caracter continuar = 'S'
		// preço da diaria
		escreva("Informe o valor padrão da diária.\n")
		leia(diaria)
		// usando ENQUANTO para identificar com nome e idade
		enquanto(continuar == 'S'){
			escreva("Digite o nome e a idade do hóspede, respectivamente.\n")
			leia(nome, idade)
			// SE idade for menor que 4 possui gratuidade
			se(idade <= 4){
				escreva(nome, " possui gratuidade\n")
				gratuidade += 1
			}
			// SE idade for maior que 80 paga meia
			se(idade >= 80){
				escreva(nome, " paga meia\n")
				meia += 1
				total += (diaria/2)
			}
			// SENAO paga total
			senao{
				total += diaria
			}
			// quer continuar?
			escreva("Quer continuar? Digite S ou N.\n")
			leia(continuar)
		}
		// escreva o resultado
		escreva("Total de hospedagens: R$ ", total, "; ", gratuidade, " gratuidade(s); ", meia, " meia(s)")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 861; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */