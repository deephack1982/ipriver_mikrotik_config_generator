module ConfigGenerator
  def generate_rsc(config)
    @config = Config.find(config)
    @output = "/system identity set name=#{@config.system_name}\n"
    @output << "/user set admin password=#{@config.password}\n"
    @output << "/snmp\nset contact=\"#{@config.snmp_contact}\"\nset enabled=yes\nset location=\"#{@config.snmp_location}\"\ncommunity\nset numbers=0 address=\"#{@config.snmp_address}\"\nset numbers=0 name=\"#{@config.snmp_community}\"\n"
    @output << @config.config_template.config_text + "\n"
    # First interface definition
    if @config.interfaces.first.interface_type == 'ethernet-wan' || @config.interfaces.first.interface_type == 'sfp-wan'
      @output << "/ip address add address=#{@config.interfaces.first.ip}/#{@config.interfaces.first.subnet} comment=WAN interface=ether1\n"
      @output << "/ip route add dst-address=0.0.0.0 gateway=#{@config.interfaces.first.gateway}\n"
      @output << "/ip firewall filter\n"
      @output << "add action=accept chain=input comment=\"Remote admin\" dst-port=8291 protocol=tcp in-interface=ether1\n"
      @output << "add action=accept chain=input comment=\"SNMP\" dst-port=161 protocol=udp in-interface=ether1\n"
      @output << "add action=drop chain=input comment=\"defconf: drop all from WAN\" in-interface=ether1\n"
    elsif @config.interfaces.first.interface_type == 'ppp'
      @output << "/interface pppoe-client add name=WAN user=#{@config.interfaces.first.username} password=#{@config.interfaces.first.password} interface=ether1 disabled=no add-default-route=yes\n"
      @output << "/ip address add address=#{@config.interfaces.second.ip}/#{@config.interfaces.second.subnet} comment=LAN interface=ether2-master\n"
      @output << "/ip dns static add address=#{@config.interfaces.second.ip} name=router\n"
      @output << "/ip firewall filter\n"
      @output << "add action=accept chain=input comment=\"Remote admin\" dst-port=8291 protocol=tcp in-interface=WAN\n"
      @output << "add action=accept chain=input comment=\"SNMP\" dst-port=161 protocol=udp in-interface=WAN\n"
      @output << "add action=drop chain=input comment=\"defconf: drop all from WAN\" in-interface=WAN\n"
    end
    # Second interface definition
    if @config.interfaces.second.interface_type == 'ethernet-lan'
      @output << "/ip address add address=#{@config.interfaces.second.ip}/#{@config.interfaces.second.subnet} comment=LAN interface=ether2-master\n"
      @output << "/ip dns static add address=#{@config.interfaces.second.ip} name=router\n"
    end
    # Third interface definition
    if @config.interfaces.third.interface_type == 'ethernet-lan'
      @output << "/ip address add address=#{@config.interfaces.third.ip}/#{@config.interfaces.third.subnet} comment=LAN interface=ether3\n"
      @output << "/ip dns static add address=#{@config.interfaces.third.ip} name=router\n"
    end
    return @output
  end
end