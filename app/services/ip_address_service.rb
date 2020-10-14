require 'resolv'

class IpAddressService
  def initialize(params)
    @params = params
    @regex = /^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$/
  end

  def validate
    case @params[:ip_addresses]
    when String then validate_string
    when Array then validate_array
    end
  end

  private

  def validate_array
    ip_valid = false
    @params[:ip_addresses].each do |ip|
      ip_valid = is_valid?(ip)
    end
    return @params[:ip_addresses].join(", ") if ip_valid
    "Invalid Address"
  end

  def validate_string
    return @params[:ip_addresses] if is_valid?(@params[:ip_addresses])
    "Invalid Address"
  end

  # def is_valid?(ip_address)
  #   Resolv::IPv4::Regex.match?(ip_address) || Resolv::IPv6::Regex.match?(ip_address)
  # end

  # def is_valid?(ip_address)
  #   @regex.match?(ip_address) || @regex.match?(ip_address)
  # end

  def is_valid?(ip_address)
    segments = ip_address.split('.')
    return false if segments.size != 4
    segments.all? { |seg| seg.to_i.between?(0,255) }
  end
end