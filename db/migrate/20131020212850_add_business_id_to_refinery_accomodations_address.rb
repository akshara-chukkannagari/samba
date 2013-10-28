class AddBusinessIdToRefineryAccomodationsAddress < ActiveRecord::Migration
  def change
    add_column :refinery_accomodations_addresses, :business_id, :integer
  end
end
