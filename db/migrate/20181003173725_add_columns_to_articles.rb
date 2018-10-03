class AddColumnsToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :url, :string
    rename_column :articles, :name, :title
  end
end
