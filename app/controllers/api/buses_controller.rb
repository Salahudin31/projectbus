module Api
	class BusesController < ApplicationController
		before_action :authorize_request
		def index
			buses = Bus.order('created_at DESC');
			render json: {status: 'SUCCESS', message: 'Loaded buses', data: buses}, status: :ok
		end

		def show
			bus = Bus.find(params[:id])
			render json: {status: 'SUCCESS', message: 'Loaded bus', data: bus}, status: :ok
		end

		def create
			bus = Bus.new(bus_params)

			if bus.save
				render json: {status: 'SUCCESS', message: 'Saved bus', data: bus}, status: :ok
			else
				render json: {status: 'ERROR', message: 'bus not saved', data: bus.error}, status: :unprocessable_entity
			end
		end

		def destroy
			bus = Bus.find(params[:id])
			bus.destroy
			render json: {status: 'SUCCESS', message: 'Deleted bus', data: bus}, status: :ok
		end

		def update 
			bus = Bus.find(params[:id])
			if bus.update_attributes(bus_params)
				render json: {status: 'SUCCESS', message: 'Updated bus', data: bus}, status: :ok
			else
				render json: {status: 'ERROR', message: 'bus not updated', data: bus.errors}, status: :unprocessable_entity
			end
		end

		private
		def bus_params
			params.permit(:no_bus, :jenis_bus, :jumlah_b, :fasilitas)
		end
	end
end