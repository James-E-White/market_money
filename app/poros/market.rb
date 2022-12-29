class Market
  attr_reader :fmid,
              :name, 
              :street,
              :city,
              :county,
              :state,
              :zip

  def initialize(data)
    binding.pry
    @fmid = data[:fmid]
    @name = data[:name]
    @street = data[:street]
    @city = data[:city]
    @county = data[:county]
    @state = data[:state]
    @zip = data[:zip]
  end
end