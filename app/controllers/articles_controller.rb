class ArticlesController < ApplicationController

    skip_before_action :verify_authenticity_token   #=> これを記述することで、CSRFを解除！

    def show
        @article= Article.find_by!(slug: params[:slug])
        render json: {
            "article": {
              "slug": @article.slug,
              "title": @article.title,
              "description": @article.description,
              "body": @article.body,
              "tagList": @article.tag_list,
              "createdAt": @article.created_at,
              "updatedAt": @article.updated_at
              }
            }
    end

    def create
        @article = Article.new(article_params)
        if @article.save
          render json: {
            "article": {
              "slug": @article.slug,
              "title": @article.title,
              "description": @article.description,
              "body": @article.body,
              "tag_list": @article.tag_list,
              "createdAt": @article.created_at || Time.current,
              "updatedAt": @article.updated_at || Time.current
              }
            }
        else
          render json: @article.errors, status: :unprocessable_entity
        end
    end

    def update
        @article= Article.find_by!(slug: params[:slug])
        if @article.update(article_params)
          render json: {
            "article": {
              "slug": @article.slug,
              "title": @article.title,
              "description": @article.description,
              "body": @article.body,
              "tag_list": @article.tag_list,
              "createdAt": @article.created_at || Time.current,
              "updatedAt": @article.updated_at || Time.current
              }
            }
          else
            render json: @article.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @article= Article.find_by!(slug: params[:slug])
        @article.destroy
    end

    private

    def article_params
        params.require(:article).permit(:slug, :title, :description, :body, :tag_list)
        #permitでアップデートしたいものだけを指定する
    end
end


  

