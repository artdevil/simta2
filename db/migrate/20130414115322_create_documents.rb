class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.integer :document_category_id

      t.timestamps
    end
  end
end
