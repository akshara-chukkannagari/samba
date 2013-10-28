class AddAvailableTillAndSoldOutToRefineryAccomodations < ActiveRecord::Migration
  def change
    add_column :refinery_accomodations, :available_till, :datetime
    add_column :refinery_accomodations, :sold_out, :boolean
  end
end
