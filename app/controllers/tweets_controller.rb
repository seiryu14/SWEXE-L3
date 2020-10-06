class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all
    end
    

    
    def new
        @tweet = Tweet.new
    end
    
    def create
        @tweet = Tweet.new(message:params[:tweet][:message])
        if @tweet.save
            flash[:notice] = '送信に成功しました。'
            redirect_to '/'
        else
            render 'new'
        end
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to '/'
    end
    
    def edit
        @tweet = Tweet.find(params[:id])
    end
    
    def update
        @tweet = Tweet.find(params[:id])
        message = params[:tweet][:message]
        @tweet.update(message:message)
        redirect_to '/'
    end
    
    def show
        @tweet = Tweet.find(params[:id])
    end
        
end
