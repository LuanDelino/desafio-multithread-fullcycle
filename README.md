**Desafio Multithread — Rodando o projeto**

- **Resumo**: Este projeto consulta CEPs via duas APIs concorrentes. Foi adicionada uma flag `-cep` e suporte a variável de ambiente `CEP` para definir o CEP a ser consultado.

**Run (Docker Compose - modo rápido)**
- Build & run (usa a imagem oficial do Go e executa `go run` no código):

```bash
docker compose up --build
```

**Run (Dockerfile multi-stage - imagem otimizada)**
- Para usar a imagem otimizada (multi-stage) criada em `dockerfile`:

```bash
# build image
docker build -t desafio-multithead:latest -f dockerfile .
# run
docker run --rm -e CEP=38411-150 desafio-multithead:latest
```

**Rodando localmente (go run)**
- Passando flag:

```bash
go run ./cmd/desafio-multithead -cep=38411-150
```

- Usando variável de ambiente:

```bash
export CEP=38411-150
go run ./cmd/desafio-multithead
```

- Se nenhum `-cep` e nenhuma variável `CEP` forem encontradas, o programa pedirá interativamente para você digitar um CEP (ou aceita o valor padrão `38411-150`).

**Flags e variáveis**
- **Flag**: `-cep` (ex: `-cep=38411-150`) — tem prioridade sobre a variável de ambiente.
- **Env var**: `CEP` — usada quando a flag não é fornecida (útil em `docker-compose`).
- **Timeout**: `-timeout` (em segundos) — tempo padrão definido para esperar as APIs (padrão 1s). Ex: `-timeout=2`.

**Como alterar o CEP no Docker Compose**
- Abra `docker-compose.yaml` e altere o valor de `CEP` no bloco `environment` do serviço `desafio`.

**Observações**
- O `docker-compose.yaml` provido executa `go run` direto no código montado via volume — útil para desenvolvimento.
- Para produção, use o `dockerfile` multi-stage (já incluído) e execute a imagem gerada.

Se quiser, eu atualizo o `docker-compose` para usar `build:` e a imagem multi-stage automaticamente. Deseja isso?