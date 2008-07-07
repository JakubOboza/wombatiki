class Page < ActiveRecord::Base
  acts_as_versioned

  validates_presence_of :name
  validates_presence_of :content
  validates_uniqueness_of :permalink

  def before_save
    self.permalink = self.name.strip.downcase.gsub(/\s+/, '-')
  end


  def self.find_by_permalink(permalink)
    Page.find( :first,:conditions => [' permalink = ?', permalink ] )
  end

  def self.find_by_permalink_and_version(permalink,version)
    if version.nil?
      Page.find(:first,:conditions => ['permalink = ?',permalink])
    else
      Page.find(:first,:conditions => ['permalink = ?',permalink]).versions.find_by_version(version)
    end
  end

  def self.revert_by_page_and_version(page_id,version)
    @page = Page.find(:first,:conditions => ['id = ?',page_id])
    @page.revert_to(version)
    @page.save
    @page
  end

end
