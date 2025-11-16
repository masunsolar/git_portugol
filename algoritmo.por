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
    escreva("V: Disjunção \n") // Corrigi o nome do operador 'V' para 'Disjunção'
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
        cont[i] = valor // Substitui a variável pela entrada de valor
      }
    }//ta funcionando
    //coisar parenteszesxezs
    para(inteiro i = 0; i < t.numero_caracteres(expre); i++) {
      se(cont[i]=='('){
        para(inteiro j=i; j<t.numero_caracteres(expre); j++){
          conds(cont, j)
          cont=limpando(cont, expre)
          escreva(cont, "\n\n")
        }
        cont=limpando(cont, expre)
        escreva(cont, "\n\n")
      }
    }// falta arrumar

    // Avaliação da expressão
    para(inteiro i = 0; i < t.numero_caracteres(expre); i++) {
      se(i>0){
        se(cont[i-1]=='~'){
          se(cont[i]=='1'){
            cont[i]=' '
            cont[i-1]='0'
          }senao{
            cont[i]=' '
            cont[i-1]='1'
          }
        }
        cont=limpando(cont, expre)
        escreva(cont, "\n\n")
      }
    }

    para(inteiro i = 0; i < t.numero_caracteres(expre); i++) {
      caracter valor1, valor2

      conds(cont, i)

      cont=limpando(cont, expre)
      escreva(cont, "\n\n")
    }
  
    // Exibe o resultado
    escreva("Resultado da expressão: ")
    para(inteiro i = 0; i < t.numero_caracteres(expre); i++) {
      se(cont[i] != ' ' e cont[i]!= 'u') {
        escreva(cont[i]) // Corrigi para imprimir apenas os caracteres relevantes
      }
    }
    escreva("\n")
  }

  funcao caracter conds(caracter cont[], inteiro i){
    caracter valor1, valor2

      se(cont[i] == '>') {
        valor1 = cont[i-1]
        valor2 = cont[i+1]
        
        cont[i+1] = condicional(valor1, valor2) // Ajuste para chamada da função de condicional
        cont[i-1]=' '
        cont[i]= ' '
      }

      se(cont[i] == '<') {
        valor1 = cont[i-1]
        valor2 = cont[i+1]
        cont[i+2] = bicondicional(valor1, valor2)
        cont[i+1] = ' ' // Remove o segundo caractere '>'
        cont[i-1]=' '
        cont[i]= ' '
      }

      se(cont[i] == 'V' ou cont[i] == 'v') {
        valor1 = cont[i-1]
        valor2 = cont[i+1]
        cont[i+1] = disjuncao(valor1, valor2) // Ajuste para disjunção
        cont[i-1]=' '
        cont[i]= ' '
      }

      se(cont[i] == '^') {
        valor1 = cont[i-1]
        valor2 = cont[i+1]
        cont[i+1] = conjuncao(valor1, valor2) // Ajuste para conjunção
        cont[i-1]=' '
        cont[i]= ' '
      }
      retorne cont
  }

  // Função para o condicional (>)
  funcao caracter condicional(caracter valor1, caracter valor2) {
   se(valor1 == '1' e valor2 == '0') {
      retorne '0'
    } senao {
      retorne '1'
    }
  }

  // Função para o bicondicional (<>)
  funcao caracter bicondicional(caracter valor1, caracter valor2) {
    se((valor1 == '1' e valor2 == '1') ou (valor1 == '0' e valor2 == '0')) {
      retorne '1'
    } senao {
      retorne '0'
    }
  }

  // Função para a disjunção (V)
  funcao caracter disjuncao(caracter valor1, caracter valor2) {
    se(valor1 == '1' ou valor2 == '1') {
      retorne '1'
    } senao {
      retorne '0'
    }
  }

  // Função para a conjunção (^)
  funcao caracter conjuncao(caracter valor1, caracter valor2) {
    se(valor1 == '1' e valor2 == '1') {
      retorne '1'
    } senao {
      retorne '0'
    }
  }

  funcao caracter limpando(caracter cont[], cadeia expre){
    caracter limp[100]
    inteiro j=0
    para(inteiro i = 0; i < t.numero_caracteres(expre); i++) {
      se(cont[i] != ' ') {
        limp[j]=cont[i]
        j++
      }
    }
    retorne limp
  }
}