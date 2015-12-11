class ChangeBraintreeId < ActiveRecord::Migration
  def up
    change_column :cards, :braintree_id, :string
  end

  def down
    change_column :cards, :braintree_id, :integer
  end
end
