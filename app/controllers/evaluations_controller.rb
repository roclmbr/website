class EvaluationsController < ApplicationController
def index
      @evaluations = Evaluation.all
   end
   
   def new
      @evaluation = Evaluation.new
   end
   
   def create
      @evaluation = Evaluation.new(evaluation_params)
      
      if @evaluation.save
         redirect_to evaluations_path, notice: "The evaluation #{@evaluation.name} has been uploaded."
      else
         render "new"
      end
      
   end
   
   def destroy
      @evaluation = Evaluation.find(params[:id])
      @evaluation.destroy
      redirect_to evaluations_path, notice:  "The evaluation #{@evaluation.name} has been deleted."
   end
   
   private
      def evaluation_params
      params.require(:evaluation).permit(:name, :attachment)
   end
end
