# ============================================================
# Script para renderizar o RMarkdown
# Execute no RStudio ou no terminal com:
#   Rscript renderizar.R
# ============================================================

# Definir diretório de trabalho
if (requireNamespace("rstudioapi", quietly = TRUE) && rstudioapi::isAvailable()) {
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
} else {
  setwd("C:/Users/karin/OneDrive/Área de Trabalho/TESTE4i/Analise_Cobre")
}

# Apontar pandoc (caso não esteja no PATH)
Sys.setenv(RSTUDIO_PANDOC = "C:/Program Files/RStudio/resources/app/bin/quarto/bin/tools")

# Instalar rmarkdown se necessário
if (!require("rmarkdown")) install.packages("rmarkdown", repos = "https://cran.r-project.org")

# Renderizar
rmarkdown::render(
  input       = "analise_cobre_lme.Rmd",
  output_file = "analise_cobre_lme.html",
  output_dir  = "output"
)

cat("\nRelatório gerado em: output/analise_cobre_lme.html\n")
