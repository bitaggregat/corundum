# Placement constraints
#create_pblock pblock_slr0
#add_cells_to_pblock [get_pblocks pblock_slr0] [get_cells -quiet "core_inst/core_inst/core_pcie_inst/core_inst/dma_if_mux_inst"]
#add_cells_to_pblock -quiet [get_pblocks pblock_slr0] [get_cells -quiet "core_inst/core_inst/core_pcie_inst/core_inst/dma_if_mux.dma_if_mux_ctrl_inst"]
#add_cells_to_pblock -quiet [get_pblocks pblock_slr0] [get_cells -quiet "core_inst/core_inst/core_pcie_inst/core_inst/dma_if_mux.dma_if_mux_data_inst"]
#add_cells_to_pblock [get_pblocks pblock_slr0] [get_cells -quiet "core_inst/core_inst/core_pcie_inst/core_inst/iface[*].interface_inst/interface_rx_inst"]
#add_cells_to_pblock [get_pblocks pblock_slr0] [get_cells -quiet "core_inst/core_inst/core_pcie_inst/core_inst/iface[*].interface_inst/interface_tx_inst"]
#add_cells_to_pblock [get_pblocks pblock_slr0] [get_cells -quiet "core_inst/core_inst/core_pcie_inst/core_inst/iface[*].interface_inst/tx_fifo_inst"]
#add_cells_to_pblock [get_pblocks pblock_slr0] [get_cells -quiet "core_inst/core_inst/core_pcie_inst/core_inst/iface[*].interface_inst/rx_fifo_inst"]
#resize_pblock [get_pblocks pblock_slr0] -add {SLR0}
#
#create_pblock pblock_slr1
##add_cells_to_pblock [get_pblocks pblock_slr1] [get_cells -quiet ""]
#resize_pblock [get_pblocks pblock_slr1] -add {SLR1}
#
#create_pblock pblock_pcie
#add_cells_to_pblock [get_pblocks pblock_pcie] [get_cells -quiet "pcie4c_uscale_plus_inst"]
#add_cells_to_pblock [get_pblocks pblock_pcie] [get_cells -quiet "core_inst/core_inst/pcie_if_inst"]
#add_cells_to_pblock [get_pblocks pblock_pcie] [get_cells -quiet "core_inst/core_inst/core_pcie_inst/pcie_axil_master_inst"]
#add_cells_to_pblock [get_pblocks pblock_pcie] [get_cells -quiet "core_inst/core_inst/core_pcie_inst/dma_if_pcie_inst"]
#add_cells_to_pblock [get_pblocks pblock_pcie] [get_cells -quiet "core_inst/core_inst/core_pcie_inst/pcie_msix_inst"]
#resize_pblock [get_pblocks pblock_pcie] -add {CLOCKREGION_X6Y0:CLOCKREGION_X7Y3}
#
#create_pblock pblock_eth
#add_cells_to_pblock [get_pblocks pblock_eth] [get_cells -quiet "qsfp_cmac_inst"]
#add_cells_to_pblock [get_pblocks pblock_eth] [get_cells -quiet "core_inst/core_inst/core_pcie_inst/core_inst/iface[*].interface_inst/port[*].port_inst/port_tx_inst/tx_async_fifo_inst"]
#add_cells_to_pblock [get_pblocks pblock_eth] [get_cells -quiet "core_inst/core_inst/core_pcie_inst/core_inst/iface[*].interface_inst/port[*].port_inst/port_rx_inst/rx_async_fifo_inst"]
#add_cells_to_pblock [get_pblocks pblock_eth] [get_cells -quiet "core_inst/core_inst/core_pcie_inst/core_inst/iface[*].interface_inst/port[*].port_inst/port_tx_inst/tx_cpl_fifo_inst"]
#resize_pblock [get_pblocks pblock_eth] -add {CLOCKREGION_X0Y6:CLOCKREGION_X0Y7}
#
## CMACs
#set_property LOC CMACE4_X0Y4 [get_cells -hierarchical -filter {NAME =~ qsfp_cmac_inst/cmac_inst/inst/i_cmac_usplus_top/* && REF_NAME==CMACE4}]

create_pblock pblock_pci
add_cells_to_pblock [get_pblocks pblock_pci] [get_cells -quiet [list pcie4c_uscale_plus_inst]]
resize_pblock [get_pblocks pblock_pci] -add {CLOCKREGION_X2Y0:CLOCKREGION_X4Y4}
set_property IS_SOFT 0 [get_pblocks pblock_pci]

create_pblock pblock_pcie_if_inst
add_cells_to_pblock [get_pblocks pblock_pcie_if_inst] [get_cells -quiet [list core_inst/core_inst/pcie_if_inst]]
resize_pblock [get_pblocks pblock_pcie_if_inst] -add {CLOCKREGION_X2Y5:CLOCKREGION_X4Y5}
set_property IS_SOFT 0 [get_pblocks pblock_pcie_if_inst]

create_pblock pblock_qsfp_cmac_inst
add_cells_to_pblock [get_pblocks pblock_qsfp_cmac_inst] [get_cells -quiet [list qsfp_cmac_inst]]
resize_pblock [get_pblocks pblock_qsfp_cmac_inst] -add {CLOCKREGION_X2Y8:CLOCKREGION_X4Y10 CLOCKREGION_X3Y7:CLOCKREGION_X4Y7}
set_property IS_SOFT 0 [get_pblocks pblock_qsfp_cmac_inst]

create_pblock pblock_core_pcie_inst
add_cells_to_pblock [get_pblocks pblock_core_pcie_inst] [get_cells -quiet [list core_inst/core_inst/core_pcie_inst]]
resize_pblock [get_pblocks pblock_core_pcie_inst] -add {CLOCKREGION_X1Y6:CLOCKREGION_X4Y7}
set_property IS_SOFT 0 [get_pblocks pblock_core_pcie_inst]
