class FavoritesController < ApplicationController
  before_action :set_tweet, only: [:create, :destroy]
  
  def create
    @favorite = Favorite.new(user_id: current_user.id, tweet_id: params[:tweet_id])
    if @favorite.save
      redirect_to edit_tweet_path(@tweet.id)
    else
      render :new
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    @favorite.destroy
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

end
