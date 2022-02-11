class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  # http_basic_authenticate_with name: "ravi", password: "ravi", except: [:index, :show]
  http_basic_authenticate_with name: "ravi", password: "delete", only: :destroy
  def index
    @artcles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    if @article.save
      redirect_to articles_path
    else
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to root_path, status: :see_other
    else
      puts "something wents wrong"
    end
  end

end

