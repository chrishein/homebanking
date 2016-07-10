FactoryGirl.define do
  factory :account_movement do
    movement_date "2016-07-09 15:26:43"
    concept "MyString"
    credit "9.99"
    debit "9.99"
    balance "9.99"
    account nil
  end
end
