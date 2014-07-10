class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.string :tags
      t.integer :user_id

      t.timestamps
    end
  end
end
