class CreateCreatures < ActiveRecord::Migration[5.2]
  def change
    create_table :creatures do |t|
      t.string :type
      t.string :name
      t.references :user, foreign_key: true
      t.references :god, foreign_key: true
      t.references :place, foreign_key: true
      t.integer :stamina
      t.integer :att
      t.integer :def
      t.boolean :living

      t.timestamps
    end
  end
end
