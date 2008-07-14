class PagesController < ApplicationController
  
  before_filter :deny_banned
  before_filter :check_auth, :only => [ :new, :create ]
  
  def show
    @page = Page.find_by_permalink( params[:id] )
    @id = @page.id
    @version = @page.versions.count || 1
    @page = Page.find_by_permalink_and_version( params[:id] , params[:version] )
    @old = params[:version]
  end
  
  def index
    @pages = Page.find(:all) #, :order => "updated_at desc")
  end
  
  def edit
    @page = Page.find(:first, :conditions => [' id = ? ', params[:id] ] )
  end
  
  def revert
    @page = Page.revert_by_page_and_version(params[:page],params[:version])
    redirect_to  :action => :show , :id => @page.permalink
  end
  
  def update
    @page = Page.find(:first, :conditions => [' id = ? ', params[:id] ] )
    if @page.update_attributes(params[:page])
       redirect_to :action => :index
    else
      flash[:error] = "Ups!" 
      render :action => :edit
    end
  end
  
  def new
    render :layout => 'admin'
  end
  
  def create
    @page = Page.create(params[:page])
    if @page.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
end
