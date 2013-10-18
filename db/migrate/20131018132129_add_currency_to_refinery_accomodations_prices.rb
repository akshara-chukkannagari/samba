class AddCurrencyToRefineryAccomodationsPrices < ActiveRecord::Migration
  def change
    add_column :refinery_accomodations_prices, :currency, :string
  end
end
