class DiscussionController < ApplicationController
   
   def show
      @discussions = Discussion.all
      
   end
   
   def submit
      @discussions = Discussion.all
      # @discussions = Discussion.where("rating IN (?)", params[:ratings])
   end
   
end