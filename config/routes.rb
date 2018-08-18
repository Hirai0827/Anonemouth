Rails.application.routes.draw do
  get 'posts/show' => "posts#show"
  get 'posts/create' => "posts#create"
  post 'posts/send' => "posts#sendingmessage"
  get "posts/result/:code" => "posts#result"
  post 'posts/fav/:id' => "posts#fav"
  get 'posts/search'  => "posts#search"
  post 'posts/find' => "posts#find"
  get 'posts/check/:id' => "posts#check"
  get 'posts/delete/:id' => "posts#delete"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
