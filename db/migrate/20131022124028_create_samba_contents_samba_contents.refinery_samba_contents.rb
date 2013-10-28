# This migration comes from refinery_samba_contents (originally 1)
class CreateSambaContentsSambaContents < ActiveRecord::Migration

  def up
    create_table :refinery_samba_contents do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-samba_contents"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/samba_contents/samba_contents"})
    end

    drop_table :refinery_samba_contents

  end

end
