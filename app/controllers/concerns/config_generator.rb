module ConfigGenerator
  def generate_rsc(config)
    @config = Config.find(config)
    @output = "/system identity set name=#{@config.system_name}\n"
    @output << "/user set admin password=#{@config.password}\n"
    @output << @config.config_template.config_text + "\n"
    # First interface definition
    if @config.interfaces.first.interface_type == 'ethernet'
      @output << "/ip address add address=#{@config.interfaces.first.ip}/#{@config.interfaces.first.subnet} comment=WAN interface=ether1\n"
      @output << "/ip route add dst-address=0.0.0.0 gateway=#{@config.interfaces.first.gateway}\n"
      @output << "/ip firewall nat add action=masquerade chain=srcnat comment=masquerade out-interface=ether1\n"
    elsif @config.interfaces.first.interface_type == 'ppp'
      @output << "/interface pppoe-client add name=WAN user=#{@config.interfaces.first.username} password=#{@config.interfaces.first.password} interface=ether1 disabled=no add-default-route=yes\n"
      @output << "/ip address add address=#{@config.interfaces.second.ip}/#{@config.interfaces.second.subnet} comment=LAN interface=ether2-master\n"
      @output << "/ip dns static add address=#{@config.interfaces.second.ip} name=router\n"
      @output << "/ip firewall nat add action=masquerade chain=srcnat comment=masquerade out-interface=WAN\n"
    end
    # Second interface definition
    if @config.interfaces.second.interface_type == 'ethernet'
      @output << "/ip address add address=#{@config.interfaces.second.ip}/#{@config.interfaces.second.subnet} comment=LAN interface=ether2-master\n"
      @output << "/ip dns static add address=#{@config.interfaces.second.ip} name=router\n"
    end
    # Third interface definition
    if @config.interfaces.third.interface_type == 'ethernet'
      @output << "/ip address add address=#{@config.interfaces.third.ip}/#{@config.interfaces.third.subnet} comment=LAN interface=ether2-master\n"
      @output << "/ip dns static add address=#{@config.interfaces.third.ip} name=router\n"
    end
    return @output
  end
end