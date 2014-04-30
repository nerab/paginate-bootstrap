module PaginateBootstrap
  class Product < Struct.new(:id, :name)
    include Common

    class << self
      def all
        @all ||= (1..rand(10..30)).map{|i| Product.new(i, Faker::Commerce.product_name)}
      end

      def plural
        'products'
      end
    end

    def detail
      @claim ||= Claim.new
    end
  end
end
