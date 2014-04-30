module PaginateBootstrap
  module Common
    module ClassMethods
      def singular
        name.split('::').last
      end

      def by_id(id)
        all.select{|t| t.id == id.to_i}.first
      end

      def path
       "/#{singular.downcase}"
      end
    end

    module InstanceMethods
      def path
        "#{self.class.path}/#{id}"
      end

      def img_url
        x = "%02d" % id
        w = "3#{x}"
        h = "2#{x}"
        "http://placekitten.com/#{w}/#{h}"
      end
    end

    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end
