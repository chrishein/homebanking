class CreateAccountMovements < ActiveRecord::Migration
  def change
    create_table :account_movements do |t|
      t.datetime :movement_date
      t.string :concept
      t.decimal :credit
      t.decimal :debit
      t.decimal :balance
      t.references :account, index: true

      t.timestamps null: false
    end
    add_foreign_key :account_movements, :accounts
  end
end
