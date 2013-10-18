class AddAccomodationTypeToRefineryAccomodations < ActiveRecord::Migration
  def change
    add_column :refinery_accomodations, :accomodation_type_id, :integer
  end
end
