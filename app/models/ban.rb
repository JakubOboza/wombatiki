class Ban < ActiveRecord::Base
  
  def self.un_ban(ip)
    Ban.find(:first, :conditions => ['banned_ip = ?',ip] ).destroy
  end
  
end
