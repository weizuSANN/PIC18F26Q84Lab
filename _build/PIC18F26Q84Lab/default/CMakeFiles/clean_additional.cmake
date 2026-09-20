# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "C:\\Users\\miken\\MPLABProjects\\PIC18F26Q84Lab\\out\\PIC18F26Q84Lab\\default.cmf"
  "C:\\Users\\miken\\MPLABProjects\\PIC18F26Q84Lab\\out\\PIC18F26Q84Lab\\default.hex"
  "C:\\Users\\miken\\MPLABProjects\\PIC18F26Q84Lab\\out\\PIC18F26Q84Lab\\default.hxl"
  "C:\\Users\\miken\\MPLABProjects\\PIC18F26Q84Lab\\out\\PIC18F26Q84Lab\\default.mum"
  "C:\\Users\\miken\\MPLABProjects\\PIC18F26Q84Lab\\out\\PIC18F26Q84Lab\\default.o"
  "C:\\Users\\miken\\MPLABProjects\\PIC18F26Q84Lab\\out\\PIC18F26Q84Lab\\default.sdb"
  "C:\\Users\\miken\\MPLABProjects\\PIC18F26Q84Lab\\out\\PIC18F26Q84Lab\\default.sym"
  )
endif()
