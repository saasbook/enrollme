class AdminsController < ApplicationController
  
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
    @admin = Admin.find session[:user_id]
    render 'edit'
  end
  
  def update
    @admin = Admin.find session[:user_id]
    @admin.update_attributes!(admin_params)
    return redirect_to admin_path(@admin.id)
  end

  def show
    @admin = Admin.find_by_id(session[:user_id])
    if @admin.nil?
      session[:user_id] = nil
      session[:is_admin] = false
      return redirect_to '/'
    end
    render 'show'
  end
  
  def approve
    return redirect_to "/", :notice => "Permission denied" if not session[:is_admin] or not session[:user_id]

    @admin = Admin.find session[:user_id]
    @team = Team.find_by_id(params[:team_id])
    @team.approved = true
    @team.save!
    redirect_to admin_path(@admin)
  end
  
  def disapprove
    return redirect_to "/", :notice => "Permission denied" if not session[:is_admin] or not session[:user_id]
    
    @admin = Admin.find session[:user_id]
    @team = Team.find_by_id(params[:team_id])
    @team.approved = false
    @team.save!
    redirect_to admin_path(@admin)
  end
  
  def team_list_email
    @admin = Admin.find session[:user_id]
    AdminMailer.team_list_email(@admin).deliver_now
    
    redirect_to admin_path(@admin)
  end
  
  private
    def admin_params
      params.require(:admin).permit(:name, :email, :password)
    end  
  
end
