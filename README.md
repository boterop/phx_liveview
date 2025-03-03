# PhxLiveview

To start your Phoenix server:

- Copy `.env.example` to `.env` and fill in the values

  For test cases, you can use the following values:

  ```.env
  DB_USER=postgres
  DB_PASSWORD=postgres
  DB_HOST=localhost
  DB_NAME=phx_liveview_dev
  JWT_SECRET=holi
  SECRET_KEY=test-secret-key
  ```

## After template setup

- Run `python3 setup.py` to rename the project

## With docker

```sh
docker-compose up
```

## Without docker

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit the [`web`](http://localhost:4000/) page from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
