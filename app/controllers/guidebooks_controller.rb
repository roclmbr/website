class GuidebooksController < ApplicationController
    
   def index
      @guidebooks = Guidebook.all
   end
   
   def new
       @guidebook = Guidebook.new
   end
   
   def create
       @guidebook = Guidebook.new(guidebook_params)
      
       if @guidebook.save
           redirect_to guidebooks_path, notice: "The photo #{@guidebook.name} has been uploaded."
      else
         render "new"
      end
      
   end
    
    def edit
        @guidebook = Guidebook.find(params[:id])
    end
    
    def update
        @guidebook = Guidebook.find(params[:id])
        if @guidebook.update(guidebook_params)
            flash[:success] = "Route was successfully updated"
            redirect_to guidebook_path(@category)
        else
            render 'edit'
        end
    end
   
   def destroy
       @guidebook = Guidebook.find(params[:id])
       @guidebook.destroy
       redirect_to guidebooks_path, notice:  "The resume #{@guidebook.name} has been deleted."
   end
   
   private
    def guidebook_params
        params.require(:guidebook).permit(:name, :description)
   end
end
