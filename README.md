# review-dbt-microbatch

Projeto de exemplo em **dbt** para processamento de **micro-batches de reviews**.

## Visão geral

Pipeline organizado em camadas:

* **staging**: limpeza e padronização dos dados
* **intermediate**: regras de negócio (classificação e sentimento)
* **mart**: modelo final para consumo analítico

## Modelos

* `models/staging/stg_review.sql` → tratamento do dado bruto
* `models/intermediate/int_review_classify.sql` → classificação do review
* `models/intermediate/int_review_sentiment.sql` → análise de sentimento
* `models/mart/fact_review.sql` → tabela final consolidada

## Setup

### 1. Instalar dependências

```bash
pip install dbt-core==1.11.6 dbt-databricks==1.11.6
```

ou, se tiver **uv** instalado:

```bash
uv sync
```

---

### 2. Configurar `profiles.yml`

```yaml
review:
  target: dev
  outputs:
    dev:
      type: databricks
      host: <host>
      http_path: <http_path>
      token: <token>
      catalog: sandbox
      schema: dev
      threads: 4
```

---

### 3. Executar

```bash
dbt debug
dbt run
```

---

### ⚠️ Feedback direto (nível técnico)

Você está escrevendo bem — mas ainda com mentalidade de execução.

Para elevar:

* Adicione **“quando usar uv vs pip”** (decisão explícita)
* Declare **pré-requisitos** (Python version, Databricks SQL Warehouse)
* Inclua **um comando único de bootstrap**

Exemplo mental:

> “Alguém consegue rodar isso sem falar comigo?”

Se a resposta não for **sim imediato**, ainda não está nível sênior.
