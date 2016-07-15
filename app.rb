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
post('/add_client') do
  @newest_client = params.fetch('new_client')
  Client.new({:name => @newest_client}).save()
  @all_stylists = Stylist.all()
  @all_clients = Client.all()
  erb(:index)
end
get('/add_stylist') do
  @all_stylists = Stylist.all()
  @all_clients = Client.all()
  erb(:index)
end
get('/add_client') do
  @all_stylists = Stylist.all()
  @all_clients = Client.all()
  erb(:index)
end
