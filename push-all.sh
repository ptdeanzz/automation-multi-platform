#!/bin/bash

echo "===> PUSHING SUBMODULES..."

for module in automation-web automation-api automation-mobile
do
  echo ""
  echo "→ Pushing: $module"
  cd modules/$module || exit
  git add .
  git commit -m "$1"
  git push
  cd - >/dev/null || exit
done

echo ""
echo "===> UPDATING ROOT REPO..."
git add modules/*
git commit -m "Update submodule pointers: $1"
git push

echo ""
echo "✅ All submodules + root pushed!"
