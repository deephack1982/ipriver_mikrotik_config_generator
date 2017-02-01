# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
    console.log("Script loaded")
    $("#config_interfaces_attributes_0_interface_type,#config_interfaces_attributes_1_interface_type,#config_interfaces_attributes_2_interface_type").on "change", ->
      console.log("Interface type changed")
      i = 0
      while (i < 3)
        if $("#config_interfaces_attributes_#{i}_interface_type").val() is "ppp"
          console.log("Interface #{$(this).id} type is PPP")
          $("#config_interfaces_attributes_#{i}_ip").attr("disabled", true)
          $("#config_interfaces_attributes_#{i}_subnet").attr("disabled", true)
          $("#config_interfaces_attributes_#{i}_gateway").attr("disabled", true)
          $("#config_interfaces_attributes_#{i}_username").attr("disabled", false)
          $("#config_interfaces_attributes_#{i}_password").attr("disabled", false)
        if $("#config_interfaces_attributes_#{i}_interface_type").val() is "ethernet"
          console.log("Interface #{$(this).id} type is ethernet")
          $("#config_interfaces_attributes_#{i}_ip").attr("disabled", false)
          $("#config_interfaces_attributes_#{i}_subnet").attr("disabled", false)
          $("#config_interfaces_attributes_#{i}_gateway").attr("disabled", false)
          $("#config_interfaces_attributes_#{i}_username").attr("disabled", true)
          $("#config_interfaces_attributes_#{i}_password").attr("disabled", true)
        if $("#config_interfaces_attributes_#{i}_interface_type").val() is "unused"
          console.log("Interface #{$(this).id} type is ethernet")
          $("#config_interfaces_attributes_#{i}_ip").attr("disabled", true)
          $("#config_interfaces_attributes_#{i}_subnet").attr("disabled", true)
          $("#config_interfaces_attributes_#{i}_gateway").attr("disabled", true)
          $("#config_interfaces_attributes_#{i}_username").attr("disabled", true)
          $("#config_interfaces_attributes_#{i}_password").attr("disabled", true)
        i++
return