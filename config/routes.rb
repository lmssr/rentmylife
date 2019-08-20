Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  resources:lifestyles do
    resources:bookings, only: [:create, :new]
  end
  resources:bookings, except: [:create, :new]
end


# (pas besoin de coder les fonctions Edit, update, Delete de lifestyle)
