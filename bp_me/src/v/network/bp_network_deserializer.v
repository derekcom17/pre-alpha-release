module bp_network_deserializer 
  //import bp_common_pkg::*;
  #(  parameter   dest_id_width_p       = "inv"
    , parameter   source_data_width_p   = "inv"
    , parameter   packet_data_width_p   = "inv"
    , localparam  num_packets_p         = (source_data_width_p / packet_data_width_p) + 1
    , localparam  total_data_width      = packet_data_width_p*num_packets_p
    , localparam  total_o_data_width    = packet_data_width_p + dest_id_width_p
  )
  ( input clk_i
  , input reset_i
  
  , input v_i
  , output logic ready_o
  , input [width_p-1:0] data_i

  , output logic [els_p-1:0][width_p-1:0]  data_o
  , output logic v_o
  , input yumi_i
  )



  bsg_mem_1rw_sync_mask_write_byte scratch_pad
    #(  .els_p(1)
      , .data_width_p(1)
    )
    ( input clk_i
    , input reset_i

   ,input v_i
   ,input w_i

   ,input [addr_width_lp-1:0]       addr_i
   ,input [data_width_p-1:0]        data_i
    // for each bit set in the mask, a byte is written
   ,input [write_mask_width_lp-1:0] write_mask_i

   ,output [data_width_p-1:0] data_o
  );


endmodule