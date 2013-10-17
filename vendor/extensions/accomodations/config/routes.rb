Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :accomodations do
    resources :accomodations, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :accomodations, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :accomodations, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :accomodations do
    resources :accomodation_types, :only => [:index, :show]
  end

  # Admin routes
  namespace :accomodations, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/accomodations" do
      resources :accomodation_types, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
