def MPPT_Mode
  target_name = get_target_name("TARGET") 
  set_tlm("#{target_name} EPS_ACK_PACKET EPS_ACK_STATUS = 99")
  cmd("#{target_name} EPS_MAXIMUM_POWER_POINT_TRACKING_MODE") #ADCS_STOP_ACTUATORS EPS_MAXIMUM_POWER_POINT_TRACKING_MODE
end

# def MPPT_Mode_2
#   if(tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS") != 'ACKS_MPPT-MODE')
#     time = Time.now.to_f
#     while(tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS") != 'ACKS_MPPT-MODE')
#       time_2 = Time.now.to_f
#       elapsed = time_2 - time
#       if(elapsed > 100)
#         set_tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS = 89")
#         break
#       end
#     end
#   end
# end


def SWEEP_Mode()
  target_name = get_target_name("TARGET") #{target_name}
  set_tlm("#{target_name} EPS_ACK_PACKET EPS_ACK_STATUS = 98")
  cmd("#{target_name} EPS_SWEEP_MODE") #ADCS_STOP_ACTUATORS EPS_SWEEP_MODE
end
#   i = 0 
#   wait(2)
#   loop do
#     break if tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS") == 'ACKS_SWEEP-MODE'
#     i +=1
#       if i > 3
#         set_tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS = 88")
#         break
#       end
#   end


# def FIXED_Mode()
#   #target_name = get_target_name("TARGET") #{target_name}
#   set_tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS = 97")
#   cmd("ESAT_COM04 EPS_FIXED_MODE with PARAMETER_EPS_FIXED_MODE #{get_named_widget("Fixed_Point").text.to_i}") #ADCS_STOP_ACTUATORS EPS_FIXED_MODE
#   i = 0 
#   wait(2)
#   loop do
#     break if tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS") == 'ACKS_FIXED-MODE'
#     i +=1
#       if i > 3
#         set_tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS = 87")
#         break
#       end
#   end
# end

# def SWITCH_3V3_ON()
#   #target_name = get_target_name("TARGET") #{target_name}
#   set_tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS = 96")
#   cmd("ESAT_COM04 EPS_SWITCH_3V3_LINE with PARAMETER_EPS_SWITCH_3V3_LINE ON") #ADCS_STOP_ACTUATORS EPS_SWITCH_3V3_LINE with PARAMETER_EPS_SWITCH_3V3_LINE ON
#   i = 0 
#   wait(2)
#   loop do
#     break if tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS") == 'ACKS_3V3-SWITCH'
#     i +=1
#       if i > 3
#         set_tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS = 86")
#         break
#       end
#   end
# end
# def SWITCH_3V3_OFF()
#   #target_name = get_target_name("TARGET") #{target_name}
#   set_tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS = 96")
#   cmd("ESAT_COM04 EPS_SWITCH_3V3_LINE with PARAMETER_EPS_SWITCH_3V3_LINE OFF") #ADCS_STOP_ACTUATORS EPS_SWITCH_3V3_LINE with PARAMETER_EPS_SWITCH_3V3_LINE OFF
#   i = 0 
#   wait(2)
#   loop do
#     break if tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS") == 'ACKS_3V3-SWITCH'
#     i +=1
#       if i > 3
#         set_tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS = 86")
#         break
#       end
#   end
# end


# def SWITCH_5V_ON()
#   #target_name = get_target_name("TARGET") #{target_name}
#   set_tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS = 95")
#   cmd("ESAT_COM04 EPS_SWITCH_5V_LINE with PARAMETER_EPS_SWITCH_5V_LINE ON") #ADCS_STOP_ACTUATORS EPS_SWITCH_5V_LINE with PARAMETER_EPS_SWITCH_5V_LINE ON
#   i = 0 
#   wait(2)
#   loop do
#     break if tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS") == 'ACKS_5V-SWITCH'
#     i +=1
#       if i > 3
#         set_tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS = 85")
#         break
#       end
#   end
# end
# def SWITCH_5V_OFF()
#   #target_name = get_target_name("TARGET") #{target_name}
#   set_tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS = 95")
#   cmd("ESAT_COM04 EPS_SWITCH_5V_LINE with PARAMETER_EPS_SWITCH_5V_LINE OFF") #ADCS_STOP_ACTUATORS EPS_SWITCH_5V_LINE with PARAMETER_EPS_SWITCH_5V_LINE OFF
#   i = 0 
#   wait(2)
#   loop do
#     break if tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS") == 'ACKS_5V-SWITCH'
#     i +=1
#       if i > 3
#         set_tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS = 85")
#         break
#       end
#   end
# end


# def SET_TIME()
#   #target_name = get_target_name("TARGET") #{target_name}
#   set_tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS = 94")
#   cmd("ESAT_COM04 ADCS_STOP_ACTUATORS") #ADCS_STOP_ACTUATORS EPS_SET_TIME with PARAMETER_EPS_SET_TIME_YEAR #{year}, PARAMETER_EPS_SET_TIME_MONTH #{month}, PARAMETER_EPS_SET_TIME_DAY_OF_MONTH #{day}, PARAMETER_EPS_SET_TIME_HOURS #{hour}, PARAMETER_EPS_SET_TIME_MINUTES #{min}, PARAMETER_EPS_SET_TIME_SECONDS #{sec}
#   i = 0 
#   wait(2)
#   loop do
#     break if tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS") == 'ACKS_SET-TIME'
#     i +=1
#       if i > 2
#         set_tlm("ESAT_COM04 EPS_ACK_PACKET EPS_ACK_STATUS = 84")
#         break
#       end
#   end
# end

#MPPT_Mode()
#SWEEP_Mode()
#SWITCH_3V3_ON()
#SWITCH_5V_ON()
#SET_TIME()
