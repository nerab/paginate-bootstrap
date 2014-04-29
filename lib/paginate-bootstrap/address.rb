module PaginateBootstrap
  class Address
    def city
      @city ||= Faker::Address.city
    end

    def street_address
      @street_address ||= Faker::Address.street_address
    end

    def zip_code
      @zip_code ||= Faker::Address.zip_code
    end

    def to_s
      "#{street_address}, #{city}, #{zip_code}"
    end
  end
end
