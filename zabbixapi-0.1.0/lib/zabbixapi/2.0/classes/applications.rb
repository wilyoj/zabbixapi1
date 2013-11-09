class ZabbixApi
  class Applications

    def initialize(client)
      @client = client
    end

    def create(data)
      result = @client.api_request(:method => "application.create", :params => [data])
      result.empty? ? nil : result['applicationids'][0].to_i
    end

    def add(data)
      create(data)
    end

    def delete(data)
      result = @client.api_request(:method => "application.delete", :params => [data])
      result.empty? ? nil : result['applicationids'][0].to_i
    end

    def get_or_create(data)
      unless (appid = get_id(data))
        appid = create(data)
      end
      appid
    end
    
    def destroy(data)
      delete(data)
    end
    
    def get_full_data(data)
      @client.api_request(:method => "application.get", :params => {:filter => data, :output => "extend"})
    end
    
    def get_id(data)
      result = get_full_data(data)
      applicationid = nil
      result.each { |app| applicationid = app['applicationid'].to_i if app['name'] == data[:name] }
      applicationid
    end
    
  end
end
