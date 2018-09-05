Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do
    resources :questions, only: [:index]
  end

  mount Raddocs::App => '/docs'

  root to: redirect('/admin', status: 302)
end
