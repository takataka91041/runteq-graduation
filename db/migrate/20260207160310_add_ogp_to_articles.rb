class AddOgpToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :og_title, :string
    add_column :articles, :og_image_url, :text
  end
end
