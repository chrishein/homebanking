class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :clients do |t|
      # t.index [:user_id, :client_id]
      # t.index [:client_id, :user_id]
    end
  end
end
