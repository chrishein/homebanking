FactoryGirl.define do
  factory :client do
    name 'Client 1'
    accounts { [create(:account)] }
  end
end
