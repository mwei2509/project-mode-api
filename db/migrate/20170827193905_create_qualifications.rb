class CreateQualifications < ActiveRecord::Migration[5.1]
  def change
    create_table :qualifications do |t|
      t.integer :account_id
      t.integer :skill_id
      t.timestamps
    end
  end
end
