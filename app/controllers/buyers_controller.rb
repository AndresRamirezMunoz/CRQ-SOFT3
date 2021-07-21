class BuyersController < ApplicationController
    def index
        @buyers = Buyer.all
      end
    
      def new
        @buyer = Buyer.new
      end
    
      def create
        @buyer = Buyer.new(buyer_params)
#        @buyer.active = true
    
        if @buyer.save
    
          redirect_to buyers_path
        else
          render :new
        end
      end
    
      def edit
        @buyer = Buyer.find(params[:id])
      end
    
      def update
        @buyer = Buyer.find(params[:id])
    
        if @buyer.update(buyer_params)
    
          redirect_to buyers_path
        else
          render :edit
        end
      end
    
      def destroy
        @buyer = Buyer.find(params[:id])
#       @buyer.active = !@buyer.active
        if @buyer.save
          redirect_to buyers_path
        else
          render :edit
        end
      end
    
      private
    
      def buyer_params
        params.require(:buyer).permit(:name, :phone, :adress)
      end
end
