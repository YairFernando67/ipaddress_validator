class IpAddressesController < ApplicationController

  def validate
    render plain: IpAddressService.new(ip_params).call
  end

  private

  def ip_params
    params.require(:ip_addresses).permit(:data, data: [])
  end
end
