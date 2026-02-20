# Análise dos Preços do Cobre (Cash Seller) — LME

Consolidação e análise das cotações à vista (*Cash Seller*) do cobre na London Metal Exchange, com dados diários de 02/01/2020 a 31/12/2025. Processamento realizado em R.

---

## Arquivos

| # | Arquivo | Descrição |
|---|---------|-----------|
| 1 | `serie_cobre_2020_2025.csv` | Série temporal consolidada — 1.516 dias úteis (data + preço em USD/t) |
| 2 | `analise_cobre_lme.Rmd` | Código completo em RMarkdown — consolidação, validação, gráficos e análise |
| 3 | `respostas_cobre.Rmd` | Respostas às 8 perguntas do case |
| 4 | `verificacao_cobre.xlsx` | Planilha com série histórica + fórmulas de verificação (MIN, MAX, AVERAGE) |

---

## Como replicar

1. Clone o repositório.
2. Coloque as 72 planilhas `.xlsx` da LME na pasta `Dados/lme_prices (1)/prices/` (um nível acima).
3. Abra `analise_cobre_lme.Rmd` no RStudio e execute os chunks (`Ctrl+Alt+R`).

Os pacotes são instalados automaticamente. Para incluir novos meses, basta adicionar os `.xlsx` e reexecutar.
