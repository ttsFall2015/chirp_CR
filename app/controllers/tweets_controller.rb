class TweetsController < ApplicationController

before_action :set_tweet, only: [:show, :edit, :update, :destroy]

before_filter :authenticate_user!

 def index
 	@tweets = Tweet.all 
 end

 def show
 end

 def edit
 end

 def new
 	@tweet = Tweet.new
 end

 def create
 	@tweet = Tweet.new (tweet_params)

 	respond_to do |format|
 		if @tweet.save
 		format.html {redirect_to @tweet, notice: 'Tweet 
 			was successfully created.'}
 		else
 		format.html {render :new}
 		end	
 	end
 end	

 def set_tweet
 @tweet = Tweet.find(params[:id])
 end					

 def _form
 end

  private

    def tweet_params
      # It's mandatory to specify the nested attributes that should be whitelisted.
      # If you use `permit` with just the key that points to the nested attributes hash,
      # it will return an empty hash.
      params.require(:person).permit(:name, :age, pets_attributes: [ :name, :category ])
    end
end

