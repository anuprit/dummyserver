class CreateHeaders < ActiveRecord::Migration
  def change
    create_table :headers do |t|
      t.integer :rr_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
