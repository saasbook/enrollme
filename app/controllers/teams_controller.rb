class TeamsController < ApplicationController

  def show
    
  end
  
  def index
    sort = params[:sort] || session[:sort]
    case sort
    when 'num_members'
      ordering,@num_members_header = {:num_members => :desc}, 'hilite'
    when 'pending_requests'
      ordering,@pending_requests_header = {:pending_requests => :desc}, 'hilite'
    end
    @majors = Team.all_declared
    @selected_majors = params[:ratings] || session[:ratings] || {}
    
    if @selected_ratings == {}
      @selected_ratings = Hash[@all_ratings.map {|rating| [rating, rating]}]
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