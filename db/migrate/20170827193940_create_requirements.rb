class CreateRequirements < ActiveRecord::Migration[5.1]
  def change
    create_table :requirements do |t|
      t.integer :project_id
      t.integer :skill_id
      t.timestamps
    end
  end
end
