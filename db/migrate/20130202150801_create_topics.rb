class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :lecture_id
      t.string :title
      t.text :description
      t.string :tag_list

      t.timestamps
    end
  end
end
