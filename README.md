**Desafio Multithread — Rodando o projeto**

- **Resumo**: Este projeto consulta CEPs via duas APIs concorrentes. Foi adicionada uma flag `-cep` e suporte a variável de ambiente `CEP` para definir o CEP a ser consultado.

**Run (Docker Compose - modo rápido)**
- Build & run (usa a imagem oficial do Go e executa `go run` no código):

```bash
docker compose up --build
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

**Como alterar o CEP no Docker Compose**
- Abra `docker-compose.yaml` e altere o valor de `CEP` no bloco `environment` do serviço `desafio`.
