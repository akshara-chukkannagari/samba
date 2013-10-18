class FrontendController < ApplicationController
  layout "samba_layout"
  def search
    @accomodations = Refinery::Accomodations::Accomodation.all
  end
end
