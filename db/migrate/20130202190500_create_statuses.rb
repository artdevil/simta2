class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :topic_statuses do |t|
      t.string :description
    end
  end
end
