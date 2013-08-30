get '/' do
  erb :index
end


post '/sign_up' do
  @user = User.create(name: params[:name], email: params[:email], password: params[:password])
    if @user.valid?
    # binding.pry
    # p user
    # p user.errors.full_messages
    session[:user_id]= @user.id
    redirect '/secret_page'
  else
    erb :index
  end
end


post '/sign_in' do

  user = User.find_by_email(params[:email])
  if user
    if user.password == params[:password]
      session[:user_id]= user.id
      redirect '/secret_page'
    end    
  else
    erb :index
  end
end


get '/secret_page' do
  #check if user is in session
  erb :secret_page
end

get '/logout' do
  session.clear
  p session
  erb :index
  end
