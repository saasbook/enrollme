class DiscussionController < ApplicationController
   
   def show
      @discussions = Discussion.all
   end
   
   def submit
      puts params[:id]
      @discussions = Discussion.all
      # @discussions = Discussion.where("select IN (?)", params[:id])
   end
   
   def add
      puts "EECS"
   end
   
   def complete
      params[:task_id]
      # mark checkboxes as complete
      redirect_to upload_discussion_info_path
   end
   
end