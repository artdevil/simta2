class AddSlugToToDoProposals < ActiveRecord::Migration
  def change
    add_column :todo_proposals, :slug, :string
    add_index :todo_proposals, :slug, unique: true
    
    TodoProposal.all.each do |todo|
      todo.update_column(:slug, todo.title.parameterize)
    end
  end
end
