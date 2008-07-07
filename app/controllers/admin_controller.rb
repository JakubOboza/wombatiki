class AdminController < ApplicationController
  
  before_filter :check_auth, :except => :login
  
  def index
    @banned = Ban.find(:all)
  end
  
  def login
    if request.post?
       if params[:login][:password] == WOMBATIKI_PASSWORD
         session[:admin] = true
         redirect_to :action => :index
       end
     end
  end
  
  def logout
    clear_session
    redirect_to :controller => :pages , :action => :index
  end
  
  def ban_ip
     if request.post?
       Ban.create( params[:banned_ip] )
     end  
     redirect_to :action => :index
  end
  
  def unban_ip
    Ban.un_ban( params[:ip] )
    redirect_to :action => :index
  end
  
  protected
  
  def clear_session
    session[:admin] = nil
  end
  
end
