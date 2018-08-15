git coclass CreatePreps < ActiveRecord::Migration[5.2]
def change
  create_table :preps do |t|
    t.string :name
    t.text :description
    t.integer :max_participants
    t.text :meal
    t.datetime :time
    t.string :location
    t.references :user

    t.timestamps
  end
end
end
