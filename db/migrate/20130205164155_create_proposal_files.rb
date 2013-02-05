class CreateProposalFiles < ActiveRecord::Migration
  def change
    create_table :proposal_files do |t|
      t.integer :proposal_id
      t.integer :student_id
      t.string :title
      t.string :file
      t.text :note

      t.timestamps
    end
  end
end
