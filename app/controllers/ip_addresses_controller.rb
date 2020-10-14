class IpAddressesController < ApplicationController
  
  def validate
    render plain: IpAddressService.new(ip_params).validate
  end

  private

  def ip_params
    params.permit(:ip_addresses, ip_addresses: [])
  end
end
