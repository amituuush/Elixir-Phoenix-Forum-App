# name of this module must match with controller, view, and name of folder within templates => /templates/topic
# controller and view will be appended with "Controller" and "View", but the model's module name is just Topic with no "Model" at the end
defmodule Discuss.Topic do
  # automatically creates a struct with the name Topic for us behind the scenes
  use Discuss.Web, :model

    # lets phoenix know that the Topic model I'm creating maps up to my Topic table in postgres, that Topic has a title that is a string
    #  lets phoenix know about what's going on inside db because it sees it like a black box
    schema "topics" do
      field :title, :string
    end

    # struct: contains some data that represents a record (or a record we want to save) in the database
    # params: a hash that contains the properties we want to update the struct with
    # we actually return a Changeset which is returned from the changeset function (confusing, they have the same name)
    def changeset(struct, params \\ %{}) do
      struct
      |> cast(params, [:title])
      # ensures there's a title property
      |> validate_required([:title])
    end

end