ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Rumbl.Repo, :manual)

defmodule Rumbl.TestHelpers do
  alias Rumbl.{
    Multimedia,
    Accounts
  }

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "some name",
        username: "user#{System.unique_integer()}",
        password: "some_password"
      })
      |> Accounts.registe_user()

    user
  end

  def video_fixture(%Accounts.User{} = user, attrs \\ %{}) do
    attrs =
      Enum.into(%{
        description: "some description",
        title: "some title",
        url: "some url"
      })

    {:ok, video} = Multimedia.create_video(user, attrs)

    video
  end
end
