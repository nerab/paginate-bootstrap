module PaginateBootstrap
  class Company < Struct.new(:id, :name)
    include Common

    class << self
      def all
        @all ||= (1..rand(30..50)).map{|i| Company.new(i, "#{Faker::Company.name} #{Faker::Company.suffix}")}
      end

      def plural
        'companies'
      end
    end

    def detail
      @address ||= Address.new
    end
  end
end
