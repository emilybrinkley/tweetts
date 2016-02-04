class TweetsController < ApplicationController


before_action :set_tweet, only: [:destroy]

  def index
  		@tweets = Tweet.all
  		@tweet = Tweet.new 
  end

  def create
  	@tweet = Tweet.new(tweet_params)

  	respond_to do |format|
  		if @tweet.save
  			format.html {redirect_to root_path,
  				notice: 'Tweet was succesfully posted'}
  		end
  	end
 end

  def destroy 
  	@tweet.destroy #to make the delete button work 	

  	respond_to do |format|
  		format.html {redirect_to root_path, notice: 'Tweet was succesfully deleted'}
  		# responding to the method respond_to
  	end
  end

  private
  def set_tweet
  		@tweet = Tweet.find(params[:id])
  	end
  	def tweet_params
  		params.require(:tweet).permit(:tweet_text, :username)
  		
  	end
end
