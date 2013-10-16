Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :hotels do
    resources :hotels, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :hotels, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :hotels, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :hotels do
    resources :places, :only => [:index, :show]
  end

  # Admin routes
  namespace :hotels, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/hotels" do
      resources :places, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :hotels do
    resources :places, :only => [:index, :show]
  end

  # Admin routes
  namespace :hotels, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/hotels" do
      resources :places, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
