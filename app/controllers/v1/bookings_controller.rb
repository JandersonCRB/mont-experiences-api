class V1::BookingsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :index, :create, :show]
	def index
		@bookings = current_user.bookings.order(:created_at)
	end
	def edit
		redirect_to root_path if !current_user.admin
		@booking = Booking.find(params[:id])
		params[:status] = @booking.status if @booking.status.present?
	end
	def update
		redirect_to root_path if !current_user.admin
		@booking = Booking.find(params[:id])
		if @booking.update_column(:status, booking_edit_params[:status])
			flash[:notice] = "Salvo!"
			redirect_to @booking
		else
			flash[:error] = "Ocorreu um erro!"
			redirect_to edit_booking_path(@booking)
		end
	end
	def cancel
		@booking = Booking.find(params[:id])
		if @booking.set_status(4, current_user)
			flash[:notice] = "Salvo com sucesso!"
		else
			flash[:error] = "Você não permissão para cancelar este agendamento."
		end
		redirect_to booking_path(@booking)
	end

	def create
		@booking = Booking.new(bookings_params)
		@booking.user = current_user
		@experience_id = @booking.experience_id
		@booking.cost = @booking.experience.price * @booking.adults if @booking.adults.present?
		if @booking.save
			flash[:notice] = "Agendado com sucesso!"
			redirect_to booking_path(@booking)
		else
	    	session[:booking] = params[:booking]
	    	redirect_to new_booking_path(@experience_id)
   		end
	end
	def show
		@booking = Booking.find(params[:id])
		redirect_to bookings_path if @booking.user != current_user && !current_user.admin
	end
	private
		def booking_edit_params
			params.require(:booking).permit(:status)
		end
		def bookings_params
	   		params.require(:booking).permit(:name, :email, :phone, :dates, :comments, :address, :complement, :adults, :children, :cost, :experience_id, :status)
	  	end
end
