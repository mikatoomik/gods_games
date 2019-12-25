class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :links, array: true, default: []

      t.timestamps
    end
  end
end
