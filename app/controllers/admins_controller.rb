class AdminsController < ApplicationController
  
  def new
    @admin = Admin.new
    session[:is_admin] = true
    render 'new'
  end
  
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      session[:is_admin] = true
      session[:user_id] = @admin.id
      redirect_to admin_path(@admin.id), :notice => "You signed up successfully!"
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
    @admin = Admin.find(session[:user_id])
    render 'show'
  end
  
  private
    def admin_params
      params.require(:admin).permit(:name, :email, :password)
    end  
  
end