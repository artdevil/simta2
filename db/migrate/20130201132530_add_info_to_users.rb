class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :date
    add_column :users, :gender, :string
    add_column :users, :religion, :string
    add_column :users, :avatar, :string
    add_column :users, :telephone, :string
    add_column :users, :user_type, :string
  end
end
