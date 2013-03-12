class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.integer :user_info_id
      t.string :contact_type
      t.string :contact_info
    end
  end
end
