# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def permalink_path(page)
    "/pages/#{page.permalink}"
  end
  
  def select_version(version)
    str = %q{<select name="version" id="version" onchange="show_version()"><option value=""></option>}
    version.to_i.downto(1) do |x|
       str += "<option value=\"#{x}\">#{x}</option>"
    end
    str += %q{</select>}
    str
  end
  
  def revert_page_link(id,version)
    "/pages/revert?page=#{id}&version=#{version}"
  end
  
  
  def is_logged_in?
    (session[:admin])?(true):(false)
  end
  
  
end