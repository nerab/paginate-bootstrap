module PaginateBootstrap
  class Product < Struct.new(:id, :name)
    class << self
      def all
        @all ||= (1..rand(10..30)).map{|i| Product.new(i, Faker::Commerce.product_name)}
      end

      def singular
        name.split('::').last
      end

      def plural
        'products'
      end

      def by_id(id)
        all.select{|t| t.id == id.to_i}.first
      end

      def path
       "/#{singular.downcase}"
      end
    end

    def detail
      @claim ||= Claim.new
    end

    def path
      "#{self.class.path}/#{id}"
    end

    def img_url
      x = "%02d" % (id + 70)
      w = "2#{x}"
      h = "2#{x}"
      "http://placekitten.com/#{w}/#{h}"
    end
  end
end
