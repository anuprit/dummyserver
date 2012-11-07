class CreateRrs < ActiveRecord::Migration
  def change
    create_table :rrs do |t|
      t.string :url
      t.string :response

      t.timestamps
    end
  end
end
