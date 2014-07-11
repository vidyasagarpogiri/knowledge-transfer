class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :title
      t.integer :minimum_points

      t.timestamps
    end
  end
end
