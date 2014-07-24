class AddProjectColumnToCodeSnippets < ActiveRecord::Migration
  def change
    add_column :code_snippets, :project_id, :integer
  end
end
