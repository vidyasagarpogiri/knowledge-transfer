class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answer
      t.string :tags
      t.float :answer_accept_rate
      t.integer :user_id

      t.timestamps
    end
  end
end
