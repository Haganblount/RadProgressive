class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :email
      
      t.string :billing_first_name
      t.string :billing_last_name
      t.string :billing_address_1
      t.string :billing_address_2
      t.string :billing_city
      t.string :billing_state
      t.string :billing_zip

      t.string :shipping_first_name
      t.string :shipping_last_name
      t.string :shipping_address_1
      t.string :shipping_address_2
      t.string :shipping_city
      t.string :shipping_state
      t.string :shipping_zip
      
      t.integer :amount
      t.integer :braintree_id
      
      t.timestamps
    end
  end
end
