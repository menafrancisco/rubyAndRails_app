class ArticlesController < ApplicationController


  #probado git mucho mas


  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

   def show
    @article = Article.find(params[:id])
  end

  def create
  	#render plain: params[:article].inspect
    #render { :plain => params[:article].inspect }

    #----Are of these are the same.
    #render plain: params[:article].inspect
    #render(plain: params[:article].inspect)
    #render :plain => params[:article].inspect
    #render(:plain => params[:article].inspect)

    #The render method here is taking a very simple hash with a key of :plain and value of params[:article].inspect. The params method is the object which represents the parameters (or fields) coming in from the form. The params method returns an ActionController::Parameters object, which allows you to access the keys of the hash using either strings or symbols. In this situation, the only parameters that matter are the ones from the form.




    #@article = Article.new(params[:article])
    #You might be wondering why the A in Article.new is capitalized above, whereas most other references to articles in this guide have used lowercase. In this context, we are referring to the class named Article that is defined in app/models/article.rb. Class names in Ruby must begin with a capital letter.
    #@article = Article.new(params.require(:article).permit(:title, :text))

    @article = Article.new(article_params)

    #@article.save
    #redirect_to @article

      if @article.save
        redirect_to @article
      else
        render 'new'
      end


  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
