module NetworkManager::Ip4Helper  
  # '1.0.0.10.in-addr.arpa' => '10.0.0.1'
  def self.to_arpa_to_dot_decimal(ip_address)
    IPAddress::IPv4.new(ip_address.arpa.gsub(/.in-addr.arpa/, ''))
  end
  
  # 167772161 => '1.0.0.10' => '1.0.0.10.in-addr.arpa' => '10.0.0.1'
  def self.arpa_u32_to_dot_decimal(arpa_u32)
    to_arpa_to_dot_decimal(IPAddress::IPv4.parse_u32(arpa_u32))
  end
  
  # '10.0.0.1' => '1.0.0.10.in-addr.arpa' => '1.0.0.10'
  def self.dot_decimal_to_arpa(dot_decimal)
    to_arpa_to_dot_decimal(IPAddress::IPv4.new(dot_decimal))
  end
end