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
    // -------------------------------------------------------------
    // ETAPA 1: RESOLVER PARÊNTESES (DO MAIS INTERNO PARA O EXTERNO)
    // -------------------------------------------------------------
    logico tem_parenteses = verdadeiro
      
    enquanto(tem_parenteses) {
      tem_parenteses = falso
      inteiro fecha = -1
      inteiro abre = -1

      // Acha o primeiro ')'
      para(inteiro i = 0; i < 100; i++) {
        se(cont[i] == ')') {
          fecha = i
          tem_parenteses = verdadeiro
          pare 
        }
      }

      // Se achou ')', volta para achar o '('
      se(tem_parenteses) {
        para(inteiro i = fecha; i >= 0; i--) {
          se(cont[i] == '(') {
            abre = i
            pare
          }
        }
              
        // Resolve o que está DENTRO dos parênteses
        resolver_logica(cont, abre + 1, fecha - 1)

        // O resultado fica na posição logo após o '(', movemos para a posição do '('
        cont[abre] = cont[abre+1] 
        // Limpa o resto dos parênteses
        para(inteiro k = abre + 1; k <= fecha; k++) {
          cont[k] = ' '
        }
        limpando(cont) // Organiza o vetor
      }
    }

    // ---------------------------------------------------------
    // ETAPA 2: RESOLVER O RESTANTE (SEM PARÊNTESES)
    // ---------------------------------------------------------
    resolver_logica(cont, 0, 99) 
    limpando(cont)

    // EXIBE RESULTADO FINAL
    escreva("\n-----------------------------\n")
    escreva("Resultado Final: ", cont[0], "\n")
    escreva("-----------------------------\n")
  }

  // =============================================================
  // FUNÇÃO PRINCIPAL DE LÓGICA (Substitui a antiga 'conds')
  // =============================================================
  funcao resolver_logica(caracter &vetor[], inteiro inicio_fatia, inteiro fim_fatia) {     
    // 1. NEGAÇÃO (~)
    para(inteiro i = inicio_fatia; i <= fim_fatia; i++) {
      se(vetor[i] == '~') {
        inteiro alvo = i + 1
        enquanto(alvo <= fim_fatia e vetor[alvo] == ' ') { alvo++ } // Pula espaços
                
        se(vetor[alvo] == '0') { vetor[i] = '1' } 
        senao { vetor[i] = '0' }
                
        vetor[alvo] = ' ' // Apaga o número usado
      }
    }

    // 2. CONJUNÇÃO (^)
    para(inteiro i = inicio_fatia; i <= fim_fatia; i++) {
      se(vetor[i] == '^') { operar(vetor, i, '^', inicio_fatia, fim_fatia) }
    }

    // 3. DISJUNÇÃO (V)
    para(inteiro i = inicio_fatia; i <= fim_fatia; i++) {
      se(vetor[i] == 'V' ou vetor[i] == 'v') { operar(vetor, i, 'V', inicio_fatia, fim_fatia) }
    }

    // 4. CONDICIONAL (>)
    para(inteiro i = inicio_fatia; i <= fim_fatia; i++) {
      se(vetor[i] == '>') {
        // Verifica se é bicondicional (<>) checando o anterior
        logico eh_bicondicional = falso
        inteiro anterior = i - 1
        enquanto(anterior >= inicio_fatia e vetor[anterior] == ' ') { anterior-- }
  
        se(anterior >= inicio_fatia e vetor[anterior] == '<') { eh_bicondicional = verdadeiro }

        se (nao eh_bicondicional) {
          operar(vetor, i, '>', inicio_fatia, fim_fatia)
        }
      }
    }

    // 5. BICONDICIONAL (<>)
    para(inteiro i = inicio_fatia; i <= fim_fatia; i++) {
      se(vetor[i] == '<') {
        inteiro prox = i + 1
          enquanto(prox <= fim_fatia e vetor[prox] == ' ') { prox++ }
                
          se(prox <= fim_fatia e vetor[prox] == '>') {
            operar_bicondicional(vetor, i, prox, inicio_fatia, fim_fatia)
          }
        }
    }
  }

  // --- AJUDANTES PARA CALCULAR VIZINHOS ---
  funcao operar(caracter &vetor[], inteiro pos_op, caracter op, inteiro min, inteiro max) {
    inteiro esq = pos_op - 1
    inteiro dir = pos_op + 1
        
    enquanto(esq >= min e vetor[esq] == ' ') { esq-- }
    enquanto(dir <= max e vetor[dir] == ' ') { dir++ }

    // Segurança para não acessar índice inválido
    se (esq >= min e dir <= max) {
      caracter v1 = vetor[esq]
      caracter v2 = vetor[dir]
      caracter res = '0'
    
      se(op == '^') { res = conjuncao(v1, v2) }
      se(op == 'V') { res = disjuncao(v1, v2) }
      se(op == '>') { res = condicional(v1, v2) }
    
      vetor[esq] = res  
      vetor[pos_op] = ' ' 
      vetor[dir] = ' '
    }
  }

  funcao operar_bicondicional(caracter &vetor[], inteiro pos_menor, inteiro pos_maior, inteiro min, inteiro max) {
    inteiro esq = pos_menor - 1
    inteiro dir = pos_maior + 1
        
    enquanto(esq >= min e vetor[esq] == ' ') { esq-- }
    enquanto(dir <= max e vetor[dir] == ' ') { dir++ }

    se (esq >= min e dir <= max) {
      caracter v1 = vetor[esq]
      caracter v2 = vetor[dir]
            
      vetor[esq] = bicondicional(v1, v2)
      vetor[pos_menor] = ' '
      vetor[pos_maior] = ' '
      vetor[dir] = ' '
    }
  }

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
      se(i < j) { vetor[i] = temp[i] } senao { vetor[i] = ' ' }
    }
  }
}