set_global_assignment -entity "unnamed" -library "lib_unnamed" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "unnamed" -library "lib_unnamed" -name IP_TOOL_VERSION "19.1"
set_global_assignment -entity "unnamed" -library "lib_unnamed" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_unnamed" -name SPD_FILE [file join $::quartus(sip_path) "../unnamed.spd"]
set_global_assignment -library "lib_unnamed" -name MISC_FILE [file join $::quartus(sip_path) "../../unnamed.qsys"]

set_global_assignment -library "lib_unnamed" -name MISC_FILE [file join $::quartus(sip_path) "unnamed.v"]
set_global_assignment -library "lib_unnamed" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dspba_library_package.vhd"]
set_global_assignment -library "lib_unnamed" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dspba_library.vhd"]
set_global_assignment -library "lib_unnamed" -name MISC_FILE [file join $::quartus(sip_path) "submodules/unnamed_CORDIC_0.vhd"]
