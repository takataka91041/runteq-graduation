class AddNullConstraintsToArticles < ActiveRecord::Migration[7.2]
  def change
    change_column_null :articles, :url, false
    change_column_null :articles, :status, false
    change_column_null :articles, :priority, false
  end
end
