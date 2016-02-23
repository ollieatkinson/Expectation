class Simulator
  
  attr_accessor :name, :version, :udid
  
  def initialize captures
    @name, @version, @udid = captures
  end
  
  def self.random ignore: /travis|watch|tv/i, match: /^iPhone 6$/, min_version: 8.0, max_version: 10.0, exact_version: nil
    
    pattern = %r{^(.+)\(([\d\.]+)\)\s\[(.+)\]$}x

    Simulator.new IO.popen("xcrun instruments -s | cat").reject  { |line| 
      ignore =~ line || pattern !~ line 
    }.map { |line| 
      pattern.match(line).captures 
    }.select { |capture| 
      
      matches_device  = false
      matches_version = false
      
      device  = capture[0].strip
      version = capture[1].to_f
      
      matches_device = match =~ device       if match.is_a? Regexp
      matches_device = device.include? match if match.is_a? String
      
      if exact_version.nil?
        matches_version = version > min_version unless min_version.nil?
        matches_version = version < max_version unless max_version.nil?
      else
        matches_version = version == exact_version
      end
      
      matches_version and matches_device
      
    }.sample
    
  end
  
  def to_s
    "#{name} #{version} [#{udid}]"
  end
  
end 
