class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :email, :unique => true

      t.timestamps
    end
  end
end
