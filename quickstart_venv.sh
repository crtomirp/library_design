#!/usr/bin/env bash
# Usage: bash quickstart_venv.sh
set -e

# 1) Create venv (Python 3.12)
python3.12 -m venv .venv || python3 -m venv .venv

# 2) Activate venv
# shellcheck disable=SC1091
. .venv/bin/activate || source .venv/bin/activate

# 3) Upgrade pip/setuptools/wheel
pip install --upgrade pip setuptools wheel

# 4) Install requirements
pip install -r requirements.txt

echo ""
echo "✅ Done. Activate with: source .venv/bin/activate"
echo "   Launch JupyterLab with: jupyter lab"
