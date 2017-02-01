# README

IP River Mikrotik config generator is a web application which stores router configurations and configurations templates and can generate .rsc files with which to apply these configurations. Presently it supports RB2011 and RB3011 series routers.

Tested with Ruby 2.3.3, Rails 5.0.1, MariaDB 15.1

To deploy simply clone from the deploy branch and run the following from the project directory.

gem install bundle
bundle install
rake db:setup
rake db:schema:load db:seed RAILS_ENV=development
rails s -d

# USAGE

## CREATING A TEMPLATE

Click templates at the top of the interface and then click the link at the bottom to create a new config template. All fields are mandatory. Name and description should assist users in selecting the correct template when making a new config. Config text is where your template configuration goes. Make sure to not enter any interface specific settings or firewall rules as these will be automatically created.

## CREATING A CONFIG

Click configs at the top of the interface and then click the link at the bottom to create a new config. Choose a config template from the drop down at the top and then enter your config parameters. All of the fields are mandatory with the exception of the interfaces. In interfaces select the type of interface and enter it's corresponding settings. Any unused interfaces should be set to unused. PPP interfaces must have a username and password, ethernet interfaces must have an IP and subnet, gateway is optional. If you make a mistake then the page will prompt you.
 
## GENERATE A CONFIG FILE
 
To generate a config file which you can load on to your router click on configs at the top of the interface and then click show next to the config you would like to use. Ensure that the settings are the ones you want to apply and then click the generate link at the bottom of the screen. This will download the rsc file. To apply to your router log in to it via winbox and click on Files, then click on the Upload button and select your configuration file. Now click System -> Reset Configuration. In the popup which appears select the options "No Default Configuration" and "Do Not Backup", in the run after reset drop down select your configuration file. Click OK and confirm to proceed, the router will reboot and apply your configuration. If you need to log in to the router again note that it will only accept winbox connections from IP addresses in the security list.