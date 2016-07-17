class AccountMovement < ActiveRecord::Base
  require 'csv'

  belongs_to :account
  validates :concept, presence: true

  default_scope { order('movement_date DESC') }

  def self.import(account, file)
    CSV.foreach(file, headers: true) do |row|
      movement_hash = row.to_hash
      AccountMovement.create!(movement_hash.merge(:account => account))
    end
  end

end
