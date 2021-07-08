Rails.application.routes.draw do
  get 'answers/edit'
  # get 'questions/index'
  # get 'questions/show'
  # get 'questions/new'
  # get 'questions/edit'

  
  root 'questions#index'
  # この一行だけで上のやつが自動的に作成される
  resources :questions
  resources :questions do
    resources :answers
  end

end
