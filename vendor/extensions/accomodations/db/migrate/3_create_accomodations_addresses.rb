class CreateAccomodationsAddresses < ActiveRecord::Migration

  def up
    create_table :refinery_accomodations_addresses do |t|
      t.string :street
      t.string :town
      t.string :district
      t.string :state
      t.string :country
      t.float :lat
      t.float :lng
      t.float :alt
      t.integer :accomodation_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-accomodations"})
    end

    drop_table :refinery_accomodations_addresses

  end

end
