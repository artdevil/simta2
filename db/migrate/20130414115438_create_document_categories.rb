class CreateDocumentCategories < ActiveRecord::Migration
  def change
    create_table :document_categories do |t|
      t.string :name
    end
  end
end
