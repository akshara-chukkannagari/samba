class AddStreetNumberToRefineryAccomodationsAddresses < ActiveRecord::Migration
  def change
    add_column :refinery_accomodations_addresses, :street_number, :integer
  end
end
