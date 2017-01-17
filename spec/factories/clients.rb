FactoryGirl.define do
  factory :client do
    name 'Client 1'
    accounts { [create(:account)] }
  end

  factory :other_client, class: Client do
    name 'Other Client'
    accounts { [create(:account_other_client)] }
  end
end
