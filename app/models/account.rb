class Account < ActiveRecord::Base
  belongs_to :client
  has_many :account_movements
  validates :name, presence: true

  def to_s
    [client.name, name].join(' - ')
  end
end
