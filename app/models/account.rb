class Account < ActiveRecord::Base
  belongs_to :client
  validates :name, presence: true

  def to_s
    [client.name, name].join(' - ')
  end
end
