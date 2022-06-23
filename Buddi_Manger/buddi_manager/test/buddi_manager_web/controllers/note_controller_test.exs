defmodule BuddiManagerWeb.NoteControllerTest do
  use BuddiManagerWeb.ConnCase

  import BuddiManager.NotesFixtures

  alias BuddiManager.Notes.Note

  @create_attrs %{
    created: ~U[2022-06-04 19:21:00Z],
    created_by: "some created_by",
    content: "some text bla bla",
    label: "some label",
    updated: ~U[2022-06-04 19:21:00Z]
  }
  @update_attrs %{
    created: ~U[2022-06-05 19:21:00Z],
    created_by: "some updated created_by",
    content: "some update text bla bla",
    label: "some updated label",
    updated: ~U[2022-06-05 19:21:00Z]
  }
  @invalid_attrs %{created: nil, created_by: nil, label: nil, updated: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all notes", %{conn: conn} do
      conn = get(conn, Routes.note_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create note" do
    test "renders note when data is valid", %{conn: conn} do
      conn = post(conn, Routes.note_path(conn, :create), note: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.note_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "created" => "2022-06-04T19:21:00Z",
               "created_by" => "some created_by",
               "content" => "some text bla bla",
               "label" => "some label",
               "updated" => "2022-06-04T19:21:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.note_path(conn, :create), note: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update note" do
    setup [:create_note]

    test "renders note when data is valid", %{conn: conn, note: %Note{id: id} = note} do
      conn = put(conn, Routes.note_path(conn, :update, note), note: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.note_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "created" => "2022-06-05T19:21:00Z",
               "created_by" => "some updated created_by",
               "content" => "some update text bla bla",
               "label" => "some updated label",
               "updated" => "2022-06-05T19:21:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, note: note} do
      conn = put(conn, Routes.note_path(conn, :update, note), note: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete note" do
    setup [:create_note]

    test "deletes chosen note", %{conn: conn, note: note} do
      conn = delete(conn, Routes.note_path(conn, :delete, note))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.note_path(conn, :show, note))
      end
    end
  end

  defp create_note(_) do
    note = note_fixture()
    %{note: note}
  end
end
