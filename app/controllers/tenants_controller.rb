class TenantsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound,with: :tenant_not_found


def index
render json:Tenant.all,status: :ok
end

def show
tenant=find_tenant
render json:tenant,status: :ok
end


def create
tenant=Tenant.create!(tenant_params)
render json:tenant,status: :created
end

def update
tenant=find_tenant
tenant.update(tenant_params)
render json:tenant,status: :created
end

def destroy 
tenant=find_tenant.destroy
render json:{},status: :ok
end

private

def tenant_params
params.permit(:name,:age)
end

def tenant_not_found
render json:{error:"tenant not found"},status: :not_found
end

def find_tenant
Tenant.find(params[:id])
end
end
