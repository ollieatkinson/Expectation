require 'json'

class Simulator
   
  attr_accessor :name, :version, :udid
   
  def initialize captures
    @name, @version, @udid = captures
  end
   
  def self.random match: /^iPhone 6$/, min_version: 8.0, max_version: 10.0, exact_version: nil
     
    Simulator.new JSON.parse(`xcrun simctl list --json`)
    .fetch('devices')
    .reduce([], &valid_devices)
    .select { |device| os_version_in_range(device, min_version, max_version, exact_version) && device_name_matches(device, match) }
    .sample
    .values_at "name", "version", "udid"
     
  end
   
  def to_s
    "#{name} #{version} [#{udid}]"
  end
   
  private
   
  def self.os_version_in_range device, min_version, max_version, exact_version
    min_version, max_version = exact_version, exact_version if exact_version
     
    device.fetch('version').between?(min_version || -1, max_version || 9999)
  end
   
  def self.device_name_matches device, pattern
    !(pattern =~ device.fetch('name')).nil?
  end
   
  def self.valid_devices
    -> updated_devices, (os, devices) {
      version = os[/ios ([\d.]*)/i, 1]
      updated_devices += devices.map { |device| device.merge('version' => version.to_f) } if version
      updated_devices
    }
  end
   
end
