class CreateTodoProposals < ActiveRecord::Migration
  def change
    create_table :todo_proposals do |t|
      t.integer :proposal_id
      t.integer :student_id
      t.integer :lecture_id
      t.integer :create_id
      t.string :title
      t.text :description
      t.boolean :done, :null => false, :default => 0

      t.timestamps
    end
  end
end
