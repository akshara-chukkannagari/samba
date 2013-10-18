Refinery::PagesController.class_eval do

  before_filter :find_all_snippets, :only => [:home]
  
  protected 
  def find_all_snippets
    @accomodations = Refinery::Accomodations::Accomodation.all
  end
end