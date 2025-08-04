#!/bin/bash
echo "🔍 Checking status of all submodules..."

for module in automation-web automation-api automation-mobile
do
  echo ""
  echo "→ $module:"
  cd modules/$module || continue
  git status -s
  cd - >/dev/null || exit
done

echo ""
echo "📦 Root project status:"
git status -s
