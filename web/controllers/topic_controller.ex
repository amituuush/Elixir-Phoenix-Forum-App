# name of this module (everything before "Controller" => "Topic" in this case) must match view, model, and name of folder in /templates => /templates/topic
defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  # name of this method needs to match the name of the template file in /templates/topic => new.html.eex
  # this method will show the "new" template
  def new(conn, _params) do
    # passing in %Topic{} as a struct, and %{} as params to changeset
    changeset = Topic.changeset(%Topic{}, %{})

    # this method needs to have a render method that passes in the connection and the template to be rendered
    # phoenix will automatically grab the "new.html.eex" template from the topic folder because we are in the Topic controller!!! It matches the controller name with the template folder name
    # conn is the single important object that flows all the way through our phoenix application whenever a request is made so we pass it in when this call is made
    # changeset is a keyword list and is passed to "new.html" template, which gives it access to the variable (it can now be referenced as @changeset in the template)
    # conn is automatically available as a variable in the template by just passing it as the first argument and not as a keyword list
    render conn, "new.html", changeset: changeset
  end

  def create(conn, params) do
    IO.inspect params
    %{"topic" => topic} = params

    # changeset function takes in a struct which represents a record in our database, and params which contains any info we want to update that record with
    # in this case, we've extracted the value of the input when the user submits the form, which gets added as the property "topic" to the params map
    # the changeset variable represents a change that we want to make to our database
    # because we are creating a new topic, we pass in an empty struct
    # if we were editing an existing record, we would have passed in a struct that contained a title and id from our database
    changeset = Topic.changeset(%Topic{}, topic)

    # this inserts the record into the database. You don't need to specify where in the db to insert it, the changeset has all that information
    # we are also handling the response from the db to ensure it went through or if there was an error
    case Repo.insert(changeset) do
      {:ok, post} -> IO.inspect(post)
      {:error, changeset} -> IO.inspect("ERRORRRRRRRRRRR")
    end
  end
end