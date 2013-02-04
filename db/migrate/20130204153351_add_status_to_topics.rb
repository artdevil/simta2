class AddStatusToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :status_id, :integer, :null => false, :default => 1
  end
end
