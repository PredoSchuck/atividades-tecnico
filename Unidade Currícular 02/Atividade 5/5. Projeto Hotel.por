programa{
	inteiro opcaoMenu
	logico pararTudo = verdadeiro
	inteiro indiceHospede = 0
	cadeia nomeLido, nomeSalvo [10]
	cadeia cpfLido, cpfSalvo [10]
	inteiro diasLido, diasSalvo [10]
	caracter pararCadastro = 'S'
	inteiro indice = 0
	caracter opcaoAreaLazer
	inteiro despesas [10] = {0,0,0,0,0,0,0,0,0,0}, total [10]
	funcao inicio(){
		menu()
	}
	funcao menu(){
		faca{
			escreva("Bem-vindo ao menu, deseja seguir com qual procedimento?\n1 - Para cadastras hospedes;\n2 - Exibir hospdedes cadastrados;\n3 - Reservar área de lazer;\n4 - Calcular total a pagar;\n0 - sair.\n")
			leia(opcaoMenu)
			limpa()
			escolha(opcaoMenu){
				caso 0:
					escreva("Finalizando sistema.\n")
					pararTudo = falso
					pare
				caso 1:
					cadastroHospedes()
					pare
				caso 2:
					exibirHospedes()
					pare
				caso 3:
					areaLazer()
					pare
				caso 4:
					despesasTotais()
					escreva("O hóspede ", nomeSalvo[indice], " tem um gasto total de: ", resultados(), ".\n")
					pare
				caso contrario:
					escreva("Opção inválida!\n")
			}
		}
		enquanto(pararTudo == verdadeiro)
	}
	funcao cadastroHospedes(){
		se(indiceHospede >= 10){
			escreva("Quantidade máxima atingida.\n")
		}
		senao{
			faca{
				escreva("Digite o nome do hóspede:\n")
				leia(nomeLido)
				escreva("Digite o CPF do hóspede:\n")
				leia(cpfLido)
				escreva("Digite a quantidade de dias que o hóspede ficará no hotel: \n\n")
				leia(diasLido)
				limpa()
				escreva("Índice: ", indiceHospede, ".\nNome: ", nomeLido, ".\nCPF: ", cpfLido, ".\nQuantidade de dias: ", diasLido, ".\nConfirma as informações? Digite S ou N.\n")
				leia(pararCadastro)
				limpa()
				se(pararCadastro == 'S'){
					nomeSalvo[indiceHospede] = nomeLido
					cpfSalvo[indiceHospede] = cpfLido
					diasSalvo[indiceHospede] = diasLido
					indiceHospede++
					limpa()
				}
			}
			enquanto(pararCadastro == 'N')
		}
	}
	funcao exibirHospedes(){
		escreva("Hóspedes Cadastrados:\n")
		para(inteiro i = 0; i <= indiceHospede - 1; i++){
			escreva("Índice: ", i, ".\nNome: ", nomeSalvo[i], ".\nCPF: ", cpfSalvo[i], ".\nQuantidade de dias: ", diasSalvo[i], ".\n")
		}
	}
	funcao areaLazer(){
		escreva("Abaixo a lista de hóspedes.\n")
		para(inteiro i = 0; i <= indiceHospede - 1; i++){
			escreva("Índice: ", i, ".\nNome: ", nomeSalvo[i], ".\nCPF: ", cpfSalvo[i], ".\nQuantidade de dias: ", diasSalvo[i], ".\n")
		}
		escreva("Qual o índice do hóspede?\n")
		leia(indice)
		limpa()
		escreva("Deseja reservar qual área de lazer? Digite A para academia, S para salão de festas ou R para restaurante.\n")
		leia(opcaoAreaLazer)
		escolha(opcaoAreaLazer){
			caso 'A':
				despesas[indice] += 20
				escreva("O valor foi adicionado a sua conta.\n")
				pare
			caso 'S':
				despesas[indice] += 50
				escreva("O valor foi adicionado a sua conta.\n")
				pare
			caso 'R':
				despesas[indice] += 35
				escreva("O valor foi adicionado a sua conta.\n")
				pare
			caso contrario:
				escreva("Opção inválida!\n")
		}
	}
	funcao despesasTotais(){
		para(inteiro i = 0; i <= indiceHospede - 1; i++){
			escreva("Índice: ", i, ".\nNome: ", nomeSalvo[i], ".\nCPF: ", cpfSalvo[i], ".\nQuantidade de dias: ", diasSalvo[i], ".\n")
		}
		escreva("Digite o índice do hóspede.\n")
		leia(indice)
		resultados()
	}
	funcao inteiro resultados(){
		total[indice] = diasSalvo[indice] * 100 + despesas[indice]
		retorne total[indice]
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3259; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */