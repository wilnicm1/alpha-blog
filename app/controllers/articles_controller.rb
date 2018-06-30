class ArticlesController < ApplicationController

  def new
  
    @article = Article.new
  end
  
  def create
  #this displays what is being sent in
  #render plain: params[:article].inspect
  @article = Article.new(article_params)
  @article.save
  redirect_to_articles_show(@article)
  end
  
  private
    def article_params
      params.required(:article).permit(:title, :description)
    end

end
