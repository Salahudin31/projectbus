module Api
	class BangkusController < ApplicationController
		before_action :authorize_request
		
		def index
			bangkus = Bangku.order('created_at DESC');
			render json: {status: 'SUCCESS', message: 'Loaded bangkus', data: bangkus}, status: :ok
		end

		def show
			bangku = Bangku.find(params[:id])
			render json: {status: 'SUCCESS', message: 'Loaded bangku', data: bangku}, status: :ok
		end

		def create
			bangku = Bangku.new(bangku_params)

			if bangku.save
				render json: {status: 'SUCCESS', message: 'Saved bangku', data: bangku}, status: :ok
			else
				render json: {status: 'ERROR', message: 'bangku not saved', data: bangku.error}, status: :unprocessable_entity
			end
		end

		def destroy
			bangku = Bangku.find(params[:id])
			bangku.destroy
			render json: {status: 'SUCCESS', message: 'Deleted bangku', data: bangku}, status: :ok
		end

		def update 
			bangku = Bangku.find(params[:id])
			if bangku.update_attributes(bangku_params)
				render json: {status: 'SUCCESS', message: 'Updated bangku', data: bangku}, status: :ok
			else
				render json: {status: 'ERROR', message: 'bangku not updated', data: bangku.errors}, status: :unprocessable_entity
			end
		end

		private
		def bangku_params
			params.permit(:no_bangku, :keterangan, :bus_id, :jadwal_id)
		end
	end
end