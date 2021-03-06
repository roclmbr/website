class ReceiptsController < ApplicationController
 def index
      @receipts = Receipt.all
   end
   
   def new
      @receipt = Receipt.new
   end
   
   def create
      @receipt = Receipt.new(receipt_params)
      
      if @receipt.save
         redirect_to receipts_path, notice: "The receipt #{@receipt.name} has been uploaded."
      else
         render "new"
      end
      
   end
   
   def destroy
      @receipt = Receipt.find(params[:id])
      @receipt.destroy
      redirect_to receipts_path, notice:  "The receipt #{@receipt.name} has been deleted."
   end
   
   private
      def receipt_params
      params.require(:receipt).permit(:name, :attachment)
   end
end
