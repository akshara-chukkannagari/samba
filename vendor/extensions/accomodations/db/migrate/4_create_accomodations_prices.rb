class CreateAccomodationsPrices < ActiveRecord::Migration

  def up
    create_table :refinery_accomodations_prices do |t|
      t.float :original
      t.float :after_discount
      t.string :distribution
      t.integer :accomodation_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-accomodations"})
    end

    drop_table :refinery_accomodations_prices

  end

end
