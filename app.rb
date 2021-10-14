require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  post '/add' do
    Bookmarks.create(params[:url], params[:title])
    redirect to('/')
  end

  post '/delete/:id' do
    p "Deleting bookmark"
    p Bookmarks.all
    Bookmarks.delete(id: params[:id])
    p "Bookmark deleted"
    p Bookmarks.all
    redirect to('/bookmarks')
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  run! if app_file == $0
end
