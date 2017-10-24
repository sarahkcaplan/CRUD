get '/sessions/new' do
  erb :'session/new'
end

post '/sessions' do
  @user = User.find(params[:email])
  if @user && @user.password == params[:password]
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Incorrect username password combination"]
    erb :'sessions/new'
  end
end

get '/logout' do
  logout
  redirect '/'
end

