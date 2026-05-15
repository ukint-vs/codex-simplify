#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

python3 -m json.tool "$ROOT/.agents/plugins/marketplace.json" >/dev/null
python3 -m json.tool "$ROOT/plugins/code-simplifier/.codex-plugin/plugin.json" >/dev/null
python3 -m json.tool "$ROOT/package.json" >/dev/null

python3 - "$ROOT/plugins/code-simplifier/skills/simplify/agents/openai.yaml" <<'PY'
import sys

path = sys.argv[1]
try:
    import yaml
except ModuleNotFoundError:
    print("Skipping YAML parse: PyYAML is not installed")
    raise SystemExit(0)

with open(path, "r", encoding="utf-8") as handle:
    yaml.safe_load(handle)
PY

validator="${CODEX_SKILL_VALIDATOR:-$HOME/.codex/skills/.system/skill-creator/scripts/quick_validate.py}"
if [[ -f "$validator" ]]; then
  if python3 -c 'import yaml' >/dev/null 2>&1; then
    python3 "$validator" "$ROOT/plugins/code-simplifier/skills/simplify"
  elif [[ -d /tmp/codex-skill-validator-pyyaml ]]; then
    PYTHONPATH=/tmp/codex-skill-validator-pyyaml python3 "$validator" "$ROOT/plugins/code-simplifier/skills/simplify"
  else
    echo "Skipping skill validator: PyYAML is not installed"
  fi
else
  echo "Skipping skill validator: $validator not found"
fi

if rg -n "codex-code-simplifier-plugin|github.com/ukintvs/codex-code-simplifier-plugin|github.com/ukintvs/codex-simplify|ukintvs/codex-simplify" "$ROOT" -g '!scripts/validate.sh' >/tmp/codex-simplify-stale-refs.txt; then
  cat /tmp/codex-simplify-stale-refs.txt
  echo "Found stale repository references" >&2
  exit 1
fi

echo "Validation passed"
