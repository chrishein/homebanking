json.array!(@account_movements) do |account_movement|
  json.extract! account_movement, :id, :movement_date, :concept, :credit, :debit, :balance, :account_id
  json.url account_movement_url(account_movement, format: :json)
end
