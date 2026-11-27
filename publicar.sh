#!/bin/sh
# Gera o site público a partir da Central e envia ao GitHub Pages
cd "$(dirname "$0")"
{ printf '<!doctype html><html lang="pt-BR"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">'
  printf '<meta property="og:type" content="website"><meta property="og:title" content="Central de Estudos CPOR"><meta property="og:description" content="Legislação e engenharia de tráfego do zero à prova: aulas curtas, questões comentadas, simulados e caderno de erros."><meta property="og:image" content="https://jrsezar.github.io/cpor/thumb.png"><meta property="og:image:width" content="1200"><meta property="og:image:height" content="630"><meta name="twitter:card" content="summary_large_image"><meta name="twitter:image" content="https://jrsezar.github.io/cpor/thumb.png">'
  printf '</head><body>\n'; cat ../central/index.html; printf '\n</body></html>\n'; } > index.html
cp ../central/thumb.png thumb.png
touch .nojekyll
git add index.html thumb.png .nojekyll publicar.sh && git commit -q -m "Atualiza a Central de Estudos CPOR" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>" && git push -q origin main
