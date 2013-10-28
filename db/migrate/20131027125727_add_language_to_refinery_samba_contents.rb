class AddLanguageToRefinerySambaContents < ActiveRecord::Migration
  def change
    add_column :refinery_samba_contents, :language, :string
  end
end
