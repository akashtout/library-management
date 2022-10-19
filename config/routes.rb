Rails.application.routes.draw do
    delete '/books/:id' => 'books#destroy', as: 'destroy'
  post '/borrowcreate' => 'borrows#create'
  get '/requestedbook' => 'borrows#requestedbook'
  get '/borrowbook' => 'borrows#borrowbook'
  get '/borrowshow' => 'borrows#borrowshow'
  get '/showreturnbook' => 'borrows#showreturnbook', as: 'returnb'

  patch '/returnbook/:id' => 'borrows#returnbook', as: 'return'
  delete '/reject/:id' => 'borrows#reject', as: 'reject'
  put '/accept/:id' => 'borrows#accept', as: 'accept'

  get '/studentindex' => 'books#studentindex'
  root "librarians#index"
  get '/libraryl' => 'librarians#libraryl'
  get '/index' => 'librarians#index'
  get '/signup' => 'librarians#new'
  post '/librarians' => 'librarians#create'
  get '/allstudent' => 'librarians#allstudent'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
 resources :books
 resources :borrows
end
