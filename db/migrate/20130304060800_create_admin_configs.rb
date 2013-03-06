class CreateAdminConfigs < ActiveRecord::Migration
  def change
    create_table :admin_configs do |t|
      t.integer :max_lecture_student_proposal
      t.integer :max_lecture_student_scription

      t.timestamps
    end
  end
end
