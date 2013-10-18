Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-accomodations').blank?
        user.plugins.create(:name => 'refinerycms-accomodations',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  url = "/accomodations"
  if defined?(Refinery::Page) && Refinery::Page.where(:link_url => url).empty?
    page = Refinery::Page.create(
      :title => 'Accomodations',
      :link_url => url,
      :deletable => false,
      :menu_match => "^#{url}(\/|\/.+?|)$"
    )
    Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
      page.parts.create(:title => default_page_part, :body => nil, :position => index)
    end
  end
end
Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-accomodations').blank?
        user.plugins.create(:name => 'refinerycms-accomodations',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  url = "/accomodations/accomodation_types"
  if defined?(Refinery::Page) && Refinery::Page.where(:link_url => url).empty?
    page = Refinery::Page.create(
      :title => 'Accomodation Types',
      :link_url => url,
      :deletable => false,
      :menu_match => "^#{url}(\/|\/.+?|)$"
    )
    Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
      page.parts.create(:title => default_page_part, :body => nil, :position => index)
    end
  end
end
Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-accomodations').blank?
        user.plugins.create(:name => 'refinerycms-accomodations',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

end
Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-accomodations').blank?
        user.plugins.create(:name => 'refinerycms-accomodations',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

end
Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-accomodations').blank?
        user.plugins.create(:name => 'refinerycms-accomodations',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

end
