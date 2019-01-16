module Api
	class PesananTiketsController < ApplicationController
		before_action :authorize_request
		
		def index
			pesanan_tikets = PesananTiket.order('created_at DESC');
			render json: {status: 'SUCCESS', message: 'Loaded pesanan_tikets', data: pesanan_tikets}, status: :ok
		end

		def show
			pesanan_tiket = PesananTiket.find(params[:id])
			render json: {status: 'SUCCESS', message: 'Loaded pesanan_tiket', data: pesanan_tiket}, status: :ok
		end

		def create
			pesanan_tiket = PesananTiket.new(pesanan_tiket_params)

			if pesanan_tiket.save
				render json: {status: 'SUCCESS', message: 'Saved pesanan_tiket', data: pesanan_tiket}, status: :ok
			else
				render json: {status: 'ERROR', message: 'pesanan_tiket not saved', data: pesanan_tiket.error}, status: :unprocessable_entity
			end
		end

		def destroy
			pesanan_tiket = PesananTiket.find(params[:id])
			pesanan_tiket.destroy
			render json: {status: 'SUCCESS', message: 'Deleted pesanan_tiket', data: pesanan_tiket}, status: :ok
		end

		def update 
			pesanan_tiket = PesananTiket.find(params[:id])
			if pesanan_tiket.update_attributes(pesanan_tiket_params)
				render json: {status: 'SUCCESS', message: 'Updated pesanan_tiket', data: pesanan_tiket}, status: :ok
			else
				render json: {status: 'ERROR', message: 'pesanan_tiket not updated', data: pesanan_tiket.errors}, status: :unprocessable_entity
			end
		end

		private
		def pesanan_tiket_params
			params.permit(:nama_pen, :no_telp, :alamat, :status_pem, :jmlh_pem, :bangku_id, :jadwal_id)
		end
		
	end
end