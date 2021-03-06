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
post('/stylists') do
  @newest_stylist = params.fetch('new_stylist')
  Stylist.new({:name => @newest_stylist}).save()
  @all_stylists = Stylist.all()
  @all_clients = Client.all()
  erb(:index)
end
post('/clients/:id') do
  @newest_client = params.fetch('new_client')
  @this_stylist = Stylist.find(params.fetch('id').to_i)
  Client.new({:name => @newest_client, :stylist => @this_stylist.id}).save()
  @has_clients = Client.find_by_stylist(@this_stylist.id)
  @all_stylists = Stylist.all()
  @all_clients = Client.all()
  erb(:add_clients)
end
get('/stylists/:id') do
  @this_stylist_id = params.fetch('id').to_i
  @has_clients = Client.find_by_stylist(@this_stylist_id)
  @this_stylist = Stylist.find(@this_stylist_id)
  erb(:add_clients)
end
delete('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i)
  @client.delete()
  redirect to('/')
end
delete('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  @stylist.delete()
  redirect to('/')
end
patch('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i)
  name = params.fetch('client_name')
  @client.update_name(name)
  redirect to('/')
end
patch('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  name = params.fetch('stylist_name')
  @stylist.update_name(name)
  redirect to('/')
end
