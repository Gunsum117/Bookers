Rails.application.routes.draw do

 resources :reviews

   get 'top' => 'reviews#top'

   root :to => 'reviews#top'


end
