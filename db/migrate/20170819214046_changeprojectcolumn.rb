class Changeprojectcolumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :projects, :name, :title
  end
end
