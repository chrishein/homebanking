class RemoveClientFromUser < ActiveRecord::Migration
  def change
    remove_reference :users, :client, index: true, foreign_key: false
  end
end
