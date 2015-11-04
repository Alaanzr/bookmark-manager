require 'sinatra/base'
require_relative 'models/link'

ENV['RACK_ENV'] ||= 'development'

class BookmarkManager < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}

  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    @title = params[:add_title]
    @url = params[:add_url]
    Link.create(title: @title, url: @url)
    redirect('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
