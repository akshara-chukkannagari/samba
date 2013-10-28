class CreateAccomodationsAccomodations < ActiveRecord::Migration

  def up
    create_table :refinery_accomodations do |t|
      t.string :name
      t.text :details
      t.integer :teaser_image_id
      t.string :phone_number
      t.string :email
      t.string :url
      t.integer :user_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-accomodations"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/accomodations/accomodations"})
    end

    drop_table :refinery_accomodations

  end

end
