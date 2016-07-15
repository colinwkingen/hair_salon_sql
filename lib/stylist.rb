class Stylist
  attr_reader(:id, :name)
  define_method(:initialize) do |attributes|
    @id = attributes[:id] || nil
    @name = attributes.fetch(:name)
  end
  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end
  define_method(:==) do |other_stylist|
    self.id == other_stylist.id && self.name == other_stylist.name
  end
  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id};")
  end
  define_method(:update_name) do |name|
    @name = name
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{self.id};")
  end
  define_singleton_method(:clear) do
    DB.exec("DELETE FROM stylists")
  end
  define_singleton_method(:find) do |id|
    every_stylist = Stylist.all()
    stylist_lookup = nil
    every_stylist.each() do |stylist|
      if stylist.id == id
        stylist_lookup = stylist
      end
    end
    stylist_lookup
  end
  define_singleton_method(:all) do
    all_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    all_stylists.each() do |stylist|
      stylists.push(Stylist.new({
        :id => stylist.fetch('id').to_i,
        :name => stylist.fetch('name')
        }))
    end
    stylists
  end
end
