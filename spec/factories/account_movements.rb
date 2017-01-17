FactoryGirl.define do
  factory :account_movement do
    movement_date '2016-07-09 15:26:43'
    concept 'Cash Deposit'
    credit '15000.00'
    balance '15000.00'
  end

  factory :account_movement_other_client, class: AccountMovement do
    movement_date '2016-07-09 15:26:43'
    concept 'Check Deposit'
    credit '10000.00'
    balance '10000.00'
  end
end
