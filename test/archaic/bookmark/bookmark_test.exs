defmodule Archaic.BookmarkTest do
  use Archaic.DataCase

  alias Archaic.Bookmark

  describe "urls" do
    alias Archaic.Bookmark.URL

    @valid_attrs %{description: "some description", screenshot: "some screenshot", title: "some title", url: "some url"}
    @update_attrs %{description: "some updated description", screenshot: "some updated screenshot", title: "some updated title", url: "some updated url"}
    @invalid_attrs %{description: nil, screenshot: nil, title: nil, url: nil}

    def url_fixture(attrs \\ %{}) do
      {:ok, url} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bookmark.create_url()

      url
    end

    test "list_urls/0 returns all urls" do
      url = url_fixture()
      assert Bookmark.list_urls() == [url]
    end

    test "get_url!/1 returns the url with given id" do
      url = url_fixture()
      assert Bookmark.get_url!(url.id) == url
    end

    test "create_url/1 with valid data creates a url" do
      assert {:ok, %URL{} = url} = Bookmark.create_url(@valid_attrs)
      assert url.description == "some description"
      assert url.screenshot == "some screenshot"
      assert url.title == "some title"
      assert url.url == "some url"
    end

    test "create_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bookmark.create_url(@invalid_attrs)
    end

    test "update_url/2 with valid data updates the url" do
      url = url_fixture()
      assert {:ok, url} = Bookmark.update_url(url, @update_attrs)
      assert %URL{} = url
      assert url.description == "some updated description"
      assert url.screenshot == "some updated screenshot"
      assert url.title == "some updated title"
      assert url.url == "some updated url"
    end

    test "update_url/2 with invalid data returns error changeset" do
      url = url_fixture()
      assert {:error, %Ecto.Changeset{}} = Bookmark.update_url(url, @invalid_attrs)
      assert url == Bookmark.get_url!(url.id)
    end

    test "delete_url/1 deletes the url" do
      url = url_fixture()
      assert {:ok, %URL{}} = Bookmark.delete_url(url)
      assert_raise Ecto.NoResultsError, fn -> Bookmark.get_url!(url.id) end
    end

    test "change_url/1 returns a url changeset" do
      url = url_fixture()
      assert %Ecto.Changeset{} = Bookmark.change_url(url)
    end
  end

  describe "tags" do
    alias Archaic.Bookmark.Tag

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bookmark.create_tag()

      tag
    end

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Bookmark.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Bookmark.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      assert {:ok, %Tag{} = tag} = Bookmark.create_tag(@valid_attrs)
      assert tag.name == "some name"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bookmark.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      assert {:ok, tag} = Bookmark.update_tag(tag, @update_attrs)
      assert %Tag{} = tag
      assert tag.name == "some updated name"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Bookmark.update_tag(tag, @invalid_attrs)
      assert tag == Bookmark.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Bookmark.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Bookmark.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Bookmark.change_tag(tag)
    end
  end

  describe "groups" do
    alias Archaic.Bookmark.Group

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def group_fixture(attrs \\ %{}) do
      {:ok, group} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bookmark.create_group()

      group
    end

    test "list_groups/0 returns all groups" do
      group = group_fixture()
      assert Bookmark.list_groups() == [group]
    end

    test "get_group!/1 returns the group with given id" do
      group = group_fixture()
      assert Bookmark.get_group!(group.id) == group
    end

    test "create_group/1 with valid data creates a group" do
      assert {:ok, %Group{} = group} = Bookmark.create_group(@valid_attrs)
      assert group.name == "some name"
    end

    test "create_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bookmark.create_group(@invalid_attrs)
    end

    test "update_group/2 with valid data updates the group" do
      group = group_fixture()
      assert {:ok, group} = Bookmark.update_group(group, @update_attrs)
      assert %Group{} = group
      assert group.name == "some updated name"
    end

    test "update_group/2 with invalid data returns error changeset" do
      group = group_fixture()
      assert {:error, %Ecto.Changeset{}} = Bookmark.update_group(group, @invalid_attrs)
      assert group == Bookmark.get_group!(group.id)
    end

    test "delete_group/1 deletes the group" do
      group = group_fixture()
      assert {:ok, %Group{}} = Bookmark.delete_group(group)
      assert_raise Ecto.NoResultsError, fn -> Bookmark.get_group!(group.id) end
    end

    test "change_group/1 returns a group changeset" do
      group = group_fixture()
      assert %Ecto.Changeset{} = Bookmark.change_group(group)
    end
  end
end
