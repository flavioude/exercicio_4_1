#!/usr/bin/env bash
# Testes manuais do contrato da API (reproduzem o que o autograder checa).
# Suba a API antes (store vazio):  uvicorn app.main:app --port 8000
set -e

BASE="http://localhost:8000"

echo "--- GET /health ---"
curl -s "$BASE/health"; echo

echo "--- POST /tarefas ---"
curl -s -X POST "$BASE/tarefas" \
  -H "Content-Type: application/json" -d '{"titulo":"estudar APIs"}'; echo

echo "--- GET /tarefas/1 ---"
curl -s "$BASE/tarefas/1"; echo

echo "--- GET /tarefas ---"
curl -s "$BASE/tarefas"; echo

echo "--- PUT /tarefas/1 ---"
curl -s -X PUT "$BASE/tarefas/1" \
  -H "Content-Type: application/json" \
  -d '{"titulo":"estudar APIs REST","concluida":true}'; echo

echo "--- GET /tarefas/999 (deve dar 404) ---"
curl -s -o /dev/null -w "status: %{http_code}\n" "$BASE/tarefas/999"
