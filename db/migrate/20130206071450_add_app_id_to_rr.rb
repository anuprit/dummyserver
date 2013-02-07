class AddAppIdToRr < ActiveRecord::Migration
  def change
    add_column :rrs, :application_id, :integer
  end
end
