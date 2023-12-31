Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :todos, only: [:index, :create, :show, :destroy, :update] do
        collection do
          get 'todos_by_uid/:uid', action: 'todos_by_uid'
          get 'complete_todo/:uid', action: 'complete_todo'
          get 'incomplete_todo/:uid', action: 'incomplete_todo'
          get 'incomplete_todo_by_one/:uid', action: 'incomplete_todo_by_one'
          get 'incomplete_todo_by_two/:uid', action: 'incomplete_todo_by_two'
          get 'incomplete_todo_by_three/:uid', action: 'incomplete_todo_by_three'
          get 'incomplete_todo_by_four/:uid', action: 'incomplete_todo_by_four'
          get 'this_week_completion_rate/:uid', action: 'this_week_completion_rate'
        end
      end
      resources :categories, only: [:create, :destroy, :update] do
        collection do
          get 'categories_by_uid/:uid', action: 'categories_by_uid'
          get 'categories_by_todo/:id', action: 'categories_by_todo'
        end
      end
      resources :line_notifications, only: [:update_or_create] do
        collection do
          put 'update_or_create/:uid', action: 'update_or_create'
        end
      end
    end
  end
  post 'auth/:provider/callback', to: 'api/v1/users#create'
end
