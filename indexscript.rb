require 'rubygems'
require 'indextank'

#api_url = "http://:hgIMDuSgR2PZxI@djems.api.indextank.com"
api_url = "http://:iFaogmnQtI163S@8taqg.api.indextank.com"
api = IndexTank::Client.new api_url

index = api.indexes "restaurantIndex"
#index.add

while not index.running?
    sleep 0.5
end
count = 0
Restaurant.find_each( :conditions => "id > 17468" ) do |r|
  count += 1
  #if count % 100 == 0
#    puts count
  #end
  docid = r.id
  text = r.name 
  index.document(docid).add({ :text => text })
  puts r.id.to_s + ": " + text
end

results = index.search "daniel"

print results['matches'], " results\n"
results['results'].each {|doc|
    docid = doc['docid']
    print "docid: #{docid}" 
}