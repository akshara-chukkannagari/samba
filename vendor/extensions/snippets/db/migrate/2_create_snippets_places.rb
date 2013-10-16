class CreateSnippetsPlaces < ActiveRecord::Migration

  def up
    create_table :refinery_snippets_places do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-snippets"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/snippets/places"})
    end

    drop_table :refinery_snippets_places

  end

end
