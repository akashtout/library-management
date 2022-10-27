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

    get '/show' => 'librarians#show'
    get '/home' => 'books#home'
    get '/studentindex' => 'books#studentindex'
    
    get '/home' => 'librarians#home'
    root "librarians#home"
    get '/viewprofile' => 'librarians#viewprofile'
    get '/libraryindex' => 'librarians#libraryindex'
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
