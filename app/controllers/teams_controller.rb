class TeamsController < ApplicationController

  def show
    
  end
  
  def index
    sort = params[:sort] || session[:sort] || 'default'
    case sort
    when 'default'
      ordering, @num_members_header = {:users_count => :desc}, 'hilite'
    when 'users_count'
      if params[:sort]
        if session[:ordering]["users_count"] == "desc"
          ordering,@num_members_header = {:users_count => :asc}, 'hilite'
        else
          ordering,@num_members_header = {:users_count => :desc}, 'hilite'
        end
      end
    when 'pending_requests'
      if session[:ordering]["pending_requests"] == "desc"
        ordering,@pending_requests_header = {:pending_requests => :asc}, 'hilite'
      else
        ordering,@pending_requests_header = {:pending_requests => :desc}, 'hilite'
      end
    end
    @all_majors = Team.all_declared
    @selected_majors = params[:major] || session[:major] || {}
    
    if @selected_majors == {}
      @selected_majors = Hash[@all_majors.map {|m| [m, m]}]
    end
    
    if params[:sort] != session[:sort] or params[:major] != session[:major]
      session[:sort] = sort
      session[:major] = @selected_majors
      redirect_to :sort => sort, :major => @selected_majors and return
    end
    
    session[:ordering] = ordering
    # flash[:notice] = "all_majors is #{@all_majors}, and selected_majors is #{@selected_majors}, and selected_majors.keys is #{@selected_majors.keys}"
    #@teams = Team.where(declared: @selected_majors).order(ordering) # this line is bugged?
    @teams = Team.order(ordering)
    
  end
  
  
  def update
  
  end
  
  
 end