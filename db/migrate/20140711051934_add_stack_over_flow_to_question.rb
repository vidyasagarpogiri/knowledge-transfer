class AddStackOverFlowToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :stack_over_flow, :boolean
  end
end
