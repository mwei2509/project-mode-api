class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
    	t.integer :account_id
    	t.integer :project_id
      t.integer :parent_id
      t.timestamps
    end
  end
end
