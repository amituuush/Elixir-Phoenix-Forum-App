# name of this module (everything before "Controller" => "Topic" in this case) must match view, model, and name of folder in /templates => /templates/topic
defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  # name of this method needs to match the name of the template file in /templates/topic => new.html.eex
  # this method will show the "new" template
  def new(conn, params) do
    # passing in %Topic{} as a struct, and %{} as params to changeset
    changeset = Topic.changeset(%Topic{}, %{})

    # this method needs to have a render method that passes in the connection and the template to be rendered
    # phoenix will automatically grab the "new.html.eex" template from the topic folder because we are in the Topic controller!!!
    # conn is the single important object that flows all the way through our phoenix application whenever a request is made so we pass it in when this call is made
    render conn, "new.html"

  end
end