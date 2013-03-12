class AddStatusToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :topic_status_id, :integer, :null => false, :default => 1
  end
end
