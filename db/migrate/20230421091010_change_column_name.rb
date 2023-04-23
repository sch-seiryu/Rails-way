class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :active_sessions, :ip_adress, :ip_address
  end
end
