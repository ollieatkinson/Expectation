require 'json'

class Simulator
  
  attr_accessor :name, :version, :udid
  
  def initialize name, version, udid
    @name, @version, @udid = name, version, udid
  end
  
  def self.random pattern: /^iPhone 6$/, min_version: 8.0, max_version: 10.0, exact_version: nil
    
    devices = [ ]
        
    JSON.parse(%x(xcrun simctl list -j devices))["devices"].each do |key, value|
      
      matches = /^iOS (.+)$/.match key
      
      next unless matches
      
      version = matches.captures.first.to_f
      
      matches_version = version > min_version unless min_version.nil?
      matches_version = version < max_version unless max_version.nil?
      
      if matches_version 
        
        value.each do |device|
        
          next unless pattern.match device["name"]
          next unless device["availability"].eql? "(available)"
          
          devices << Simulator.new(device["name"], version, device["udid"])
        
        end
        
      end
      
    end
    
    devices.sample
    
  end
  
  def to_s
    "#{name} #{version} [#{udid}]"
  end
  
end 
