# sql-data-warehouse-project
Construindo um moderno data warehouse com SQL Server, incluindo processos de ETL e modelagem de dados
# Projeto de Data Warehouse e Analytics

Bem-vindo ao repositório do Projeto de Data Warehouse e Analytics! 🚀

Este projeto demonstra uma solução abrangente de data warehousing e analytics, desde a construção do data warehouse até a geração de insights práticos (actionable insights). Desenvolvido como um projeto de portfólio, ele destaca as melhores práticas de mercado em engenharia de dados e analytics.

## 🏗️ Arquitetura de Dados

A arquitetura de dados deste projeto segue as camadas Bronze, Silver e Gold da **Arquitetura Medalhão (Medallion Architecture)**:
<img width="907" height="434" alt="arquiteturadedadosDWH" src="https://github.com/user-attachments/assets/d7a0df4e-7437-4841-8772-ebb02aac8e28" />

*   **Camada Bronze:** Armazena os dados brutos exatamente como vêm dos sistemas de origem. Os dados são ingeridos a partir de arquivos CSV para o banco de dados SQL Server.
*   **Camada Silver:** Esta camada inclui processos de limpeza, padronização e normalização de dados para prepará-los para análise.
*   **Camada Gold:** Contém os dados prontos para o negócio, modelados em um esquema estrela (*star schema*) necessário para relatórios e análises.

## 📖 Visão Geral do Projeto

Este projeto envolve:

*   **Arquitetura de Dados:** Criação de um Data Warehouse Moderno utilizando as camadas Bronze, Silver e Gold.
*   **Pipelines de ETL:** Extração, transformação e carregamento de dados dos sistemas de origem para o data warehouse.
*   **Modelagem de Dados:** Desenvolvimento de tabelas de fatos (*fact*) e dimensões (*dimension*) otimizadas para consultas analíticas.
*   **Analytics e Relatórios:** Criação de relatórios e painéis baseados em SQL para gerar insights estratégicos.

🎯 Este repositório é um excelente recurso para profissionais e estudantes que desejam demonstrar experiência em:

*   Desenvolvimento SQL (SQL Development)
*   Arquitetura de Dados (Data Architecture)
*   Engenharia de Dados (Data Engineering)
*   Desenvolvimento de Pipelines de ETL
*   Modelagem de Dados (Data Modeling)
*   Análise de Dados (Data Analytics)

## 🛠️ Links e Ferramentas Importantes:

*   **Datasets:** Acesso ao conjunto de dados do projeto (arquivos .csv).
*   **SQL Server Express:** Servidor leve para hospedar seu banco de dados SQL.
*   **SQL Server Management Studio (SSMS):** Interface gráfica (GUI) para gerenciar e interagir com os bancos de dados.
*   **Repositório Git:** Configuração de uma conta e repositório no GitHub para gerenciar, versionar e colaborar no seu código com eficiência.
*   **Draw.io:** Para desenhar a arquitetura de dados, modelos, fluxos e diagramas.
*   **Notion:** Modelo de projeto e etapas para acompanhar todas as fases e tarefas.

## 🚀 Requisitos do Projeto

### 1. Construindo o Data Warehouse (Engenharia de Dados)

#### Objetivo
Desenvolver um data warehouse moderno utilizando o SQL Server para consolidar os dados de vendas, permitindo relatórios analíticos e tomadas de decisão informadas.

#### Especificações
*   **Fontes de Dados:** Importar dados de dois sistemas de origem (ERP e CRM) fornecidos em formato CSV.
*   **Qualidade dos Dados:** Limpar e resolver problemas de qualidade dos dados antes da análise.
*   **Integração:** Combinar ambas as fontes em um modelo de dados único e intuitivo, projetado para consultas analíticas.
*   **Escopo:** Focar apenas no conjunto de dados mais recente; a historização dos dados (SCD) não é necessária.
*   **Documentação:** Fornecer documentação clara do modelo de dados para apoiar tanto as partes interessadas de negócios (*stakeholders*) quanto as equipes de analytics.

### 2. BI: Analytics e Relatórios (Análise de Dados)

#### Objetivo
Desenvolver análises baseadas em SQL para fornecer insights detalhados sobre:
*   Comportamento do Cliente
*   Desempenho do Produto
*   Tendências de Vendas

Esses insights capacitam os tomadores de decisão com métricas de negócios essenciais para resoluções estratégicas.

## 📂 Estrutura do Repositório

```text
data-warehouse-project/
│
├── datasets/                 # Datasets brutos usados no projeto (dados do ERP e CRM)
├── docs/                     # Documentação do projeto e detalhes da arquitetura
│   ├── etl.drawio            # Arquivo do Draw.io mostrando técnicas e métodos de ETL
│   ├── data_architecture.drawio # Arquivo do Draw.io mostrando a arquitetura do projeto
│   ├── data_catalog.md       # Catálogo de dados, incluindo descrição dos campos e metadados
│   ├── data_flow.drawio      # Diagrama de fluxo de dados no Draw.io
│   ├── data_models.drawio    # Modelagem de dados (star schema) no Draw.io
│   └── naming-conventions.md # Diretrizes de padronização de nomes (tabelas, colunas e arquivos)
├── scripts/                  # Scripts SQL para o ETL e transformações
│   ├── bronze/               # Scripts para extração e carga dos dados brutos
│   ├── silver/               # Scripts para limpeza e transformação dos dados
│   └── gold/                 # Scripts para criação dos modelos analíticos
├── tests/                    # Scripts de testes e validação de qualidade dos dados
├── README.md                 # Visão geral do projeto e instruções
├── LICENSE                   # Informações de licença do repositório
├── .gitignore                # Arquivos e diretórios a serem ignorados pelo Git
└── requirements.txt          # Dependências e requisitos do projeto
