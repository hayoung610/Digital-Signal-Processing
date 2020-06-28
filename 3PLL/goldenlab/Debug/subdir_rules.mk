################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
delay.obj: ../delay.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv5/tools/compiler/c6000_7.4.4/bin/cl6x" -mv6700 --abi=coffabi -g --include_path="C:/ti/ccsv5/tools/compiler/c6000_7.4.4/include" --include_path="C:/ti/C6xCSL/include" --include_path="C:/ti/DSK6713/c6000/dsk6713/include" --include_path="C:/Users/DSP_Lab/Documents/DSP2019/goldenlab/Debug" --include_path="C:/ti/bios_5_42_01_09/packages/ti/bios/include" --include_path="C:/ti/bios_5_42_01_09/packages/ti/rtdx/include/c6000" --define=c6713 --define=TARGET_DSK6713 --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="delay.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

dsp_ap.obj: ../dsp_ap.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv5/tools/compiler/c6000_7.4.4/bin/cl6x" -mv6700 --abi=coffabi -g --include_path="C:/ti/ccsv5/tools/compiler/c6000_7.4.4/include" --include_path="C:/ti/C6xCSL/include" --include_path="C:/ti/DSK6713/c6000/dsk6713/include" --include_path="C:/Users/DSP_Lab/Documents/DSP2019/goldenlab/Debug" --include_path="C:/ti/bios_5_42_01_09/packages/ti/bios/include" --include_path="C:/ti/bios_5_42_01_09/packages/ti/rtdx/include/c6000" --define=c6713 --define=TARGET_DSK6713 --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="dsp_ap.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

dsp_apcfg.cmd: ../dsp_ap.tcf
	@echo 'Building file: $<'
	@echo 'Invoking: TConf'
	"C:/ti/bios_5_42_01_09/xdctools/tconf" -b -Dconfig.importPath="C:/ti/bios_5_42_01_09/packages;" "$<"
	@echo 'Finished building: $<'
	@echo ' '

dsp_apcfg.s??: | dsp_apcfg.cmd
dsp_apcfg_c.c: | dsp_apcfg.cmd
dsp_apcfg.h: | dsp_apcfg.cmd
dsp_apcfg.h??: | dsp_apcfg.cmd
dsp_ap.cdb: | dsp_apcfg.cmd

dsp_apcfg.obj: ./dsp_apcfg.s?? $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv5/tools/compiler/c6000_7.4.4/bin/cl6x" -mv6700 --abi=coffabi -g --include_path="C:/ti/ccsv5/tools/compiler/c6000_7.4.4/include" --include_path="C:/ti/C6xCSL/include" --include_path="C:/ti/DSK6713/c6000/dsk6713/include" --include_path="C:/Users/DSP_Lab/Documents/DSP2019/goldenlab/Debug" --include_path="C:/ti/bios_5_42_01_09/packages/ti/bios/include" --include_path="C:/ti/bios_5_42_01_09/packages/ti/rtdx/include/c6000" --define=c6713 --define=TARGET_DSK6713 --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="dsp_apcfg.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

dsp_apcfg_c.obj: ./dsp_apcfg_c.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv5/tools/compiler/c6000_7.4.4/bin/cl6x" -mv6700 --abi=coffabi -g --include_path="C:/ti/ccsv5/tools/compiler/c6000_7.4.4/include" --include_path="C:/ti/C6xCSL/include" --include_path="C:/ti/DSK6713/c6000/dsk6713/include" --include_path="C:/Users/DSP_Lab/Documents/DSP2019/goldenlab/Debug" --include_path="C:/ti/bios_5_42_01_09/packages/ti/bios/include" --include_path="C:/ti/bios_5_42_01_09/packages/ti/rtdx/include/c6000" --define=c6713 --define=TARGET_DSK6713 --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="dsp_apcfg_c.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

