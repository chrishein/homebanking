FactoryGirl.define do
  factory :account do
    name 'Account 1'
    currency 'USD'
    account_movements { [create(:account_movement)] }
  end
end
