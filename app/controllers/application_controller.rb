
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do 
    @articles = Article.all()
    erb :index
  end 

  get '/articles/new' do 
    erb :new
  end

  get '/articles/:id' do 
    @article = find_article(params)
    erb :show
  end

  get '/articles/:id/edit' do
    @article = find_article(params)
    erb :edit
  end

  post '/articles' do 
    article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{article.id}"
  end

  patch '/articles/:id' do 
    article = find_article(params).update(title: params[:title], content: params[:content])
    redirect "/articles/#{article.id}"
  end 

  delete  '/articles/:id' do 
    Article.delete(params[:id])
    redirect '/articles'
  end
  
  def find_article(params)
    Article.find(params[:id])
  end
end
