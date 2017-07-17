class TeamsController < ApplicationController

  def show
    
  end
  
  def index
    sort = params[:sort] || session[:sort] || 'default'
    case sort
    when 'default'
      ordering, @num_members_header = {:num_members => :desc}, 'hilite'
    when 'num_members'
      if session[:ordering][:num_members] == :desc
        ordering,@num_members_header = {:num_members => :asc}, 'hilite'
      else
        ordering,@num_members_header = {:num_members => :desc}, 'hilite'
      end
    when 'pending_requests'
      if session[:ordering][:pending_requests] == :desc
        ordering,@pending_requests_header = {:pending_requests => :asc}, 'hilite'
      else
        ordering,@pending_requests_header = {:pending_requests => :desc}, 'hilite'
      end
    end
    @majors = Team.all_declared
    @selected_majors = params[:declared] || session[:declared] || {}
    
    if @selected_majors == {}
      @selected_majors = Hash[@majors.map {|major| [major, major]}]
    end
    
    if params[:sort] != session[:sort] or params[:declared] != session[:declared]
      session[:sort] = sort
      session[:declared] = @selected_majors
      redirect_to :sort => sort, :declared => @selected_majors and return
    end
    
    session[:ordering] = ordering
    @teams = Team.where(declared: @selected_majors.keys).order(ordering)
  end
  
  
  def update
  
  end
  
  
 end