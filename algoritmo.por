programa {
  inclua biblioteca Texto --> t
  inclua biblioteca Util --> u

  funcao inicio() {
    cadeia expre 
    caracter cont[100], valor

    escreva("A expressão deve conter no máximo 100 caracteres \n")
    escreva("Utilize os seguintes caracteres (ATENÇÃO: não utilizar espaço): \n")
    escreva ("~: Negação \n")
    escreva(">: Condicional \n")
    escreva("<>: Bicondicional \n")
    escreva("V: Disjunção \n") 
    escreva("^: Conjunção \n")
    escreva("1: Verdadeiro \n")
    escreva("0: Falso \n\n")
    escreva ("Informe a expressão \n")
    leia (expre)
    
    // Quebra a expressão e substitui variáveis por valores
    para(inteiro i = 0; i < t.numero_caracteres(expre); i++) {
      cont[i] = t.obter_caracter(expre, i)

      // Ajuste da condição para aceitar letras (maiúsculas e minúsculas) e garantir que apenas as letras sejam substituídas
      se((cont[i]>='a' e cont[i]<='z' e cont[i]!='v') e (cont[i]>='A' e cont[i]>='Z' e cont[i]!='V')) {
        faca {
          escreva("Qual o valor de ", cont[i], " (1 para Verdadeiro, 0 para Falso): ")
          leia (valor)
        } enquanto (valor != '1' e valor != '0') 
        cont[i] = valor 
      }
    }
  }
// Até aqui funciona --------------------------------------------------------------------------------------------------------------

  // Função para o condicional (>)
  funcao caracter condicional(caracter valor1, caracter valor2) {
    se(valor1 == '1' e valor2 == '0') { retorne '0'} senao { retorne '1'}
  }

  // Função para o bicondicional (<>)
  funcao caracter bicondicional(caracter valor1, caracter valor2) {
    se(valor1==valor2) { retorne '1'} senao { retorne '0'}
  }

  // Função para a disjunção (V)
  funcao caracter disjuncao(caracter valor1, caracter valor2) {
    se(valor1 == '1' ou valor2 == '1') { retorne '1'} senao { retorne '0'}
  }

  // Função para a conjunção (^)
  funcao caracter conjuncao(caracter valor1, caracter valor2) {
    se(valor1 == '1' e valor2 == '1') { retorne '1'} senao { retorne '0'}
  }

  // --- FUNÇÃO LIMPAR MELHORADA ---
  funcao vazio limpando(caracter &vetor[]) {
    caracter temp[100]
    // Inicializa temp com espaços
    para(inteiro k=0; k<100; k++) { temp[k] = ' ' }

    inteiro j = 0
    para(inteiro i = 0; i < 100; i++) {
      se(vetor[i] != ' ' e vetor[i] != 0) {
        temp[j] = vetor[i]
        j++
      }
    }
      
    // Devolve para o original
    para(inteiro i = 0; i < 100; i++) {
      se(i < j) { vetor[i] = temp[i] } senao { vetor[i] = ' ' }
    }
  }
}