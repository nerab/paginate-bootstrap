module PaginateBootstrap
  class Claim
    def catch_phrase
      @city ||= Faker::Company.catch_phrase
    end

    def bs
      @bs ||= Faker::Company.bs
    end

    def to_s
      "#{catch_phrase}: #{bs}"
    end
  end
end
