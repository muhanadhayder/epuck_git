#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/start.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/start.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../main_c.c ../e_init_port.c ../e_led.c ../e_prox.c ../e_ad_conv.c ../e_init_uart1.s ../e_uart1_tx_char.s ../e_uart1_rx_char.s ../e_motors.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1472/main_c.o ${OBJECTDIR}/_ext/1472/e_init_port.o ${OBJECTDIR}/_ext/1472/e_led.o ${OBJECTDIR}/_ext/1472/e_prox.o ${OBJECTDIR}/_ext/1472/e_ad_conv.o ${OBJECTDIR}/_ext/1472/e_init_uart1.o ${OBJECTDIR}/_ext/1472/e_uart1_tx_char.o ${OBJECTDIR}/_ext/1472/e_uart1_rx_char.o ${OBJECTDIR}/_ext/1472/e_motors.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1472/main_c.o.d ${OBJECTDIR}/_ext/1472/e_init_port.o.d ${OBJECTDIR}/_ext/1472/e_led.o.d ${OBJECTDIR}/_ext/1472/e_prox.o.d ${OBJECTDIR}/_ext/1472/e_ad_conv.o.d ${OBJECTDIR}/_ext/1472/e_init_uart1.o.d ${OBJECTDIR}/_ext/1472/e_uart1_tx_char.o.d ${OBJECTDIR}/_ext/1472/e_uart1_rx_char.o.d ${OBJECTDIR}/_ext/1472/e_motors.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1472/main_c.o ${OBJECTDIR}/_ext/1472/e_init_port.o ${OBJECTDIR}/_ext/1472/e_led.o ${OBJECTDIR}/_ext/1472/e_prox.o ${OBJECTDIR}/_ext/1472/e_ad_conv.o ${OBJECTDIR}/_ext/1472/e_init_uart1.o ${OBJECTDIR}/_ext/1472/e_uart1_tx_char.o ${OBJECTDIR}/_ext/1472/e_uart1_rx_char.o ${OBJECTDIR}/_ext/1472/e_motors.o

# Source Files
SOURCEFILES=../main_c.c ../e_init_port.c ../e_led.c ../e_prox.c ../e_ad_conv.c ../e_init_uart1.s ../e_uart1_tx_char.s ../e_uart1_rx_char.s ../e_motors.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/start.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=30F6014A
MP_LINKER_FILE_OPTION=,--script=p30F6014A.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1472/main_c.o: ../main_c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/main_c.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main_c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main_c.c  -o ${OBJECTDIR}/_ext/1472/main_c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main_c.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -mlarge-data -O0 -I"../../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main_c.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/e_init_port.o: ../e_init_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/e_init_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/e_init_port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../e_init_port.c  -o ${OBJECTDIR}/_ext/1472/e_init_port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/e_init_port.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -mlarge-data -O0 -I"../../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/e_init_port.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/e_led.o: ../e_led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/e_led.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/e_led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../e_led.c  -o ${OBJECTDIR}/_ext/1472/e_led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/e_led.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -mlarge-data -O0 -I"../../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/e_led.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/e_prox.o: ../e_prox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/e_prox.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/e_prox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../e_prox.c  -o ${OBJECTDIR}/_ext/1472/e_prox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/e_prox.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -mlarge-data -O0 -I"../../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/e_prox.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/e_ad_conv.o: ../e_ad_conv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/e_ad_conv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/e_ad_conv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../e_ad_conv.c  -o ${OBJECTDIR}/_ext/1472/e_ad_conv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/e_ad_conv.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -mlarge-data -O0 -I"../../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/e_ad_conv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/e_motors.o: ../e_motors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/e_motors.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/e_motors.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../e_motors.c  -o ${OBJECTDIR}/_ext/1472/e_motors.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/e_motors.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -mlarge-data -O0 -I"../../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/e_motors.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/1472/main_c.o: ../main_c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/main_c.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main_c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main_c.c  -o ${OBJECTDIR}/_ext/1472/main_c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main_c.o.d"        -omf=elf -mlarge-data -O0 -I"../../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main_c.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/e_init_port.o: ../e_init_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/e_init_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/e_init_port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../e_init_port.c  -o ${OBJECTDIR}/_ext/1472/e_init_port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/e_init_port.o.d"        -omf=elf -mlarge-data -O0 -I"../../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/e_init_port.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/e_led.o: ../e_led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/e_led.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/e_led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../e_led.c  -o ${OBJECTDIR}/_ext/1472/e_led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/e_led.o.d"        -omf=elf -mlarge-data -O0 -I"../../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/e_led.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/e_prox.o: ../e_prox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/e_prox.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/e_prox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../e_prox.c  -o ${OBJECTDIR}/_ext/1472/e_prox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/e_prox.o.d"        -omf=elf -mlarge-data -O0 -I"../../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/e_prox.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/e_ad_conv.o: ../e_ad_conv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/e_ad_conv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/e_ad_conv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../e_ad_conv.c  -o ${OBJECTDIR}/_ext/1472/e_ad_conv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/e_ad_conv.o.d"        -omf=elf -mlarge-data -O0 -I"../../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/e_ad_conv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/e_motors.o: ../e_motors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/e_motors.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/e_motors.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../e_motors.c  -o ${OBJECTDIR}/_ext/1472/e_motors.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/e_motors.o.d"        -omf=elf -mlarge-data -O0 -I"../../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/e_motors.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1472/e_init_uart1.o: ../e_init_uart1.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/e_init_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/e_init_uart1.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../e_init_uart1.s  -o ${OBJECTDIR}/_ext/1472/e_init_uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1472/e_init_uart1.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/e_init_uart1.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1472/e_uart1_tx_char.o: ../e_uart1_tx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/e_uart1_tx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/e_uart1_tx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../e_uart1_tx_char.s  -o ${OBJECTDIR}/_ext/1472/e_uart1_tx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1472/e_uart1_tx_char.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/e_uart1_tx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1472/e_uart1_rx_char.o: ../e_uart1_rx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/e_uart1_rx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/e_uart1_rx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../e_uart1_rx_char.s  -o ${OBJECTDIR}/_ext/1472/e_uart1_rx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1472/e_uart1_rx_char.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/e_uart1_rx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/1472/e_init_uart1.o: ../e_init_uart1.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/e_init_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/e_init_uart1.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../e_init_uart1.s  -o ${OBJECTDIR}/_ext/1472/e_init_uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1472/e_init_uart1.o.d",--defsym=__MPLAB_BUILD=1,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/e_init_uart1.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1472/e_uart1_tx_char.o: ../e_uart1_tx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/e_uart1_tx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/e_uart1_tx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../e_uart1_tx_char.s  -o ${OBJECTDIR}/_ext/1472/e_uart1_tx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1472/e_uart1_tx_char.o.d",--defsym=__MPLAB_BUILD=1,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/e_uart1_tx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1472/e_uart1_rx_char.o: ../e_uart1_rx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/e_uart1_rx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/e_uart1_rx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../e_uart1_rx_char.s  -o ${OBJECTDIR}/_ext/1472/e_uart1_rx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1472/e_uart1_rx_char.o.d",--defsym=__MPLAB_BUILD=1,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/e_uart1_rx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/start.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/start.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf  -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x84F   -Wl,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--heap=200,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="../C:/Program Files/Microchip/MPLAB C30/lib",--library-path=".",--no-force-link,--smart-io,-Map="${DISTDIR}/start.X.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/start.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/start.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -Wl,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=200,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="../C:/Program Files/Microchip/MPLAB C30/lib",--library-path=".",--no-force-link,--smart-io,-Map="${DISTDIR}/start.X.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}/xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/start.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
