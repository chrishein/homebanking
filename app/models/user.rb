class User < ActiveRecord::Base
  has_and_belongs_to_many :clients

  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  def accounts
    if admin?
      Account.all
    else
      [clients.map(&:accounts)].flatten
    end
  end

  alias_method :clients_association, :clients
  def clients
    if admin?
      Client.all
    else
      clients_association
    end
  end

  def admin?
    role == 'admin'
  end
end
