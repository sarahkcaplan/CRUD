get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params["user"]["email"])
  if @user && @user.password == params[:password]
    login(@logouuser)
    redirect "/users/test"
  else
    @errors = "Incorrect username password combination"
    erb :'sessions/new'
  end
end

delete '/sessions' do
  logout
  redirect '/'
end
