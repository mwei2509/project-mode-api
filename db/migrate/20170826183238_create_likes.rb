class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :heart, default: 0
      t.integer :account_id
      t.integer :project_id
    end
  end
end
