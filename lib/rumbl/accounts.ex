defmodule Rumbl.Accounts do
  @moduledoc """
  The accounts context
  """

  alias Rumbl.Accounts.User

  def list_users do
    [
      %User{id: "1", name: "Jacek", username: "jswob"},
      %User{id: "2", name: "Adam", username: "adas_rw"},
      %User{id: "3", name: "Wiktoria", username: "wiki2006"}
    ]
  end

  def get_user(id) do
    Enum.find(list_users(), fn user -> user.id == id end)
  end

  def get_user_by(params) do
    Enum.find(list_users(), fn user ->
      Enum.all?(params, fn {key, val} -> Map.get(user, key) == val end)
    end)
  end
end
