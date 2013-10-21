# This migration comes from refinery_accomodations (originally 5)
class CreateAccomodationsBusinesses < ActiveRecord::Migration

  def up
    create_table :refinery_accomodations_businesses do |t|
      t.string :name
      t.text :details
      t.string :licence
      t.string :nic
      t.string :url
      t.string :phone
      t.string :email
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-accomodations"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/accomodations/businesses"})
    end

    drop_table :refinery_accomodations_businesses

  end

end
