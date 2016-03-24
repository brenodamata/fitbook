Rails.application.routes.draw do

  get 'supplement_usages/new'
  get 'supplement_usages/create'

  resources :supplements do
    get 'add_stack', to: 'users#add_supplement_to_stack'
  end
  resources :supplement_sub_categories
  resources :supplement_categories

  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    get 'supplements'
    get 'supplements/new', to: 'users#add_supplements', as: 'new_supplements'
  end

  resources :night_entries
  get '/night_entries/new/:date', to: "night_entries#new", as: 'new_night_entry_date'

  resources :day_entries
  get '/day_entries/new/:date', to: "day_entries#new", as: 'new_day_entry_date'

  get 'journal', to: "journals#show"

  root 'home#index'
end
