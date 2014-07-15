class AddCategoryColumnToCodeSnippets < ActiveRecord::Migration
  def change
  add_column :code_snippets, :category_id, :integer
  end
end
