class ArticlesController < ApplicationController
    
    def index
        @articles = Article.all
        render json: @articles
    end 

    def search
        # search from within redis
        # if not found, search from within db
        #then cache to redis

        if params[:search].blank?
            render json: {error: "Empty field"}
        else
            @articles = Article.search(params[:search])
            render json: @articles
        end

    end
end
