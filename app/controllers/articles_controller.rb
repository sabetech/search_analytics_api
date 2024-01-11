class ArticlesController < ApplicationController
    
    def index
        @articles = Article.all
        render json: @articles
    end 

    #use this to create some sample articles to test
    def create
        @article = Article.new(title: params[:title])
        if @article.save
            render json: @article
        else
            render json: {error: "Error creating article"}
        end
    end

    def search
        
        #get IP address of user

        client_ip = request.remote_ip
        print "client ip is #{client_ip}\n"

        if params[:searchterm].blank?
            render json: {error: "Empty field"}
        else
            @articles = Article.search(params[:searchterm])
            render json: @articles
        end

    end
end
