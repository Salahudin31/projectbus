module Api
	class RutesController < ApplicationController
		before_action :authorize_request
		
		def index
			rutes = Rute.order('created_at DESC');
			render json: {status: 'SUCCESS', message: 'Loaded rutes', data: rutes}, status: :ok
		end

		def show
			rute = Rute.find(params[:id])
			render json: {status: 'SUCCESS', message: 'Loaded rute', data: rute}, status: :ok
		end

		def create
			rute = Rute.new(rute_params)

			if rute.save
				render json: {status: 'SUCCESS', message: 'Saved rute', data: rute}, status: :ok
			else
				render json: {status: 'ERROR', message: 'rute not saved', data: rute.error}, status: :unprocessable_entity
			end
		end

		def destroy
			rute = Rute.find(params[:id])
			rute.destroy
			render json: {status: 'SUCCESS', message: 'Deleted rute', data: rute}, status: :ok
		end

		def update 
			rute = Rute.find(params[:id])
			if rute.update_attributes(rute_params)
				render json: {status: 'SUCCESS', message: 'Updated rute', data: rute}, status: :ok
			else
				render json: {status: 'ERROR', message: 'rute not updated', data: rute.errors}, status: :unprocessable_entity
			end
		end

		private
		def rute_params
			params.permit(:start, :end)
		end
	end
end