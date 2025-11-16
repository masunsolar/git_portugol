# Atividade Avaliativa - Git Colaborativo com Portugol

##  Integrantes do grupo
- Natan Souza Rodrigues
- Geovani Santos De Brito
- João Antonio Amaral Blanco

## 🎯 Objetivo
Desenvolver e corrigir colaborativamente um algoritmo em Portugol. O fluxo de trabalho consistiu em um membro (Natan) submeter um código inicial com erros, e os demais (Geovani e João) tentarem corrigi-lo e finalizá-lo sequencialmente, utilizando o Git com chaves SSH para versionamento.

## 🛠️ Etapas realizadas por cada membro

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
- **Configuração:** 
- **Contribuição:** 
- **Ação:** 
- **Mudanças:** [**João deve descrever aqui o que ele corrigiu ou finalizou. Ex: Finalizada a função Y e corrigido o loop principal que estava em 'undefined'**]
- **Ação:** 

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
