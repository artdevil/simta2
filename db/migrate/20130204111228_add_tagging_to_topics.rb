class AddTaggingToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :tag_id, :integer
    add_column :topics, :confirmation, :boolean, :null => false, :default => false
  end
end
