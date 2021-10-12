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
    Bookmarks.create(params[:url])
    redirect to('/')
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  run! if app_file == $0
end
