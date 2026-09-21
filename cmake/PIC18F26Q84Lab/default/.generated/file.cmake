# The following variables contains the files used by the different stages of the build process.
set(PIC18F26Q84Lab_default_default_XC8_FILE_TYPE_assemble)
set_source_files_properties(${PIC18F26Q84Lab_default_default_XC8_FILE_TYPE_assemble} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${PIC18F26Q84Lab_default_default_XC8_FILE_TYPE_assemble})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(PIC18F26Q84Lab_default_default_XC8_FILE_TYPE_assemblePreprocess)
set_source_files_properties(${PIC18F26Q84Lab_default_default_XC8_FILE_TYPE_assemblePreprocess} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${PIC18F26Q84Lab_default_default_XC8_FILE_TYPE_assemblePreprocess})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(PIC18F26Q84Lab_default_default_XC8_FILE_TYPE_compile
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../config.mcc/main.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../config.mcc/mcc_generated_files/system/src/clock.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../config.mcc/mcc_generated_files/system/src/config_bits.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../config.mcc/mcc_generated_files/system/src/interrupt.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../config.mcc/mcc_generated_files/system/src/pins.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../config.mcc/mcc_generated_files/system/src/system.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../config.mcc/mcc_generated_files/uart/src/uart1.c")
set_source_files_properties(${PIC18F26Q84Lab_default_default_XC8_FILE_TYPE_compile} PROPERTIES LANGUAGE C)
set(PIC18F26Q84Lab_default_default_XC8_FILE_TYPE_link)
set(PIC18F26Q84Lab_default_image_name "default.elf")
set(PIC18F26Q84Lab_default_image_base_name "default")

# The output directory of the final image.
set(PIC18F26Q84Lab_default_output_dir "${CMAKE_CURRENT_SOURCE_DIR}/../../../out/PIC18F26Q84Lab")

# The full path to the final image.
set(PIC18F26Q84Lab_default_full_path_to_image ${PIC18F26Q84Lab_default_output_dir}/${PIC18F26Q84Lab_default_image_name})

# Potential output file extensions
set(output_extensions
    .hex
    .hxl
    .mum
    .o
    .sdb
    .sym
    .cmf)
list(TRANSFORM output_extensions PREPEND "${PIC18F26Q84Lab_default_output_dir}/${PIC18F26Q84Lab_default_image_base_name}")
