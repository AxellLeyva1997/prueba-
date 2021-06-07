class ArticlesController < ApplicationController
    before_action :show, except: [:new, :create, :index, :from_author, :article_params]
    before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy, :index]

    def index
        @articles = Article.all
    end

    def show 
        @article=Article.find(params[:id])
    end
    
    def new
        @article=Article.new
        @categories = Category.all
    end
    
    def create
        @article=Article.create(article_params)
       
        @article.save_categories
        redirect_to @article
    end
    def edit
        @categories = Category.all
        puts "\n\n\n #{@article.persisted?} \n\n\n"
    end
    def update
        
        @article.update(article_params)
        @article.save_categories

        
        redirect_to @article
    end

    def from_author
       @user=User.find(params[:user_id])
    end
    
    def destroy
        
        @article.destroy
        redirect_to root_path
    end
    
    def article_params
        params.require(:article).permit(:title,:content, category_elements: [])
    end
     
end
