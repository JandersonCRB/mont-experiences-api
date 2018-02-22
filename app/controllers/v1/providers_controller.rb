class V1::ProvidersController < ApplicationController
	def create
		@provider = Provider.new(provider_params)
		@provider.managements.build(user: current_user, role: "owner")

		if @provider.save
			render :show, status: :created
		else
			head(:unauthorized)
		end
	end

	private

		def provider_params
			params.require(:provider).permit(:name, :email, :cpf, :cnpj, :address)
		end
end