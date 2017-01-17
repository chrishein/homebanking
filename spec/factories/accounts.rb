FactoryGirl.define do
  factory :account do
    name 'Account 1'
    currency 'USD'
    account_movements { [create(:account_movement)] }
  end

  factory :account_other_client, class: Account do
    name 'Account Other Client'
    currency 'USD'
    account_movements { [create(:account_movement_other_client)] }
  end
end
