Refinery::PagesController.class_eval do

  before_filter :find_all_snippets, :only => [:home]
  
  protected 
  def find_all_snippets
    @snippets = Refinery::Snippets::Snippet.all

  end
end