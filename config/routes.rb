Rails.application.routes.draw do
  devise_for :librarians, controllers: { sessions: 'librarians/sessions', registrations: "librarians/registrations" }

  delete '/books/:id' => 'books#destroy', as: 'destroy'
  post '/borrowcreate' => 'borrows#create'
  get '/requestedbook' => 'borrows#requestedbook'
  get '/borrowbook' => 'borrows#borrowbook'
  get '/borrowshow' => 'borrows#borrowshow'
  get '/showreturnbook' => 'borrows#showreturnbook', as: 'returnb'
  get '/overdue_date_book' => 'borrows#overdue_date_book'

  patch '/returnbook/:id' => 'borrows#returnbook', as: 'return'
  delete '/reject/:id' => 'borrows#reject', as: 'reject'
  put '/accept/:id' => 'borrows#accept', as: 'accept'
  
  delete '/really_destroy' => 'books#really_destroy'
  get '/show' => 'librarians#show'

  get '/trashbin' => 'books#trashbin'
  get '/recover' => 'books#recover'
  get '/studentindex' => 'books#studentindex'
  
  get '/root_page' => 'librarians#root_page'
  
  root "librarians#root_page"

  # get '/new_user' => 'librarians#new_user'
  delete '/librarians/:id' => 'librarians#destroy', as: 'destroy_user'
  # patch '/make_student/:id' => 'librarians#make_student', as: 'make_student'
  # patch '/make_librarian/:id' => 'librarians#make_librarian', as: 'make_librarian'

  get '/new_librarian' => 'librarians#new_librarian'
  get '/current_user_profile' => 'librarians#current_user_profile'
  get '/index' => 'librarians#index'
  get '/signup' => 'librarians#new'
  post '/librarians' => 'librarians#create'
  get '/history' => 'librarians#history'

  get '/login' => 'sessions#new'
  post '/creates' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :books
  resources :borrows
  resources :librarians
end
