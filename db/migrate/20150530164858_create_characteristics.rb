class CreateCharacteristics < ActiveRecord::Migration
  def change
    create_table :characteristics do |t|
      t.timestamps null: false
      t.references :position
      t.string :name, null: false
      t.text :description
    end
  end
end
