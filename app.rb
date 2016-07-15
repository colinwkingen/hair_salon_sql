require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/stylist'
require './lib/client'
require 'pg'

DB = PG.connect({:dbname => 'hair_salon'})

get('/') do
  @all_stylists = Stylist.all()
  @all_clients = Client.all()
  erb(:index)
end
post('/add_stylist') do
  @newest_stylist = params.fetch('new_stylist')
  Stylist.new({:name => @newest_stylist}).save()
  @all_stylists = Stylist.all()
  @all_clients = Client.all()
  erb(:index)
end
get('/add_stylist') do
  @all_stylists = Stylist.all()
  @all_clients = Client.all()
  erb(:index)
end

post('/add_client') do
  @newest_client = params.fetch('new_client')
  @chosen_stylist = params.fetch('chosen_stylist')
  Client.new({:name => @newest_client, :stylist => @chosen_stylist}).save()
  @all_stylists = Stylist.all()
  @all_clients = Client.all()
  erb(:index)
end
get('/add_client') do
  @all_stylists = Stylist.all()
  @all_clients = Client.all()
  erb(:index)
end

post('/one_stylist') do
  @this_stylist_id = params.fetch('these_clients').to_i
  @this_stylist = Stylist.find(@this_stylist_id)
  erb(:add_clients)
end
