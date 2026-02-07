# Análise do Compartamento de Compra do Cliente

Este repositório contém um projeto completo de análise de dados focado no comportamento de compra de consumidores de uma loja de roupas, utilizando um conjunto de dados com 3.900 registros e 18 colunas. O fluxo de trabalho abrange desde o tratamento de dados com **Python**, análise estruturada via **SQL** até a visualização no **Power BI**.

## 📌 Visão Geral do Projeto
O objetivo principal é identificar tendências, melhorar o engajamento do cliente e otimizar estratégias de marketing e produtos para uma empresa líder no varejo. A análise foca em entender como fatores como descontos, avaliações e assinaturas impulsionam as decisões de consumo.
## 📊 Visualização do Dashboard
Abaixo está a representação visual dos KPIs e métricas de comportamento:

<img width="1451" height="791" alt="image" src="https://github.com/user-attachments/assets/63a0d48c-738e-4dc5-b716-57c36d4651f8" />

## 🛠️ Tecnologias e Processos

### 1. Em Python:
* Utilização da biblioteca **Pandas** para a ingestão e tratamento de dados ausentes por meio da imputação da mediana baseada na categoria do produto.
* Padronização do esquema de dados para o padrão *snake_case* e remoção de colunas redundantes, como `promo_code_used`, para otimizar o conjunto de dados.
* Discretização de variáveis contínuas em grupos categóricos para criação de faixas etárias e derivação de métricas de frequência de consumo.
* Orquestração da carga de dados processados para um banco de dados **PostgreSQL** utilizando a biblioteca **SQLAlchemy**.

### 2. No PostgreSQL:
* Execução de consultas estruturadas para extrair indicadores de performance e responder a perguntas de negócio complexas.
* Desenvolvimento de lógica de segmentação para classificar clientes em grupos de fidelidade (*Novo*, *Recorrente*, *Fiel*) com base no volume de compras anteriores.
* Aplicação de funções de agregação e filtros para comparar métricas de receita entre perfis demográficos, tipos de frete e status de assinatura.

### 3. No PowerBI:
* Modelagem de dados e criação de medidas calculadas em **DAX** para a apresentação de indicadores como ticket médio, total de clientes e média de avaliação.
* Implementação de visualizações interativas, incluindo gráficos de rosca para distribuição de assinantes e gráficos de barras para análise de receita por categoria e faixa etária.
* Configuração de filtros dinâmicos (slicers) para navegação multidimensional por gênero, categoria de produto e modalidades de envio.
