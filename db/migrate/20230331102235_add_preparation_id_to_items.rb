class AddPreparationIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :preparation_id, :integer
  end
end
