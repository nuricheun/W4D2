class CatRentalRequestsController < ApplicationController
    def new  
        @cats = Cat.all 
        @cat_rental_request = CatRentalRequest.new 
        render :new 
    end 
end
