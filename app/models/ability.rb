class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :index, :visitor
    if user.admin?
      can :manage, :all
    else
      can :read, Client, :id => user.clients.map(&:id)
      can :read, Account, :client => { :id => user.clients.map(&:id)}
      can :read, AccountMovement, :account => { :client => { :id => user.clients.map(&:id) }}
      can :download, Account
    end
  end
end
