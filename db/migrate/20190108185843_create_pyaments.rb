class CreatePyaments < ActiveRecord::Migration[5.2]
  def change
    create_table :pyaments do |t|
      t.string :product
      t.integer :amount
      t.string :state

      t.timestamps
    end
  end
end
