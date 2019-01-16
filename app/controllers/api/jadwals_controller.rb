module Api
	class JadwalsController < ApplicationController
		before_action :authorize_request
		
		def index
			jadwals = Jadwal.order('created_at DESC');
			render json: {status: 'SUCCESS', message: 'Loaded jadwals', data: jadwals}, status: :ok
		end

		def show
			jadwal = Jadwal.find(params[:id])
			render json: {status: 'SUCCESS', message: 'Loaded jadwal', data: jadwal}, status: :ok
		end

		def create
			jadwal = Jadwal.new(jadwal_params)

			if jadwal.save
				render json: {status: 'SUCCESS', message: 'Saved jadwal', data: jadwal}, status: :ok
			else
				render json: {status: 'ERROR', message: 'jadwal not saved', data: jadwal.error}, status: :unprocessable_entity
			end
		end

		def destroy
			jadwal = Jadwal.find(params[:id])
			jadwal.destroy
			render json: {status: 'SUCCESS', message: 'Deleted jadwal', data: jadwal}, status: :ok
		end

		def update 
			jadwal = Jadwal.find(params[:id])
			if jadwal.update_attributes(jadwal_params)
				render json: {status: 'SUCCESS', message: 'Updated jadwal', data: jadwal}, status: :ok
			else
				render json: {status: 'ERROR', message: 'jadwal not updated', data: jadwal.errors}, status: :unprocessable_entity
			end
		end

		private
		def jadwal_params
			params.permit(:tgl_b, :jam_b, :status_bangku, :bus_id)
		end
	end
end