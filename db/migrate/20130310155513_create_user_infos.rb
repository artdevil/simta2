class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.integer :user_id
      t.date :birthday
      t.string :gender
      t.string :religion
    end
  end
end
