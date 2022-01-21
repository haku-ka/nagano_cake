class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :shipping_cost
      t.integer :payment_method
      t.integer :status
      t.integer :total_payment

      t.timestamps
    end
  end
end
