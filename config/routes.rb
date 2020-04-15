Rails.application.routes.draw do
  resources :projects do
    resources :items, :only => [:new, :create, :edit, :update]
    delete 'clear', :on => :member
  end
  root 'projects#index'

    namespace :api do
      resources :projects do
        resources :items
      end
    end

end
