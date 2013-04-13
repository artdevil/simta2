class AddLimitToUser < ActiveRecord::Migration
  def change
    add_column :users, :limit_proposal, :string
    add_column :users, :limit_scription, :string
  end
end
