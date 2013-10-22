Refinery::PageImages.configure do |config|
   config.captions = true
   config.enable_for = [
   {:model=>"Refinery::Page", :tab=>"Refinery::Pages::Tab"},
   {:model=>"Refinery::Accomodations::Business", :tab=>"Refinery::Accomodations::Business::Tab"}]
   config.wysiwyg = true
end