dsp_apcfg_c.obj: ../dsp_apcfg_c.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv5/tools/compiler/c6000_7.4.4/bin/cl6x" -mv6700 --abi=coffabi -g --include_path="C:/ti/ccsv5/tools/compiler/c6000_7.4.4/include" --include_path="C:/ti/C6xCSL/include" --include_path="C:/ti/DSK6713/c6000/dsk6713/include" --include_path="C:/Users/DSP_Lab/Documents/DSP2019/goldenlab/Debug" --include_path="C:/ti/bios_5_42_01_09/packages/ti/bios/include" --include_path="C:/ti/bios_5_42_01_09/packages/ti/rtdx/include/c6000" --define=c6713 --define=TARGET_DSK6713 --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="dsp_apcfg_c.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

dsp_top.obj: ../dsp_top.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv5/tools/compiler/c6000_7.4.4/bin/cl6x" -mv6700 --abi=coffabi -g --include_path="C:/ti/ccsv5/tools/compiler/c6000_7.4.4/include" --include_path="C:/ti/C6xCSL/include" --include_path="C:/ti/DSK6713/c6000/dsk6713/include" --include_path="C:/Users/DSP_Lab/Documents/DSP2019/goldenlab/Debug" --include_path="C:/ti/bios_5_42_01_09/packages/ti/bios/include" --include_path="C:/ti/bios_5_42_01_09/packages/ti/rtdx/include/c6000" --define=c6713 --define=TARGET_DSK6713 --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="dsp_top.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

fir.obj: ../fir.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv5/tools/compiler/c6000_7.4.4/bin/cl6x" -mv6700 --abi=coffabi -g --include_path="C:/ti/ccsv5/tools/compiler/c6000_7.4.4/include" --include_path="C:/ti/C6xCSL/include" --include_path="C:/ti/DSK6713/c6000/dsk6713/include" --include_path="C:/Users/DSP_Lab/Documents/DSP2019/goldenlab/Debug" --include_path="C:/ti/bios_5_42_01_09/packages/ti/bios/include" --include_path="C:/ti/bios_5_42_01_09/packages/ti/rtdx/include/c6000" --define=c6713 --define=TARGET_DSK6713 --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="fir.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

pll.obj: ../pll.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv5/tools/compiler/c6000_7.4.4/bin/cl6x" -mv6700 --abi=coffabi -g --include_path="C:/ti/ccsv5/tools/compiler/c6000_7.4.4/include" --include_path="C:/ti/C6xCSL/include" --include_path="C:/ti/DSK6713/c6000/dsk6713/include" --include_path="C:/Users/DSP_Lab/Documents/DSP2019/goldenlab/Debug" --include_path="C:/ti/bios_5_42_01_09/packages/ti/bios/include" --include_path="C:/ti/bios_5_42_01_09/packages/ti/rtdx/include/c6000" --define=c6713 --define=TARGET_DSK6713 --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="pll.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

rc1_taps.obj: ../rc1_taps.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv5/tools/compiler/c6000_7.4.4/bin/cl6x" -mv6700 --abi=coffabi -g --include_path="C:/ti/ccsv5/tools/compiler/c6000_7.4.4/include" --include_path="C:/ti/C6xCSL/include" --include_path="C:/ti/DSK6713/c6000/dsk6713/include" --include_path="C:/Users/DSP_Lab/Documents/DSP2019/goldenlab/Debug" --include_path="C:/ti/bios_5_42_01_09/packages/ti/bios/include" --include_path="C:/ti/bios_5_42_01_09/packages/ti/rtdx/include/c6000" --define=c6713 --define=TARGET_DSK6713 --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="rc1_taps.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

sin_tables.obj: ../sin_tables.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv5/tools/compiler/c6000_7.4.4/bin/cl6x" -mv6700 --abi=coffabi -g --include_path="C:/ti/ccsv5/tools/compiler/c6000_7.4.4/include" --include_path="C:/ti/C6xCSL/include" --include_path="C:/ti/DSK6713/c6000/dsk6713/include" --include_path="C:/Users/DSP_Lab/Documents/DSP2019/goldenlab/Debug" --include_path="C:/ti/bios_5_42_01_09/packages/ti/bios/include" --include_path="C:/ti/bios_5_42_01_09/packages/ti/rtdx/include/c6000" --define=c6713 --define=TARGET_DSK6713 --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="sin_tables.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '


