# Archaic

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Main goals
* Provide a way to "permanently" retrieve bookmarks
* Associate things to bookmarks and vice versa
* Things can be projects, lists, tasks, etc.
* Show these in a easy to review/annotate/track manner

## Entity relationships


(URL diffs?)

urls
- url
- title
- description
- screenshot
- description
- last_archived_at


groups
- name
- parent_id

group_tags
- group_id
- name

url_groups
- group_id
- url_id

tags
- name

url_tags
- tag_id
- url_id




(no updated_at)
url_markup
- url_id
- original
- transformed (with custom ids to identify assets or other things)

url_assets (images, videos, mp3, etc)
- url_id
- asset_id
- asset_url


Url < Archive
    < Tags
    < Groups
    < Markup
    < Assets
Group

Bookmark : URL
         : Tag

Project : URL
        : Tag


Learn Elixir
- umbrella apps
