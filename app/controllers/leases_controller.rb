class LeasesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound,with: :lease_not_found

    
    def create
    lease=Lease.create!(lease_params)
    render json:lease,status: :created
    end
    
    
    def destroy 
    lease=find_lease.destroy
    render json:{},status: :ok
    end
    
    private
    
    def lease_params
    params.permit(:apartment_id,:tenant_id,:rent)
    end
    
    def lease_not_found
    render json:{error:"Lease not found"},status: :not_found
    end
    
    def find_lease
    Lease.find(params[:id])
    end

    
end
