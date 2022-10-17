Rails.application.routes.draw do
 resources :books
 resources :borrows
  put '/accept/:id' => 'borrows#accept', as: 'accept'
  put '/returnbook/:id' => 'borrows#returnbook', as: 'return'
  delete '/reject/:id' => 'borrows#reject', as: 'rejectr'
  get '/requestedbook' => 'librarians#requestedbook'
  post '/borrowcreate' => 'borrows#create'
  get '/borrowshow' => 'borrows#borrowshow'
  get '/showreturnbook' => 'borrows#showreturnbook', as: 'returnb'
  get '/borrowbook' => 'librarians#borrowbook'
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
