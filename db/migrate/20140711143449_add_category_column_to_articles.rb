class AddCategoryColumnToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :category, :string
  end
end
