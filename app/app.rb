ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

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
    link = Link.new(title: params[:add_title], url: params[:add_url])
    tag = Tag.create(name: params[:add_tag])
    link.tags << tag
    link.save
    redirect('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
