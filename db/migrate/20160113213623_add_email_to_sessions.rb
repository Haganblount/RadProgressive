class AddEmailToSessions < ActiveRecord::Migration
  def up
    add_column :sessions, :email, :string
  end

  def down
    remove_column :sessions, :email, :string
  end
end
