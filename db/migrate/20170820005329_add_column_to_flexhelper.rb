class AddColumnToFlexhelper < ActiveRecord::Migration[5.1]
  def change
    add_column :flexhelpers, :flexhelper_json, :text
  end
end
