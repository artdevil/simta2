class AddAssistantToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :assistant_id, :integer
  end
end
