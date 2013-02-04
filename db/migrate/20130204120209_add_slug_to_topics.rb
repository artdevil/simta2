class AddSlugToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :slug, :string
    add_index :topics, :slug, unique: true
    
    Topic.all.each do |topic|
      topic.update_column(:slug, topic.title.parameterize)
    end
  end
end
