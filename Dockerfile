FROM elixir:1.17.3

WORKDIR /usr/src/app

ENV MIX_ENV=dev

RUN apt-get update && apt-get install -y inotify-tools

COPY mix.exs ./

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get

COPY . .

RUN mix do phx.digest, compile 

EXPOSE 4000
CMD ["mix", "start"]
