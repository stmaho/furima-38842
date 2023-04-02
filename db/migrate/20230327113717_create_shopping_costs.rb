class CreateShoppingCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_costs do |t|

      t.timestamps
    end
  end
end
