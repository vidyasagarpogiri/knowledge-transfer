class DbColumnsModifications < ActiveRecord::Migration
  def change
    rename_column :answers, :answer, :content
    add_column :answers, :question_id, :integer
  end
end
