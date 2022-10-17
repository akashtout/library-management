Rails.application.routes.draw do
 resources :books
 resources :borrows
  put '/accept/:id' => 'borrows#accept', as: 'accept'
  post '/borrowcreate' => 'borrows#create'
  get '/borrowshow' => 'borrows#borrowshow'
  get '/allstudent' => 'librarians#allstudent'
  get '/studentindex' => 'books#studentindex'
  get '/studentshow' => 'books#studentshow'
  root "librarians#index"
  get '/libraryl' => 'librarians#libraryl'
  get '/index' => 'librarians#index'
  get '/signup' => 'librarians#new'
  post '/librarians' => 'librarians#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
