class AddLinksToPlace < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :links, :string, array: true, default: []
  end
end
