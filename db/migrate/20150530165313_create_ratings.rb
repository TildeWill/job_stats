class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.timestamps null: false
      t.integer :value, null: false
      t.references :characteristic
    end
  end
end
