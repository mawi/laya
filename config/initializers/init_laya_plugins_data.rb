laya_gems = Gem.loaded_specs.select{|x,y| x.include?("laya_")}


laya_gems.each do |x,y|
  begin
    klass = eval(x.camelize)
    klass::Config.init_data
  rescue Exception => e
     p "Failed to load #{x} plugin"
  end


end