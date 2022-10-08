class ApartmentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound,with: :apartment_not_found


    def index
    render json:Apartment.all,status: :ok
    end
    
    def show
    apartment=find_apartment
    render json:apartment,status: :ok
    end
    
    
    def create
    apartment=Apartment.create!(apartment_params)
    render json:apartment,status: :created
    end
    
    def update
    apartment=find_apartment
    apartment.update(apartment_params)
    render json:apartment,status: :created
    end
    
    def destroy 
    apartment=find_apartment.destroy
    render json:{},status: :ok
    end
    
    private
    
    def apartment_params
    params.permit(:number)
    end
    
    def apartment_not_found
    render json:{error:"Apartment not found"},status: :not_found
    end
    
    def find_apartment
    Apartment.find(params[:id])
    end
end
