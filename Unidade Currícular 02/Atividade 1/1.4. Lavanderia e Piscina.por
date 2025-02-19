programa{
	funcao inicio(){
		// defininddo variaveis
		caracter local
		cadeia maior_de_idade, exames
		inteiro kg_roupa, kg_total, idade
		// definindo constantes
		const inteiro kg_menor_que = 20
		const inteiro kg_maior_que = 15
		// definindo local
		escreva("Digite para onde deseja ir. L para lavanderia e P para piscina\n")
		leia(local)
		// ESCOLHA
		escolha(local){
				// CASO LAVANDERIA
			caso 'L':
				escreva("Você escolheu Lavanderia\nQuantos KG de roupas serão lavados?\n")
				leia(kg_roupa)
				// SE kg da roupa for igual ou menor que 10
				se(kg_roupa <= 10){
					kg_total = kg_roupa * kg_menor_que
					escreva("O valor da lavagem foi R$", kg_total)
				}
				// SENAO kg da roupa for igual ou menor que 10
				senao{
					kg_total = kg_roupa * kg_maior_que
					escreva("O valor da lavagem foi R$", kg_total)
				}
				pare
				// CASO PISCINA
			caso 'P':
				escreva("Você escolheu piscina\nQual sua idade?\n")
				leia(idade)
				// SE a idade for igual ou menor 17
				se(idade <= 17){
					escreva("Você está acompanhado por um responsável maior de idade?\nOs seus exames estão em dia?\nResponda respectivamente SIM ou NAO\n")
					leia(maior_de_idade, exames)
					// SE é maior de idade e está com seus exames em dia
					se(maior_de_idade == "SIM" e exames == "SIM"){
						escreva("Aproveite a piscina!")
					}
					// SE é maior de idade e não está com seus exames em dia
					se(maior_de_idade == "SIM" e exames == "NAO"){
						escreva("Faça seus exames!")
					}
					// SE não é maior de idade e está com seus exames em dia
					se(maior_de_idade == "NAO" e exames == "SIM"){
						escreva("Providencie um acompanhante maior de idade!")
					}
					// SE não é maior de idade e não está com seus exames em dia
					se(maior_de_idade == "NAO" e exames == "NAO"){
						escreva("Providencie um acomapanhante maior de idade e faça seus exames!")
					}
				}
				senao{
					escreva("Os seus exames estão em dia?\nDigite SIM ou NAO\n")
					leia(exames)
					se(exames == "SIM"){
						escreva("Aproveite a piscina!")
					}
					senao{
						escreva("Faça seus exames!")
					}
				}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1798; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */