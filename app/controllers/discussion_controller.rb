class DiscussionController < ApplicationController
   
   def show
      @discussions = Discussion.all
      
   end
   
   def submit
      puts params[:id]
      @discussions = Discussion.all
      
      
      # @discussions = Discussion.where("select IN (?)", params[:id])
   end
   
end