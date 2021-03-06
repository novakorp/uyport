class RequestedDeliveriesController < ApplicationController
	def new		
		@requested_cargo = RequestedCargo.find(params[:requested_cargo_id])
		@requested_delivery = @requested_cargo.requested_deliveries.build 
	end
	
	def create
		@requested_cargo = RequestedCargo.find(params[:requested_cargo_id])
		@requested_delivery = RequestedDelivery.new(params[:requested_delivery])
		@requested_delivery.requested_cargo_id = @requested_cargo.id
		
	  if @requested_delivery.save
		 redirect_to  @requested_cargo 
	  else
		render 'new'
	  end
	end

	def show
	  @requested_delivery = RequestedDelivery.find(params[:id])
	end

	def edit
	  @requested_delivery = RequestedDelivery.find(params[:id])	  
	end

	def update
	  @requested_delivery = RequestedDelivery.find(params[:id])	
	  @requested_cargo = @requested_delivery.requested_cargo
	 
	 if @requested_delivery.update_attributes(params[:requested_delivery].permit(:ammount, :cargo_type_id, :measure_unit_id, :address_id))
		redirect_to @requested_cargo
	  else
		render 'edit'
	 end
	end

	def destroy
	  @requested_delivery = RequestedDelivery.find(params[:id])	
	  @requested_cargo = @requested_delivery.requested_cargo
	  @requested_delivery.destroy
	 
	  redirect_to @requested_cargo
	end
	
end
