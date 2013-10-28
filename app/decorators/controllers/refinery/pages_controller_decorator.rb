Refinery::PagesController.class_eval do

  before_filter :find_all_snippets, :only => [:home]
  
  protected 
  def find_all_snippets
    @businesses = Refinery::Accomodations::Business.all
    @accomodation = Refinery::Accomodations::Accomodation.last
  end
end