
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    new_article = Article.create(params)
    redirect "articles/#{new_article.id}"
  end

  patch '/articles/:id' do
    the_article = Article.find(params[:id])
    # binding.pry
    the_article.update(title: params[:title], content: params[:content])
    redirect "articles/#{new_article.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  delete '/articles/:id' do
    the_article = Article.find(params[:id])
    the_article.destroy
    redirect '/articles'
  end

end
