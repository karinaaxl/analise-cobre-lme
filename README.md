# Análise dos Preços do Cobre (Cash Seller) — LME

Consolidação e análise das cotações à vista (*Cash Seller*) do cobre na London Metal Exchange, com dados diários de 02/01/2020 a 31/12/2025. Série de **1.516 observações** (dias úteis), processada em R.

---

## Arquivos do repositório

| # | Arquivo | Descrição |
|---|---------|-----------|
| 1 | `serie_cobre_2020_2025.csv` | Série temporal consolidada (data + preço em USD/t) |
| 2 | `analise_cobre_lme.Rmd` | Código completo — consolidação, validação, gráficos e análise |
| 3 | `respostas_cobre.Rmd` | Respostas às 8 perguntas do case (gera documento Word) |
| 4 | `verificacao_cobre.xlsx` | Planilha com fórmulas de verificação (MIN, MAX, AVERAGE) |
| 5 | `graficos/` | Gráficos gerados pela análise |

---

## Respostas

### 1. Menor cotação do período
**USD 4.617,50/t** em **23/03/2020**, durante o choque da pandemia de COVID-19.

### 2. Maior cotação do período
**USD 12.512,00/t** em **30/12/2025**, impulsionada pela demanda ligada à transição energética.

### 3. Variação média mensal — 2020 vs. 2024

| Ano  | Variação média mensal |
|------|-----------------------|
| 2020 | **3,32%** |
| 2024 | **0,37%** |

A média elevada de 2020 reflete a recuperação acelerada pós-choque pandêmico. Em 2024, o mercado oscilou de forma mais contida.

### 4. Variação acumulada (02/01/2020 a 31/12/2025)
**102,81%** — o preço do cobre mais que dobrou no período.

### 5. Preço médio mensal

![Preço Médio Mensal do Cobre](graficos/media_mensal_cobre.png)

### 6. Cotação trimestral (último dia útil de cada trimestre)

![Cotação Trimestral do Cobre](graficos/cotacao_trimestral_cobre.png)

### 7. Variação anual

![Variação Anual do Cobre](graficos/variacao_anual_cobre.png)

### 8. Determinantes da trajetória

- **2020** — Choque pandêmico e recuperação em V (~26% no ano)
- **2021** — Rally de commodities e transição energética (~25%)
- **2022** — Correção sob aperto monetário e dólar forte (~-14%)
- **2023** — Estabilização com restrições de oferta (~0%)
- **2024** — Retomada com expectativa de corte de juros e eletrificação
- **2025** — Máximas históricas impulsionadas por demanda de EVs, data centers e infraestrutura de IA (~44%)

---

## Como replicar

1. Clone o repositório.
2. Coloque as 72 planilhas `.xlsx` da LME na pasta `Dados/lme_prices (1)/prices/` (um nível acima).
3. Abra `analise_cobre_lme.Rmd` no RStudio e execute os chunks (`Ctrl+Alt+R`).

Os pacotes são instalados automaticamente caso não estejam presentes.
