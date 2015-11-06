ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  set :views, proc {File.join(root, '..', 'views')}

  get '/' do
    @user = User.new
    erb :signup
  end

  post '/signup-details' do
    session[:username] = params[:username]
    @user = User.new(username: params[:username], email: params[:email], password_hash: params[:password], password_hash_confirmation: params[:password_confirmation])
    if @user.save
      redirect('/welcome')
    else
      flash.now[:error] = 'Password and confirmation password do not match'
      erb :signup
    end
  end

  get '/welcome' do
    @username = session[:username]
    erb :welcome
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(title: params[:add_title], url: params[:add_url])
    params[:add_tag].split.each do |tag|
      link.tags << Tag.create(name: tag.downcase)
    end
    link.save
    redirect to('/links')
  end

  post '/tags' do
    tag = Tag.all(name: (params[:filter_tags].downcase))
    @links = tag ? tag.links : []
    erb :'tags/example'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
