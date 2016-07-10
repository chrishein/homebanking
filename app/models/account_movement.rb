class AccountMovement < ActiveRecord::Base
  belongs_to :account
  validates :concept, presence: true

  default_scope { order('movement_date DESC') }
end
