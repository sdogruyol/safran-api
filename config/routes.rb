Rails.application.routes.draw do
  get '/stories' => 'api/v1/stories#index'
  get '/stories/hottest' => 'api/v1/stories#hottest'
  get '/stories/newest' => 'api/v1/stories#newest'
end
