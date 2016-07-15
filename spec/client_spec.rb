require('spec_helper')

describe(Client) do
  before() do
    Client.clear()
    Stylist.clear()
  end
  describe('.all') do
    it "show all saved clients" do
      client_ruby = Client.new({:name => 'Ruby'})
      client_donald = Client.new({:name => 'Donald'})
      client_ruby.save()
      client_donald.save()
      expect(Client.all()).to(eq([client_ruby, client_donald]))
    end
  end
end
