class ArticlesController < ApplicationController

  def new
  
    @article = Article.new
  end
  
  def create
  #this displays what is being sent in
  #render plain: params[:article].inspect
  @article = Article.new(article_params)
  
  if @article.save
  
  flash[:notice] = "Article was successfully created"  
  redirect_to article_path(@article)
  else
    render 'new'
  end
  end

  def show 
  # redirect_to_articles_show(@article)
  @article = Article.find(params[:id])
  end
  
  private
    def article_params
      params.required(:article).permit(:title, :description)
    end

end
