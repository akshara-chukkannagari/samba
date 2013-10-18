module Refinery
  module Accomodations
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Accomodations

      engine_name :refinery_accomodation_types

      initializer "register refinerycms_accomodation_types plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "accomodation_types"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.accomodations_admin_accomodation_types_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/accomodations/accomodation_type',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/accomodations/accomodation_types(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::AccomodationTypes)
      end
    end
  end
end
