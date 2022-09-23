desc '####################### load studies'
task load_studies: :environment do
  puts 'Executing...'


  data_dir = Pathname.new(APP_CONFIG[:data_dir])

  all = 0
  found = 0

  list_dois = []


  ## initial load from file
  #status_id = 2
  #File.open(data_dir + "dois.txt") do |f|
  #  while(l = f.gets) do
  #    list_dois.push(l.chomp.strip)
  #  end
  #end

  ## load from db last submitted dois
  list_dois = Study.join(:status).where(:status => {:name => 'submitted'})
  status_id = 1
  
  list_dois.each do |doi|
    
    if doi.size > 0
      h = CustomFetch.doi_info(doi)
      h[:status_id] = status_id
      #        puts h.to_json
      all+=1
      if h.keys.size > 0 and h[:first_author] != nil and h[:title]
        found+=1
        s = Study.where(:doi => doi).first
        if !s
          s = Study.new(h)
          s.save
        else
          #            h[:key] = Basic.create_key(Study, 6) if !s.key
          s.update_attributes(h)
        end
      else
        puts "#{doi}: Not found"
      end
      
    end
  end
  puts all
  puts found
  
end
