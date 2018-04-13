class V1::BookingsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_booking, only: [:cancel, :show]

	def index
		# @bookings = current_user.bookings.order(:created_at)
		@bookings = policy_scope(Booking)
		authorize @bookings
		render :index, status: :ok
	end

	def update
		@booking = Booking.find(params[:id])
		if @booking.set_status(params[:status],current_user)
			render :show, status: :ok
		else
			head(:unauthorized)
		end
	end

	def cancel
		if @booking.set_status(4, current_user)
			render :show, status: :ok
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
		if @booking.user
			render :show, status: :ok
		else
			head(:unauthorized)
		end
	end

	private
		def set_booking
			@booking = Booking.find(params[:id])
			authorize @booking
		end
		def booking_edit_params
			params.require(:booking).permit(:status)
		end
		def bookings_params
			params.require(:booking).permit(:name, :email, :phone, :dates, :comments, :address, :complement, :adults, :children, :cost, :experience_id, :status)
		end
end
