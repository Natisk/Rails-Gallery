Resque::Server.use(Rack::Auth::Basic) do |user, password|
  user == 'admin'
  password == 'secret'
end