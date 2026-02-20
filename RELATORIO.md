# Relatório de Execução — Análise dos Preços do Cobre (LME)

## Objetivo

Consolidar 72 planilhas mensais da London Metal Exchange (Jan/2020 a Dez/2025) em uma série temporal única e realizar análise completa dos preços à vista (Cash Seller) do cobre, respondendo a 8 questões específicas com código R reproduzível.

---

## Estrutura do Diretório

```
Analise_Cobre/
├── analise_cobre_lme.Rmd     # RMarkdown principal (código + análise)
├── renderizar.R               # Script auxiliar para renderizar o Rmd
├── RELATORIO.md               # Este arquivo
├── output/
│   ├── analise_cobre_lme.html # Relatório HTML renderizado
│   └── cobre_cash_seller_2020_2025.csv  # Série consolidada (1.516 obs.)
└── graficos/
    ├── media_mensal_cobre.png          # Q5: Média mensal
    ├── cotacao_trimestral_cobre.png    # Q6: Cotação trimestral
    └── variacao_anual_cobre.png        # Q7: Variação anual
```

---

## Dados de Origem

- **Localização:** `Dados/lme_prices (1)/prices/`
- **Formato:** 72 arquivos `.xlsx` (um por mês, Jan/2020 a Dez/2025)
- **Padrão de nome:** `{Mês} {Ano} No Steel  Molybdenum.xlsx`
- **Aba utilizada:** `Copper`
- **Colunas extraídas:**
  - Coluna A: Data (serial numérico do Excel)
  - Coluna C: Cash Seller (USD/tonelada)
  - Coluna Q: Settlement (USD/tonelada) — idêntico ao Cash Seller

---

## Consolidação dos Dados

### Método
1. Listagem automática de todos os `.xlsx` no diretório
2. Leitura da aba "Copper" de cada arquivo via `readxl::read_excel()`
3. Extração das colunas A (data), C (Cash Seller) e Q (Settlement)
4. Conversão de datas do serial Excel (`origin = 1899-12-30`)
5. Empilhamento com `purrr::map_dfr()` — escalável para novos meses
6. Remoção de duplicatas e ordenação cronológica

### Validações Executadas
| Validação | Resultado |
|-----------|-----------|
| Cash Seller == Settlement | OK (0 diferenças) |
| Datas duplicadas | OK (0 duplicatas) |
| Intervalo de datas | 2020-01-02 a 2025-12-31 |
| Valores ausentes (NA) | 0 |
| Meses cobertos | 72 (cobertura completa) |
| Total de observações | 1.516 dias úteis |

---

## Respostas às 8 Questões

### Q1. Menor cotação
O cobre atingiu sua **menor cotação** no ponto mais baixo da crise COVID-19 (março/abril de 2020), ao preço de **USD 4.617,50/t**.

### Q2. Maior cotação
A **maior cotação** foi atingida em 2025, refletindo a demanda por eletrificação e transição energética, com preço de **USD 12.512,00/t**.

### Q3. Variação média mensal
- **2020:** Variação média mensal calculada no relatório HTML
- **2024:** Variação média mensal calculada no relatório HTML
- Método: variação percentual entre último dia útil de meses consecutivos

### Q4. Variação acumulada (02/01/2020 a 31/12/2025)
Calculada como `(preço_final / preço_inicial - 1) × 100`. Valor exato no relatório HTML.

### Q5. Gráfico — Média mensal
![Média Mensal](graficos/media_mensal_cobre.png)

### Q6. Gráfico — Cotação trimestral (último dia)
![Trimestral](graficos/cotacao_trimestral_cobre.png)

### Q7. Gráfico — Variação anual
![Variação Anual](graficos/variacao_anual_cobre.png)

### Q8. Análise sintética
Análise completa dos determinantes incluída no relatório HTML, cobrindo:
- 2020: Choque COVID e recuperação em V
- 2021: Rally das commodities e transição energética
- 2022: Correção sob aperto monetário
- 2023: Estabilização com volatilidade
- 2024: Nova alta por transição energética
- 2025: Máximas históricas e volatilidade geopolítica

---

## Como Reproduzir

### Opção 1 — Via RStudio
1. Abrir `analise_cobre_lme.Rmd` no RStudio
2. Clicar em **Knit** (ou Ctrl+Shift+K)

### Opção 2 — Via terminal
```r
Rscript renderizar.R
```

### Opção 3 — Via console do R
```r
setwd("C:/Users/karin/OneDrive/Área de Trabalho/TESTE4i/Analise_Cobre")
Sys.setenv(RSTUDIO_PANDOC = "C:/Program Files/RStudio/resources/app/bin/quarto/bin/tools")
rmarkdown::render("analise_cobre_lme.Rmd", output_dir = "output")
```

### Escalabilidade
Para incluir novos meses, basta adicionar os arquivos `.xlsx` correspondentes no diretório `Dados/lme_prices (1)/prices/` e re-renderizar. O código detecta automaticamente todos os arquivos.

---

## Pacotes R Utilizados

| Pacote | Função |
|--------|--------|
| `readxl` | Leitura de arquivos xlsx |
| `dplyr` | Manipulação de dados |
| `tidyr` | Transformação de dados |
| `lubridate` | Manipulação de datas |
| `ggplot2` | Gráficos |
| `scales` | Formatação de eixos |
| `stringr` | Manipulação de strings |
| `purrr` | Iteração funcional |
| `knitr` | Renderização do Rmd |
| `kableExtra` | Tabelas formatadas |
| `rmarkdown` | Geração do relatório HTML |

---

*Relatório gerado em 20/02/2026.*
