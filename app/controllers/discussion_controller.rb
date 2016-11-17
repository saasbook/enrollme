class DiscussionController < ApplicationController
   
   def create
      innerparams = params[:discussion]
      @disc = Discussion.new({:number => innerparams[:number].to_i, :day => innerparams[:day], :time=>innerparams[:time],
      :capacity => innerparams[:capacity].to_i})
      
      @disc.save!
      redirect_to upload_discussion_info_path
   end
   
   def show
      @discussions = Discussion.all
   end
   
   def submit
      # puts params[:id]
      # @discussions = Discussion.all
      # # @discussions = Discussion.where("select IN (?)", params[:id])
      
      @disc = Discussion.new()
   end
   
   def add
      @disc = Discussion.new()
      
      # discussion_params
      # if @disc.save
      #    redirect_to upload_discussion_info_path, :notice => "You signed up successfully!"
      # else
      #    render upload_discussion_info_path, :notice => "Form is invalid"
      # end
      
      render "/discussion/add.html.erb"
   end
   
   def complete
      params[:task_id]
      # mark checkboxes as complete
      redirect_to upload_discussion_info_path
   end
   
   
#    def discussion_params
#     params.require(:discussion).permit(:number, :day, :time, :capacity)
#  end
   
end