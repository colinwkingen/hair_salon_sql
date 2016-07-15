class Client
  attr_reader(:id, :name, :stylist)
  define_method(:initialize) do |attributes|
    @id = attributes[:id] || nil
    @name = attributes.fetch(:name)
    @stylist = attributes.fetch(:stylist)
  end
  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, seesstylist) VALUES ('#{@name}', #{@stylist}) RETURNING id;")
    @id = result.first().fetch('id').to_i
  end
  define_method(:==) do |other_client|
    self.id == other_client.id && self.name == other_client.name && self.stylist == other_client.stylist
  end
  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id};")
  end
  define_method(:update_name) do |name|
    @name = name
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{self.id};")
  end
  define_singleton_method(:clear) do
    DB.exec("DELETE FROM clients")
  end
  define_singleton_method(:find) do |id|
    every_client = Client.all()
    client_lookup = nil
    every_client.each() do |client|
      if client.id == id
        client_lookup = client
      end
    end
    client_lookup
  end
  define_singleton_method(:find_by_stylist) do |id|
    every_client = Client.all()
    client_lookup = []
    every_client.each() do |client|
      if client.stylist.to_i == id
        client_lookup.push(client)
      end
    end
    if client_lookup.length > 0
      client_lookup
    else
      client_lookup = nil
      client_lookup
    end
  end
  define_singleton_method(:all) do
    all_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    all_clients.each() do |client|
      clients.push(Client.new({
        :id => client.fetch('id').to_i,
        :name => client.fetch('name'),
        :stylist => client.fetch('seesstylist')
        }))
    end
    clients
  end
end
