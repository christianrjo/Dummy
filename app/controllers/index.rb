enable :sessions

get '/' do
  sessions[:]
  # Look in app/views/index.erb
  erb :index
end


