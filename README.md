# RISC-V: Simulação

Este repositório contém os arquivos Verilog, simulação e documentação para a implementação de um processador RISC-V de 32 bits de ciclo único, desenvolvido para a disciplina CSI509 - Organização e Arquitetura de Computadores II da Universidade Federal de Ouro Preto (UFOP), campus João Monlevade.

## Visão Geral do Projeto

O objetivo do projeto é projetar, implementar em Verilog e validar um processador funcional capaz de executar um subconjunto específico de instruções do padrão RISC-V. A arquitetura segue o modelo clássico de ciclo único apresentado no livro "Organização e Projeto de Computadores II" de Patterson e Hennessy.

---

## Conjunto de Instruções Implementado (Grupo 07)

O processador foi projetado para executar o seguinte conjunto de instruções:

| Tipo        | Instrução | Descrição                                    |
|-------------|-----------|----------------------------------------------|
| **Tipo-R** | `add`     | Adição de dois registradores.                |
|             | `and`     | Operação AND bit a bit.                      |
|             | `or`      | Operação OR bit a bit.                       |
|             | `srl`     | Deslocamento lógico para a direita.          |
| **Tipo-I** | `lb`      | Carrega um byte da memória (com extensão de sinal). |
| **Tipo-S** | `sb`      | Armazena um byte na memória.                 |
| **Tipo-B** | `beq`     | Desvio condicional se operandos forem iguais. |

---

## Estrutura do Repositório

O projeto está organizado com os seguintes arquivos Verilog:

* **`riscv_processor_g7.v`**: O módulo top-level que interconecta todos os outros componentes.
* **Módulos de Controle:**
    * `control_g7.v`: Unidade de controle principal.
    * `alu_control_g7.v`: Unidade de controle da ALU.
* **Módulos do Caminho de Dados:**
    * `pc.v`: Contador de Programa (PC).
    * `reg_file.v`: Banco de 32 registradores.
    * `alu_g7.v`: Unidade Lógica e Aritmética.
* **Módulos de Memória:**
    * `instruction_memory.v`: Memória de instruções.
    * `data_memory_byte.v`: Memória de dados com suporte a acesso de bytes.
* **Simulação:**
    * `testbench_g7.v`: Testbench para simulação e verificação funcional.
    * `riscv_defines_g7.v`: Arquivo com definições de constantes (opcodes, etc.).
    * `meu_programa_g7.hex`: Um pequeno programa em hexadecimal usado para o teste.
* **Documentação:**
    * `relatorio.pdf`: Documento final do projeto em formato SBC.
    * `README.md`: Este arquivo.

---

## Como Simular o Projeto

Para compilar e simular este projeto, você precisará ter o **Icarus Verilog** e o **GTKWave** instalados e configurados no PATH do sistema.

1.  **Clone o Repositório:**
    ```bash
    git clone [URL_DO_SEU_REPOSITORIO]
    cd [NOME_DA_PASTA]
    ```

2.  **Compile todos os módulos Verilog:**
    Abra um terminal na pasta do projeto e execute o seguinte comando:
    ```bash
    iverilog -o processador.out testbench_g7.v riscv_processor_g7.v pc.v instruction_memory.v control_g7.v reg_file.v alu_control_g7.v alu_g7.v data_memory_byte.v
    ```
    Se nenhum erro for exibido, um arquivo `processador.out` será gerado.

3.  **Execute a Simulação:**
    Este comando irá rodar a simulação e gerar o arquivo de forma de onda.
    ```bash
    vvp processador.out
    ```

4.  **Visualize as Formas de Onda:**
    Abra o arquivo de resultado com o GTKWave para analisar os sinais.
    ```bash
    gtkwave waveform.vcd
    ```

---

## Documentação

A documentação completa do projeto, incluindo a descrição detalhada da implementação, análise dos resultados e considerações finais, está disponível no arquivo `relatorio.pdf`, formatado seguindo as normas da Sociedade Brasileira de Computação (SBC).

---

**Autores:**
* Laila Ferraz Souza Lima
