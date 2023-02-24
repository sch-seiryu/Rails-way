class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :firstName, null: false
      t.string :lastName, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :country

      t.timestamps  # should be 'null: false'?
    end
  end
end
