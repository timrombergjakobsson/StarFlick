class Star
   attr_accessor :id, :thumbnail_url, :large_url, :medium_url, :index, :orientation, :title, :taken_at
   require 'open-uri'
   
   def initialize attributes = {}
     attributes.each do | name, value|
       send("#{name}=", value)
     end
   end
   
   
   def self.all
     Rails.cache.fetch(self.cache_key, :expires_in => 5.minutes) do
       doc = Nokogiri::XML(open("http://api.flickr.com/services/rest/?method=flickr.photosets"))
     end
   end
  
end                                                     