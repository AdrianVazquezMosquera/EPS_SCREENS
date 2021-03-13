# encoding: ascii-8bit

# Copyright 2014 Ball Aerospace & Technologies Corp.
# All Rights Reserved.
#
# This program is free software; you can modify and/or redistribute it
# under the terms of the GNU General Public License
# as published by the Free Software Foundation; version 3 with
# attribution addendums as found in the LICENSE.txt


require 'cosmos/tools/tlm_viewer/widgets/widget'
require 'cosmos/tools/tlm_viewer/widgets/aging_widget'

module Cosmos
	class DemotableWidget < Qt::TableWidget
		include Widget 

		def self.takes_value?
			return true
		  end
		
		def initialize(parent_layout,target_name,packet_name,item_name,time_item_name = 'PACKET_TIMEFORMATTED',value_type= :CONVERTED)
			super(target_name,packet_name,item_name,value_type)
			@time_item_name = time_item_name.to_s
			@time = []
			@data_array = []
			@previous_time = 0
			@rows = 0
			@columns = 0
			setRowCount(1)
			setColumnCount(2)
			setColumnWidth(0,200)
			setColumnWidth(1,300)

			header = []
			header << "ACK Code"
			header << "Timestamp"
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

			if (@previous_time != t_sec && @previous_time != 0)
				@time << t_sec
				@data_array << data
			end

			if(@previous_time != t_sec && @previous_time != 0)
				insertRow(1)
			end
			
			@rows = rowCount()
			position = rowCount() - 1

			(0...@rows).each do |row|
			setItem(row,0, Qt::TableWidgetItem.new(@data_array[position]))
			setItem(row,1,Qt::TableWidgetItem.new(@time[position].to_s))
			position = position - 1
			end


			

			@previous_time = t_sec
		
		end
	end
end

