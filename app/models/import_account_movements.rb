class ImportAccountMovements
   include ActiveModel::Model

   attr_accessor :account_id, :file, :remove_existent_movements

   validates :file, presence: true

   def persisted?
    false
  end
end
