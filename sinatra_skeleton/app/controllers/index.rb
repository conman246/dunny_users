enable :sessions

get '/' do

  # login screen

  erb :index
end

get '/sign_up' do

  # request form document



  erb :sign_up
end

post '/secret' do

  # login; 
  user = User.authenticate(params[:email], params[:password])

  if user
    session[:value] = user.id
    erb :secret 
  else
    redirect to('/')
  end

end

post '/create_users' do

  # create a user in db

  user = User.create(:name => params[:name], 
                      :email => params[:email],
                      :password => params[:password]
                      )

  session[:value] = user.id
  
  redirect to('/')
end

get '/logout' do
  session.clear
  redirect to('/')
end




