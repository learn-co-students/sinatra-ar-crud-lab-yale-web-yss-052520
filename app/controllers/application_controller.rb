
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

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article= Article.find(params[:id])
    erb :edit
  end

  post '/articles' do
    @test =Article.create(params)
    # binding.pry
    redirect "articles/#{@test.id}"
  end

  patch '/articles/:id' do
    # binding.pry
    article = Article.find(params[:id])
    article.update(title: params[:title], content: params[:content])

    redirect "articles/#{params[:id]}"
  end

  delete '/articles/:id' do
    # binding.pry
    article = Article.find(params[:id])
    article.destroy

    redirect "/articles"
  end
end
