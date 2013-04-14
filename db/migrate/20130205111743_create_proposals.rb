class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :student_id
      t.integer :lecture_id
      t.integer :topic_id
      t.integer :progress, :null => false, :default => 0
      t.integer :assistant_id
      t.boolean :done, :null => false, :default => false
      t.timestamps
    end
  end
end
