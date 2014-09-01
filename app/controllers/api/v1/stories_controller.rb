class Api::V1::StoriesController < ApplicationController
  def index
    @stories = Story.limit 50
    render json: @stories
  end

  def newest
    @stories = Story.is_new.limit 20
    render json: @stories
  end

  def hottest
    @stories = Story.is_hot.limit 20
    render json: @stories
  end
end
