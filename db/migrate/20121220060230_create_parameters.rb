class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.integer :rr_id
      t.string :key
      t.string :value
      t.string :type

      t.timestamps
    end
  end
end
