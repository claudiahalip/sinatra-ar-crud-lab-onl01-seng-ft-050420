
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :articles
  end
  
  get '/articles' do 
    @articles = Article.all 
    erb :index 
  end 
  
  get '/articles/new' do
    erb :new
  end 
  
  
  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end 
  
  
  
  get '/articles/:id/edit' do 
     @article = Article.find_by(params[:id])
    erb :edit
  end 
  
  post '/articles'do 
    article = Article.create(title: params[:title], content: params[:content])
    
     redirect to "/articles/#{Article.last.id}"
     
  end 
  
  
  patch '/articles/:id' do 
    article = Article.find_by(params[:id])
    article.update(title: params[:title], content: params[:content])
     redirect to "/articles/#{Article.last.id}"
  end 
  
  delete '/articles/:id' do 
     
     Article.destroy(params[:id])
     redirect to '/articles'
  end 
  
end
