
# Atividade Avaliativa - Git Colaborativo com Portugol

## 👥 Integrantes do grupo
- Natan Souza Rodrigues
- Geovani Santos De Brito
- João Antonio Amaral Blanco

## Objetivo
Desenvolver e corrigir colaborativamente um algoritmo em Portugol. O fluxo de trabalho consistiu em um membro (Natan) submeter um código inicial com erros, e os demais (Geovani e João) tentarem corrigi-lo e finalizá-lo sequencialmente, utilizando o Git com chaves SSH para versionamento.

## O Projeto: Calculadora Lógica Proposicional
O software desenvolvido é um interpretador de expressões lógicas. Ele permite que o usuário digite uma fórmula lógica complexa e calcula o valor verdade final (0 ou 1).

### Funcionalidades:
* **Parsing de Expressão:** Lê uma *string* contendo a expressão lógica.
* **Identificação de Variáveis:** Detecta letras (ex: `p`, `q`, `a`) e solicita ao usuário o valor verdade de cada uma (Verdadeiro/Falso).
* **Ordem de Precedência:** O algoritmo resolve a equação respeitando a hierarquia matemática correta:
    1.  Parênteses (dos mais internos para os externos);
    2.  Negação (`~`);
    3.  Conjunção (`^`) e Disjunção (`V`);
    4.  Condicional (`>`) e Bicondicional (`<>`).
* **Tratamento de Vetores:** Utiliza manipulação direta de memória (vetores por referência) para resolver a equação passo a passo sem perder a integridade dos dados.

### Operadores Suportados:
| Símbolo | Operação | Lógica |
| :---: | :--- | :--- |
| `~` | Negação | NÃO |
| `^` | Conjunção | E |
| `V` | Disjunção | OU |
| `>` | Condicional | Se... então |
| `<>` | Bicondicional | Se e somente se |

---

## ⚙️ Configuração do Git com Chave SSH
Para interagir com o repositório usando SSH (sem precisar de senha a cada `push` ou `pull`), cada membro precisa configurar sua chave. O processo é feito uma vez por computador.

**Não exponha sua chave privada (o arquivo `id_ed25519`) em hipótese alguma.**

### 1. Gerando a Chave SSH
Abra seu terminal (Git Bash no Windows, ou o terminal padrão no Linux/Mac) e execute:
```bash
# Use 'ed25519' para mais segurança. Troque pelo seu email do GitHub.
ssh-keygen -t ed25519 -C "seu_email@exemplo.com"

# Pressione Enter para aceitar o local padrão (~/.ssh/id_ed25519)
# Você pode definir uma senha (passphrase) para a chave ou deixar em branco (pressionando Enter)
````

### 2\. Adicionando a Chave ao SSH-Agent

O ssh-agent gerencia suas chaves.

```bash
# Inicia o agent em background
eval "$(ssh-agent -s)"

# Adiciona sua chave privada ao agent
ssh-add ~/.ssh/id_ed25519
```

### 3\. Adicionando a Chave Pública ao GitHub

Você precisa informar ao GitHub qual é a sua chave pública para que ele confie no seu computador.

```bash
# Copia o conteúdo da sua chave PÚBLICA para a área de transferência
cat ~/.ssh/id_ed25519.pub
# (Se 'cat' não funcionar, abra o arquivo ~/.ssh/id_ed25519.pub manualmente e copie todo o texto)
```

Agora, no GitHub:

1.  Vá para **Settings** (Configurações) no seu perfil.
2.  Clique em **SSH and GPG keys** no menu lateral.
3.  Clique em **New SSH key**.
4.  Dê um título (ex: "Meu Notebook Pessoal").
5.  Cole o conteúdo da chave (que você copiou do terminal) no campo "Key".
6.  Clique em **Add SSH key**.

### 4\. Usando o SSH para Clonar e Enviar

Ao clonar um repositório, certifique-se de usar a URL SSH, não a HTTPS. Ela sempre começa com `git@github.com:...`

```bash
# Exemplo de como clonar usando SSH
git clone git@github.com:masunsolar/git_portugol.git
```

A partir de agora, todos os comandos `git push`, `git pull` e `git fetch` para esse repositório usarão sua chave SSH.

-----

🛠️ Etapas realizadas por cada membro

### 1. Natan Souza Rodrigues (Commit Inicial)
- **Configuração:** Criou o repositório público no GitHub, configurou o Git local com chave SSH e adicionou Geovani e João como colaboradores.
- **Contribuição:** Criou o arquivo `algoritmo.por` e realizou o "Commit Inicial". Este commit continha a estrutura base do algoritmo, mas com **erros propositais** que serviram de ponto de partida para a atividade de correção dos demais membros.
- **Ação:** Fez o primeiro `git push` para o `main`.

### 2. Geovani Santos De Brito (Primeira Correção)
- **Configuração:** 
- **Contribuição:** 
- **Ação:** 
- **Mudanças:** [**Geovani deve descrever aqui o que ele corrigiu. Ex: Corrigida a lógica da função X, que estava retornando 'undefined'**]
- **Ação:**

### 3. João Antonio Amaral Blanco (Finalização)
- **Configuração: Preparei o ambiente e deixei o código pronto para os testes finais.** 
- **Contribuição: Revistei a lógica principal e finalizei partes que estavam incompletas.** 
- **Ação: Analisei os trechos que estavam causando erro e corrigi a estrutura da expressão lógica.** 
- **Mudanças:** [**Removi partes que estavam com erro, melhorei a função de limpar, reorganizei os operadores lógicos (>, <>, V, ^) e ajustei a substituição das variáveis por valores.**]
- **Ação: Finalizei a lógica do código e deixei tudo funcionando para a entrega.** 


---

## ⌨️ Comandos utilizados

Todos os comandos foram executados via terminal utilizando autenticação via chave SSH.

### Comandos de Natan (Criador)
```bash
# (Após criar o repositório no GitHub e configurar o SSH)
# Adiciona o repositório remoto
git clone git@github.com:masunsolar/git_portugol.git

# Abrindo a pasta clonada
cd ./git_portugol

# Adiciona os arquivos
git add .
git commit -m "Adiconando código base"

# Envia para o GitHub
git push

# Atualizando Branch local
git pull

# Modifiquei o repositório incial e adicionei os arquivos
git add .
git commit -m "Adicionando código base não funcional ainda"
```


## Observações

Cada etapa foi realizada por apenas um integrante por vez, respeitando a ordem de `pull`, `commit` e `push`, para simular um fluxo de trabalho sequencial e garantir a integridade do código no branch `main`.
