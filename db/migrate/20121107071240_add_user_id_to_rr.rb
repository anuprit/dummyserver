class AddUserIdToRr < ActiveRecord::Migration
  def change
    add_column :rrs, :user_id, :integer
  end
end
