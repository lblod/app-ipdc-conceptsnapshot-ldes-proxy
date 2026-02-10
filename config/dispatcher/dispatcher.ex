defmodule Dispatcher do
  use Matcher
  define_accept_types [
    json: [ "application/json", "application/vnd.api+json", "application/ld+json"],
  ]

  define_layers [ :services, :not_found ]

  get "/*path", %{ layer: :services, accept: %{ json: true } } do
    forward conn, path, "http://proxy/"
  end

  # In order to forward the 'themes' resource to the
  # resource service, use the following forward rule:
  #
  # match "/themes/*path", @json do
  #   Proxy.forward conn, path, "http://resource/themes/"
  # end
  #
  # Run `docker-compose restart dispatcher` after updating
  # this file.

  match "/*_", %{ layer: :not_found } do
    send_resp( conn, 404, "Route not found.  See config/dispatcher.ex" )
  end
end
