
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  #lists all article instances 
  get '/articles' do 
    @articles = Article.all 
    erb :index 
  end 

  #form to create new article 
  get '/articles/new' do 
    erb :new 
  end 

  #create a new article when called by form 
  post '/articles' do 
    article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{article.id}"  
  end 

  #updates artist after edits 
  patch '/articles/:id' do 
    article = Article.find(params[:id])
    article.update(title: params[:title], content: params[:content])
    redirect "/articles/#{article.id}" 
  end 

  #shows single article 
  get '/articles/:id' do 
    @article = Article.find(params[:id]) 
    erb :show
  end 

  #form to edit article details 
  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])
    erb :edit 
  end 

  delete '/articles/:id' do 
    article = Article.find(params[:id])
    article.destroy 
    redirect '/articles' 
  end 

end
