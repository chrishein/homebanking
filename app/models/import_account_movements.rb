class ImportAccountMovements
   include ActiveModel::Model

   attr_accessor :account_id, :file, :remove_existent_movements

   def persisted?
    false
  end
end
