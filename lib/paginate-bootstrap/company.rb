module PaginateBootstrap
  class Company < Struct.new(:id, :name)
    class << self
      def all
        @all ||= (1..rand(30..50)).map{|i| Company.new(i, "#{Faker::Company.name} #{Faker::Company.suffix}")}
      end

      def singular
        name.split('::').last
      end

      def plural
        'companies'
      end

      def by_id(id)
        all.select{|t| t.id == id.to_i}.first
      end

      def path
       "/#{singular.downcase}"
      end
    end

    def detail
      @address ||= Address.new
    end

    def path
      "#{self.class.path}/#{id}"
    end

    def img_url
      x = "%02d" % (id + 50)
      w = "2#{x}"
      h = "2#{x}"
      "http://placekitten.com/#{w}/#{h}"
    end
  end
end
