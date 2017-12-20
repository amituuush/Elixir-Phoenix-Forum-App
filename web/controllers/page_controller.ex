defmodule Discuss.PageController do
  use Discuss.Web, :controller

  def index(conn, _params) do
    # find matching folder within /templates and add each file within that folder to the render function
    # render index.html and send it back to the user
    render conn, "index.html"
  end
end
