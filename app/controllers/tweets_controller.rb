class TweetsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], folderimage: tweet_params[:folderimage], user_id: current_user.id)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(edit_params)
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :text, :folderimage)
  end

  private
  def edit_params
    params.permit(:image, :text, :folderimage)
  end

  def move_to_index
    redirect_to :action => "index" unless user_signed_in?
  end
end
