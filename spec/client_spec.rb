require('spec_helper')

describe(Client) do
  before() do
    Stylist.clear()
    Client.clear()
  end
  describe('.all') do
    it "show all saved clients" do
      client_gwen = Client.new({:name => 'Gwen'})
      client_walter = Client.new({:name => 'Walter'})
      client_gwen.save()
      client_walter.save()
      expect(Client.all()).to(eq([client_gwen, client_walter]))
    end
  end
  describe('#save') do
    it "stores new clients in the database" do
      client_gwen = Client.new({:name => 'Gwen'})
      client_gwen.save()
      expect(Client.all()).to(eq([client_gwen]))
    end
  end
  describe('#==') do
    it "checks the values in client objects from the database against each other" do
      client_walter1 = Client.new({:name => 'Walter'})
      client_walter2 = Client.new({:name => 'Walter'})
      expect(client_walter1).to(eq(client_walter2))
    end
  end
  describe('.find') do
    it "finds clients by their id" do
      client_gwen = Client.new({:name => 'Gwen'})
      client_walter = Client.new({:name => 'Walter'})
      client_gwen.save()
      client_walter.save()
      expect(Client.find(client_gwen.id)).to(eq(client_gwen))
    end
  end
  describe('#delete') do
    it "deletes clients from the database" do
      client_gwen = Client.new({:name => 'Chuck'})
      client_walter = Client.new({:name => 'Wallace'})
      client_gwen.save()
      client_walter.save()
      client_walter.delete()
      expect(Client.all()).to(eq([client_gwen]))
    end
  end
  describe('#update_name') do
    it "will update the name property of a given Client" do
      client_gwen = Client.new({:name => 'Gwen'})
      client_gwen.save()
      client_gwen.update_name('Synthia')
      expect(client_gwen.name).to(eq('Synthia'))
    end
  end
  describe('.clear') do
    it "will clear out the clients table in the hair salon database" do
      client_gwen = Client.new({:name => 'Gwen'})
      client_walter = Client.new({:name => 'Walter'})
      client_gwen.save()
      client_walter.save()
      Client.clear()
      expect(Client.all()).to(eq([]))
    end
  end
end
