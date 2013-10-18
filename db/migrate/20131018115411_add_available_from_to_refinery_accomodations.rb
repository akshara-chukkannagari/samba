class AddAvailableFromToRefineryAccomodations < ActiveRecord::Migration
  def change
    add_column :refinery_accomodations, :available_from, :datetime
  end
end
