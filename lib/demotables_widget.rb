# encoding: ascii-8bit

# Copyright 2014 Ball Aerospace & Technologies Corp.
# All Rights Reserved.
#
# This program is free software; you can modify and/or redistribute it
# under the terms of the GNU General Public License
# as published by the Free Software Foundation; version 3 with
# attribution addendums as found in the LICENSE.txt

require 'cosmos'
require 'cosmos/tools/tlm_viewer/widgets/widget'
require 'cosmos/tools/tlm_viewer/widgets/aging_widget'
require 'cosmos/gui/utilities/script_module_gui'

module Cosmos
	class DemotablesWidget < Qt::TableWidget
		include Widget 

		def self.takes_value?
			return true
		  end
		
		def initialize(parent_layout,target_name,packet_name,item_name,time_item_name = 'PACKET_TIMEFORMATTED',value_type= :CONVERTED)
			super(target_name,packet_name,item_name,value_type)

			@time_item_name = time_item_name.to_s

			@time_date = []
			@time_hour = []

			@data_array = []
			@data_mode = []

			@previous_time = 0
			@previous_data = 0

			@index = 0

			@rows = 0
			@columns = 0
			setRowCount(1)
			setColumnCount(4)
			setColumnWidth(0,100)
			setColumnWidth(1,200)
			setColumnWidth(2,200)
			setColumnWidth(3,200)

			header = []
			header << "Type"
			header << "Command"
			header << "Date"
			header << "Hour"
			setHorizontalHeaderLabels(header)

			setMinimumHeight(800)

			@items = []
			@items << [@target_name, @packet_name, @item_name]
			@items << [@target_name, @packet_name, @time_item_name] 
			parent_layout.addWidget(self) if parent_layout
		end

		def value=(data)
			data  = nil
			t_sec = nil


			tlm_items, _, _, _ = get_tlm_values(@items)
			data = tlm_items[0]
			t_sec = tlm_items[1]

			data_type = data.split("_")

			if(data_type[0] != "ACKS")
				date = Time.now.strftime("%Y/%m/%d")
				hour = Time.now.strftime("%k:%M:%S:%L")
		
			elsif(data_type[0] == "ACKS")
				splitted_time = t_sec.to_s
				splitted_time = splitted_time.split(" ")
				date = splitted_time[0]
				hour = splitted_time[1]
			end

			
			if (@previous_data != data && @previous_time != 0)
				@time_date << date
				@time_hour << hour
				@data_mode << data_type[0]
				@data_array << data_type[1]
			end

			if(@previous_data != data && @previous_time != 0)
				insertRow(1)
			end
			
			@rows = rowCount()
			position = rowCount() - 1

			(0...@rows).each do |row|
			setItem(row,0, Qt::TableWidgetItem.new(@data_mode[position]))
			setItem(row,1, Qt::TableWidgetItem.new(@data_array[position]))
			setItem(row,2,Qt::TableWidgetItem.new(@time_date[position]))
			setItem(row,3,Qt::TableWidgetItem.new(@time_hour[position]))
			position = position - 1
			end


			if(data_type[0] == "SEND")
				@index +=1
				if(@index > 12)
					#target_name = get_target_name("TARGET")
					property = "#{target_name} #{packet_name} #{item_name} = " +  "NACK" + "_" + data_type[1]
					instance = 'set_tlm(property)'
					@screen.instance_eval(instance.to_s)
					@index = 0
				end
			end

			if(data_type[0] == "ACKS")
				@index = 0
			end
						
			@previous_data = data
			@previous_time = t_sec
		
		end
	end
end

