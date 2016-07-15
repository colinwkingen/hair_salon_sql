require('spec_helper')

describe(Stylist) do
  before() do
    Client.clear()
    Stylist.clear()
  end
  describe('.all') do
    it "show all saved stylists" do
      stylist_sarah = Stylist.new({:name => 'Sarah'})
      stylist_conrad = Stylist.new({:name => 'Conrad'})
      stylist_sarah.save()
      stylist_conrad.save()
      expect(Stylist.all()).to(eq([stylist_sarah, stylist_conrad]))
    end
  end
  describe('#save') do
    it "stores new stylists in the database" do
      stylist_sarah = Stylist.new({:name => 'Sarah'})
      stylist_sarah.save()
      expect(Stylist.all()).to(eq([stylist_sarah]))
    end
  end
  describe('#==') do
    it "checks the values in stylist objects from the database against each other" do
      stylist_conrad1 = Stylist.new({:name => 'Conrad'})
      stylist_conrad2 = Stylist.new({:name => 'Conrad'})
      expect(stylist_conrad1).to(eq(stylist_conrad2))
    end
  end
  describe('.find') do
    it "finds stylists by their id" do
      stylist_sarah = Stylist.new({:name => 'Sarah'})
      stylist_conrad = Stylist.new({:name => 'Conrad'})
      stylist_sarah.save()
      stylist_conrad.save()
      expect(Stylist.find(stylist_sarah.id)).to(eq(stylist_sarah))
    end
  end
  describe('#delete') do
    it "deletes stylists from the database" do
      stylist_sarah = Stylist.new({:name => 'Chuck'})
      stylist_conrad = Stylist.new({:name => 'Wallace'})
      stylist_sarah.save()
      stylist_conrad.save()
      stylist_conrad.delete()
      expect(Stylist.all()).to(eq([stylist_sarah]))
    end
  end
  describe('#update_name') do
    it "will update the name property of a given Stylist" do
      stylist_sarah = Stylist.new({:name => 'Sarah'})
      stylist_sarah.save()
      stylist_sarah.update_name('Synthia')
      expect(stylist_sarah.name).to(eq('Synthia'))
    end
  end
  describe('.clear') do
    it "will clear out the stylists table in the hair salon database" do
      stylist_sarah = Stylist.new({:name => 'Sarah'})
      stylist_conrad = Stylist.new({:name => 'Conrad'})
      stylist_sarah.save()
      stylist_conrad.save()
      Stylist.clear()
      expect(Stylist.all()).to(eq([]))
    end
  end
end
