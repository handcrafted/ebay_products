class EbayProducts
  class Data
    attr_reader :data
    
    def initialize(data)
      @data = downcase_keys(data)
    end
    
    def method_missing(method, *args)
      if @data.keys.include?(method.to_s)
        @data[method.to_s]
      else
        super(*args)
      end
    end
    
    private
    
    def downcase_keys(hash)
      new_hash = {}
      hash.keys.each do |key|
        value = hash.delete(key)
        new_hash[downcase_key(key)] = value
        new_hash[downcase_key(key)] = downcase_keys(value) if value.is_a?(Hash)
        new_hash[downcase_key(key)] = value.each{|p| downcase_keys(p) if p.is_a?(Hash)} if value.is_a?(Array)
      end
      new_hash
    end

    def downcase_key(key)
      key.underscore.titlecase.downcase.gsub(' ', '_')
    end
        
  end
  
  class ProductInformation < Data; end
end