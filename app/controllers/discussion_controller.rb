class DiscussionController < ApplicationController
   
   def show
      @discussions = Discussion.all
      
   end
   
   def submit
      
   end
   
   
    
end