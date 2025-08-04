#!/bin/bash

echo "===> PULLING SUBMODULES..."

for module in automation-web automation-api automation-mobile
do
  echo ""
  echo "→ Pulling: $module"
  cd modules/$module || exit
  git checkout main
  git pull
  cd - >/dev/null || exit
done

echo ""
echo "===> UPDATING ROOT POINTER..."
git add modules/*
git commit -m "Sync submodule pointers to latest"
git push

echo ""
echo "✅ All submodules pulled and root pointer updated!"
