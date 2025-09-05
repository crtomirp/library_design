# Installation

# A) pip / venv setup (no Conda)

## 1) Install (Linux/macOS)

In your project folder (where `chemdiv.ipynb` and your libraries live):

```bash
# make the script executable and run it
chmod +x quickstart_venv.sh
./quickstart_venv.sh
```

This will:

* create `.venv` (Python 3.12 if available),
* activate it,
* upgrade `pip`,
* install all requirements,
* and tell you how to launch JupyterLab.

Manual steps (if you prefer):

```bash
python3.12 -m venv .venv || python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip setuptools wheel
pip install -r requirements.txt
jupyter lab
```

## 2) Install (Windows, PowerShell)

```powershell
py -3.12 -m venv .venv  # or: py -3 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
pip install -r requirements.txt
jupyter lab
```

> If `rdkit-pypi` fails on Windows: switch to the **Conda** setup (RDKit is easiest via conda-forge).

## 3) Enable widgets in JupyterLab

* JupyterLab 3/4: widgets are built-in; no extra steps.
* If widgets don’t show, run:

  ```bash
  jupyter labextension install @jupyter-widgets/jupyterlab-manager
  ```

## 4) Run your workflow

* Launch JupyterLab (`jupyter lab`).
* Open **`chemdiv.ipynb`**.
* Make sure `ChEMBL.FL.smi` and `fkktlib_2025.sdf` are reachable (same folder or update paths).
* Run all steps; UMAP and PaCMAP are included.

---

# B) Conda / Mamba setup (recommended for RDKit)

## `environment.yml`

```yaml
name: chemdiv
channels:
  - conda-forge
  - defaults
dependencies:
  - python=3.12
  - rdkit
  - numpy
  - pandas
  - matplotlib
  - scikit-learn
  - plotly
  - ipywidgets
  - jupyterlab
  - notebook
  - pillow
  - umap-learn
  - pip
  - pip:
      - pacmap
      - py3dmol
```

## Install & run

```bash
# with conda
conda env create -f environment.yml
conda activate chemdiv

# or with mamba (faster)
mamba env create -f environment.yml
mamba activate chemdiv

jupyter lab
```

> Widgets usually work out of the box on JupyterLab ≥3. If not:
>
> ```bash
> jupyter labextension install @jupyter-widgets/jupyterlab-manager
> ```

---

## Quick sanity check (both setups)

In a new notebook cell, run:

```python
import rdkit
import umap
import pacmap
import sklearn, numpy, pandas, matplotlib, plotly, ipywidgets, py3dmol
print("OK: all key libs imported.")
```

