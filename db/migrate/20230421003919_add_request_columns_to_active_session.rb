class AddRequestColumnsToActiveSession < ActiveRecord::Migration[7.0]
  def change
    add_column :active_sessions, :user_agent, :string
    add_column :active_sessions, :ip_adress, :string
  end
end