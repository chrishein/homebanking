class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :currency
      t.references :client, index: true

      t.timestamps null: false
    end
    add_foreign_key :accounts, :clients
  end
end
