#!/bin/sh
# Gera o site público a partir da Central e envia ao GitHub Pages
cd "$(dirname "$0")"
{ printf '<!doctype html><html lang="pt-BR"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover"></head><body>\n'; cat ../central/index.html; printf '\n</body></html>\n'; } > index.html
touch .nojekyll
git add index.html .nojekyll publicar.sh && git commit -q -m "Atualiza a Central de Estudos CPOR" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>" && git push -q origin main
