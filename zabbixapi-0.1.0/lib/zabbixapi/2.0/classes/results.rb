class ZabbixApi
  class Results < Basic
    
    def array_flag
      false
    end
    
    def method_name
      "history"
    end
    
    def indentify
      "history"
    end
    
    def get_result(method, history, hostid, itemid)
      @client.api_request(:method => method, :params => { 
        :output => "extend",
        :history => 0,
        :hostid => hostid,
        :itemid => itemid,
        :sortfield => "clock",
        :sortorder => "DESC",
        :limit => 10 } )
    end
    
  end
end
