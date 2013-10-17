module Refinery
  module Accomodations
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Accomodations

      engine_name :refinery_accomodations

      initializer "register refinerycms_accomodations plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "accomodations"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.accomodations_admin_accomodations_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/accomodations/accomodation',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Accomodations)
      end
    end
  end
end
