class AddBusinessIdToRefineryAccomodations < ActiveRecord::Migration
  def change
    add_column :refinery_accomodations, :business_id, :integer
  end
end
