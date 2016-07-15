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
  @chosen_stylist = params.fetch('chosen_stylist').to_i
  @this_stylist = Stylist.find(@chosen_stylist)
  Client.new({:name => @newest_client, :stylist => @chosen_stylist}).save()
  @has_clients = Client.find_by_stylist(@this_stylist.id)
  @all_stylists = Stylist.all()
  @all_clients = Client.all()
  erb(:add_clients)
end
get('/add_client') do
  @this_stylist = Stylist.find(@chosen_stylist)
  @has_clients = Client.find_by_stylist(@this_stylist.id.to_i)
  @all_stylists = Stylist.all()
  @all_clients = Client.all()
  erb(:add_clients)
end
post('/one_stylist') do
  @this_stylist_id = params.fetch('these_clients').to_i
  @has_clients = Client.find_by_stylist(@this_stylist_id)
  @this_stylist = Stylist.find(@this_stylist_id)
  erb(:add_clients)
end
delete('/remove_client') do
  @client = Client.find(params.fetch('chosen_client').to_i)
  @client.delete()
  redirect to('/')
end
delete('/remove_stylist') do
  @stylist = Stylist.find(params.fetch('chosen_stylist').to_i)
  @stylist.delete()
  redirect to('/')
end
patch('/change_client_name') do
  @client = Client.find(params.fetch('chosen_client').to_i)
  name = params.fetch('client_name')
  @client.update_name(name)
  redirect to('/')
end
patch('/change_stylist_name') do
  @stylist = Stylist.find(params.fetch('chosen_stylist').to_i)
  name = params.fetch('stylist_name')
  @stylist.update_name(name)
  redirect to('/')
end
