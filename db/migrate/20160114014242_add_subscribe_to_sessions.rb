class AddSubscribeToSessions < ActiveRecord::Migration
  def up
    add_column :sessions, :subscribe, :boolean, default: false
  end

  def down
    remove_column :sessions, :subscribe
  end
end
