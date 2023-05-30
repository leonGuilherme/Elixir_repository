# Elixir_repository
Elixir only
Meu CRUD em Elixir
Este é um projeto simples de um CRUD (Create, Read, Update, Delete) escrito em Elixir.

Requisitos
Elixir 1.12 ou superior
Phoenix 1.6 ou superior
Instalação
Clone o repositório
Entre na pasta do projeto e execute mix deps.get para instalar as dependências
Execute mix ecto.setup para criar e migrar o banco de dados
Inicie o servidor Phoenix com mix phx.server
Agora você pode acessar localhost:4000 do seu navegador.

Uso
Este CRUD permite que você crie, leia, atualize e exclua registros de uma entidade chamada “Item”. Para isso, basta acessar as rotas correspondentes:

GET /items: lista todos os itens
GET /items/:id: exibe os detalhes de um item específico
POST /items: cria um novo item
PUT /items/:id: atualiza um item existente
DELETE /items/:id: exclui um item existente
