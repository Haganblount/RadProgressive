class AddStripeCustomerIdToCards < ActiveRecord::Migration
  def up
    add_column :cards, :stripe_customer_id, :string
  end

  def down
    remove_column :cards, :stripe_customer_id
  end
end
