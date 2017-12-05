class CreateFlexhelpers < ActiveRecord::Migration[5.1]
  def change
    create_table :flexhelpers do |t|
      t.integer :account_id
      t.integer :project_id
      t.timestamps
    end
  end
end
