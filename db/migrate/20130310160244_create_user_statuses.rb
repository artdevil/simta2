class CreateUserStatuses < ActiveRecord::Migration
  def change
    create_table :user_statuses do |t|
      t.string :description
    end
  end
end
