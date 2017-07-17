class TeamsController < ApplicationController

  def show
    
  end
  
  def index
    sort = params[:sort] || session[:sort]
    case sort
    when 'num_members'
      if session[:sort] == sort # check if the session's sort option is also the one being pressed; if so, reverse the sort
        ordering,@num_members_header = {:num_members => :reverse}, 'hilite'
      else
        ordering,@num_members_header = {:num_members => :desc}, 'hilite'
      end
    when 'pending_requests'
      if session[sort] == sort
        ordering,@pending_requests_header = {:pending_requests => :reverse}, 'hilite'
      else
        ordering,@pending_requests_header = {:pending_requests => :desc}, 'hilite'
      end
    end
    @majors = Team.all_declared
    @selected_majors = params[:declared] || session[:declared] || {}
    
    if @selected_majors == {}
      @selected_majors = Hash[@majors.map {|major| [major, major]}]
    end
    
    if params[:sort] != session[:sort] or params[:ratings] != session[:ratings]
      session[:sort] = sort
      session[:ratings] = @selected_ratings
      redirect_to :sort => sort, :ratings => @selected_ratings and return
    end
    @movies = Movie.where(rating: @selected_ratings.keys).order(ordering)
  end
  
  
  def update
  
  end
  
  
 end