class AdminsController < ApplicationController
  
  skip_before_filter :authenticate, :only => ['new', 'create']
  before_filter :validate_admin, :set_admin, :except => ['new', 'create']
  
  def new
    @admin = Admin.new
    render 'new'
  end
  
  def create
    @admin = Admin.new(admin_params)

    if session[:is_admin] == true and @admin.save
      redirect_to admin_path(session[:user_id]), :notice => "You created admin " + admin_params["name"] + " successfully!"
    else
      render 'new', :notice => "Form is invalid"
    end
  end
  
  def edit
    render 'edit'
  end
  
  def update
    @admin.update_attributes!(admin_params)
    return redirect_to admin_path(@admin.id)
  end

  def show
    @teams_li = Team.all.each
    render 'show'
  end
  
  def show_accepted
    @teams_li = Team.where(approved: true)
    render 'show'
  end
  
  def show_pending
    @teams_li = Team.where("approved = ? AND submitted = ?", false, true)
    render 'show'
  end
  
  def forming
    @teams_li = Team.where("approved = ? AND submitted = ?", false, false)
    render 'show'
  end
  
  
  def approve
    @team = Team.find_by_id(params[:team_id])
    @team.approved = true
    @team.save!
    redirect_to admin_path(@admin)
  end
  
  def disapprove
    @team = Team.find_by_id(params[:team_id])
    @team.approved = false
    @team.save!
    redirect_to admin_path(@admin)
  end
  
  def team_list_email
    AdminMailer.team_list_email(@admin).deliver_now
    
    redirect_to admin_path(@admin)
  end
  
  private

  def validate_admin
    if !(session[:is_admin])
      redirect_to '/', :notice => "Permission denied"
    end
  end

  def set_admin
    @admin = Admin.find_by_id session[:user_id]
  end
  
  def admin_params
    params.require(:admin).permit(:name, :email, :password)
  end  
  
end
