class AddRepresentationsTerritoriesIndex < ActiveRecord::Migration
  def self.up
    add_index :representations_territories, [:representation_id, :territory_id ], :unique => true
  end

  def self.down
    remove_index :representations_territories, [:representation_id, :territory_id ]
  end
end
