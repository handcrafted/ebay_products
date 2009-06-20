class EbayProducts
  class Data
    attr_reader :data
    
    def initialize(data)
      @data = data
    end
    
    def method_missing(method, *args)
      if @data.keys.include?(method.to_s)
        @data[method.to_s]
      else
        super(*args)
      end
    end
    
    # def inspect
    #   data = @data.inject([]) { |collection, key| collection << "#{key[0]}: #{key[1]['data']}"; collection }.join("\n    ")
    #   "#<#{self.class}:0x#{object_id}\n    #{data}>"
    # end
  end
  
  class ProductInformation < Data; end
end