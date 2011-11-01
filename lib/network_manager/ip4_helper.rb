module NetworkManager::Ip4Helper
  def self.ip4_integer_to_dot_decimal(ip4_integer)
    integer = ip4_integer
    result = []
    4.times.map do
      # bitwise AND 255 bits
      result.push integer & 255

      # bitwise SHIFT RIGHT 8 bits
      integer = integer >> 8
    end
    result.join '.'
  end
end