class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :index, :visitor
    if user.admin?
      can :manage, :all
    else
      can :read, [Client, Account, AccountMovement]
      can :download, Account
    end
  end
end
