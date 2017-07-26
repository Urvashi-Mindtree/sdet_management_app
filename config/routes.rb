Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
 get 'trainee_module' => 'trainee_module#index'
  get 'trainee_module/assign' => 'trainee_module#assign'

  get 'trainee_module/completed'=>  'trainee_module#completed'

  get 'trainee_module/remaining' => 'trainee_module#remaining'
  
  get 'courses/courses_list' => 'courses#courses_list'

  root "welcome#index"
  resources :trainees
  resources :courses
  resources :admins
  post '/options' => 'trainee#options'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
