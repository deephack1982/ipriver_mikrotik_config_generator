module ConfigGenerator
  def generate_rsc(config)
    @config = Config.find(config)
    @output = "/system identity set name=#{@config.system_name}\n"
    @output << "/user set admin password=#{@config.password}\n"
    @output << @config.config_template.config_text + "\n"
    if @config.interfaces.first.interface_type == 'ethernet'
      @output << "/ip address add address=#{@config.interfaces.first.ip}/#{@config.interfaces.first.subnet} comment=WAN interface=ether1\n"
      @output << "/ip route add dst-address=0.0.0.0 gateway=#{@config.interfaces.first.gateway}\n"
      @output << "/ip address add address=#{@config.interfaces.second.ip}/#{@config.interfaces.second.subnet} comment=LAN interface=ether2-master\n"
      @output << "/ip dns static add address=#{@config.interfaces.second.ip} name=router\n"
    end
    return @output
  end
end