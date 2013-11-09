require 'zabbixapi1'
  
  puts "loaded!" if defined?('zabbixapi')
  
  # settings
  @api_url = 'http://50.56.173.37/zabbix/api_jsonrpc.php'
  @api_login = 'admin'
  @api_password = 'zabbix'
  
  @zbx = ZabbixApi.connect(:url => @api_url, :user => @api_login, :password => @api_password,:debug => false )
  
  #get_result(method, history, hostid, itemid)
  puts @zbx.results.get_result("history.get", 0, "10164", "2407")
  
  #puts @zbx.items.all
  
  #puts @zbx.hosts.get_id(:host => "PingServerTest")