class DiscussionController < ApplicationController
   
   def create
      innerparams = params[:discussion]
      @disc = Discussion.new({:number => innerparams[:number].to_i, :day => innerparams[:day], :time=>innerparams[:time],
      :capacity => innerparams[:capacity].to_i})
      
      if @disc.save
         return redirect_to discussion_index_path
      else
         render '/discussion/add.html.erb'
      end
   end
   
   def index
      @discussions = Discussion.all
   end
   

   def new
      @disc = Discussion.new()
      
      # discussion_params
      # if @disc.save
      #    redirect_to upload_discussion_info_path, :notice => "You signed up successfully!"
      # else
      #    render upload_discussion_info_path, :notice => "Form is invalid"
      # end
      
      render "/discussion/add.html.erb"
   end
   
   
   def discussion_params
      params.require(:discussion).permit(:number, :day, :time, :capacity)
   end
   
   def edit_index
      @discussions = Discussion.all
      render '/discussion/edit_index.html.erb'
   end
   
   def edit_index_post
      @disc = Discussion.find(params[:edit_disc][:edit_disc])
      render "/discussion/add.html.erb"
   end
   
end