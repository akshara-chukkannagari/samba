# This migration comes from refinery_accomodations (originally 2)
class CreateAccomodationsAccomodationTypes < ActiveRecord::Migration

  def up
    create_table :refinery_accomodations_accomodation_types do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-accomodations"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/accomodations/accomodation_types"})
    end

    drop_table :refinery_accomodations_accomodation_types

  end

end
