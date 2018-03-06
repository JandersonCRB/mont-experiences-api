class V1::BookingsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_booking, only: [:cancel, :show]

	def index
		@bookings = current_user.bookings.order(:created_at)

		render :index, status: :ok
	end

	def update
		# redirect_to root_path if !current_user.admin
		# @booking = Booking.find(params[:id])
		# if @booking.update_column(:status, booking_edit_params[:status])
		# 	flash[:notice] = "Salvo!"
		# 	redirect_to @booking
		# else
		# 	flash[:error] = "Ocorreu um erro!"
		# 	redirect_to edit_booking_path(@booking)
		# end
	end
	def cancel
		if @booking.set_status(4, current_user)
			head(:ok)
		else
			head(:unauthorized)
		end
	end

	def create
		@booking = Booking.new(bookings_params)
		@booking.user = current_user
		@booking.cost = @booking.experience.price * @booking.adults if @booking.adults.present?
		if @booking.save
			render :show, status: :created
		else
			head(:unauthorized)
		end
	end
	def show
		if @booking.user == current_user
			render :show, status: :ok
		else
			head(:unauthorized)
		end
	end
	private
		def set_booking
			@booking = Booking.find(params[:id])
		end
		def booking_edit_params
			params.require(:booking).permit(:status)
		end
		def bookings_params
			params.require(:booking).permit(:name, :email, :phone, :dates, :comments, :address, :complement, :adults, :children, :cost, :experience_id, :status)
		end
end
