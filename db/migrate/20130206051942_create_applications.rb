class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :user_id
      t.string :api_token
      t.string :name

      t.timestamps
    end
  end
end
