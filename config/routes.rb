Rails.application.routes.draw do
  # get 'reviews/new', to: "reviews#new", as: :new_lifestyle_review
  # post 'reviews/', to: "reviews#create"
  # get 'reviews/edit'
  # get 'reviews/update'
  # get 'reviews/delete'
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  resources:lifestyles do
    resources:bookings, only: [:new]
    resources:reviews, only: [:create]
  end
  resources:bookings, except: [ :new]
end


# (pas besoin de coder les fonctions Edit, update, Delete de lifestyle)
