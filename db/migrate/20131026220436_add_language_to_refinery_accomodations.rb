class AddLanguageToRefineryAccomodations < ActiveRecord::Migration
  def change
    add_column :refinery_accomodations, :language, :string
  end
end
