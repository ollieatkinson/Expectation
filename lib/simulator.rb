class Simulator
  
  attr_accessor :name, :type, :version, :udid
  
  def initialize captures
    @name, @type, @version, @udid = captures
  end
  
  def self.random ignore: /travis|watch|tv/i, match: 'iPhone', version: 8.0
    
    pattern = %r{ ^([\w\-]+)\s+(.*)\s+\((.*)\) .* \[(.*)\] }x

    Simulator.new IO.popen("xcrun instruments -s | cat").reject  { |line| 
      ignore =~ line || pattern !~ line 
    }.map { |line| 
      pattern.match(line).captures 
    }.select { |capture| 
      capture[2].to_f > version && capture[2].to_f < version + 1 and capture[0].include?(match)
    }.sample
    
  end
  
  def to_s
    "#{name} #{type} #{version} [#{udid}]"
  end
  
end 
