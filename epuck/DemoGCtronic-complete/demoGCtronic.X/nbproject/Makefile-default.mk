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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/demoGCtronic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/demoGCtronic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../Asercom.c ../DataEEPROM.s ../main_c.c ../runaccelerometer.c ../runbreitenberg_adv.c ../rungrounddirection.c ../runshow.c ../runwallfollow.c ../translatorI2C.c ../rungyroscope.c ../runsquare.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1472/Asercom.o ${OBJECTDIR}/_ext/1472/DataEEPROM.o ${OBJECTDIR}/_ext/1472/main_c.o ${OBJECTDIR}/_ext/1472/runaccelerometer.o ${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o ${OBJECTDIR}/_ext/1472/rungrounddirection.o ${OBJECTDIR}/_ext/1472/runshow.o ${OBJECTDIR}/_ext/1472/runwallfollow.o ${OBJECTDIR}/_ext/1472/translatorI2C.o ${OBJECTDIR}/_ext/1472/rungyroscope.o ${OBJECTDIR}/_ext/1472/runsquare.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1472/Asercom.o.d ${OBJECTDIR}/_ext/1472/DataEEPROM.o.d ${OBJECTDIR}/_ext/1472/main_c.o.d ${OBJECTDIR}/_ext/1472/runaccelerometer.o.d ${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o.d ${OBJECTDIR}/_ext/1472/rungrounddirection.o.d ${OBJECTDIR}/_ext/1472/runshow.o.d ${OBJECTDIR}/_ext/1472/runwallfollow.o.d ${OBJECTDIR}/_ext/1472/translatorI2C.o.d ${OBJECTDIR}/_ext/1472/rungyroscope.o.d ${OBJECTDIR}/_ext/1472/runsquare.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1472/Asercom.o ${OBJECTDIR}/_ext/1472/DataEEPROM.o ${OBJECTDIR}/_ext/1472/main_c.o ${OBJECTDIR}/_ext/1472/runaccelerometer.o ${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o ${OBJECTDIR}/_ext/1472/rungrounddirection.o ${OBJECTDIR}/_ext/1472/runshow.o ${OBJECTDIR}/_ext/1472/runwallfollow.o ${OBJECTDIR}/_ext/1472/translatorI2C.o ${OBJECTDIR}/_ext/1472/rungyroscope.o ${OBJECTDIR}/_ext/1472/runsquare.o

# Source Files
SOURCEFILES=../Asercom.c ../DataEEPROM.s ../main_c.c ../runaccelerometer.c ../runbreitenberg_adv.c ../rungrounddirection.c ../runshow.c ../runwallfollow.c ../translatorI2C.c ../rungyroscope.c ../runsquare.c


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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/demoGCtronic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=30F6014A
MP_LINKER_FILE_OPTION=,--script=p30F6014A.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1472/Asercom.o: ../Asercom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/Asercom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/Asercom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Asercom.c  -o ${OBJECTDIR}/_ext/1472/Asercom.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/Asercom.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/Asercom.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/main_c.o: ../main_c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/main_c.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main_c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main_c.c  -o ${OBJECTDIR}/_ext/1472/main_c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main_c.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main_c.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runaccelerometer.o: ../runaccelerometer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/runaccelerometer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runaccelerometer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runaccelerometer.c  -o ${OBJECTDIR}/_ext/1472/runaccelerometer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runaccelerometer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runaccelerometer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o: ../runbreitenberg_adv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runbreitenberg_adv.c  -o ${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/rungrounddirection.o: ../rungrounddirection.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/rungrounddirection.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/rungrounddirection.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../rungrounddirection.c  -o ${OBJECTDIR}/_ext/1472/rungrounddirection.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/rungrounddirection.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/rungrounddirection.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runshow.o: ../runshow.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/runshow.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runshow.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runshow.c  -o ${OBJECTDIR}/_ext/1472/runshow.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runshow.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runshow.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runwallfollow.o: ../runwallfollow.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/runwallfollow.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runwallfollow.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runwallfollow.c  -o ${OBJECTDIR}/_ext/1472/runwallfollow.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runwallfollow.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runwallfollow.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/translatorI2C.o: ../translatorI2C.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/translatorI2C.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/translatorI2C.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../translatorI2C.c  -o ${OBJECTDIR}/_ext/1472/translatorI2C.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/translatorI2C.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/translatorI2C.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/rungyroscope.o: ../rungyroscope.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/rungyroscope.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/rungyroscope.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../rungyroscope.c  -o ${OBJECTDIR}/_ext/1472/rungyroscope.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/rungyroscope.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/rungyroscope.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runsquare.o: ../runsquare.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/runsquare.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runsquare.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runsquare.c  -o ${OBJECTDIR}/_ext/1472/runsquare.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runsquare.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runsquare.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/1472/Asercom.o: ../Asercom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/Asercom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/Asercom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Asercom.c  -o ${OBJECTDIR}/_ext/1472/Asercom.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/Asercom.o.d"        -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/Asercom.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/main_c.o: ../main_c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/main_c.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main_c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main_c.c  -o ${OBJECTDIR}/_ext/1472/main_c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main_c.o.d"        -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main_c.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runaccelerometer.o: ../runaccelerometer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/runaccelerometer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runaccelerometer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runaccelerometer.c  -o ${OBJECTDIR}/_ext/1472/runaccelerometer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runaccelerometer.o.d"        -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runaccelerometer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o: ../runbreitenberg_adv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runbreitenberg_adv.c  -o ${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o.d"        -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/rungrounddirection.o: ../rungrounddirection.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/rungrounddirection.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/rungrounddirection.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../rungrounddirection.c  -o ${OBJECTDIR}/_ext/1472/rungrounddirection.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/rungrounddirection.o.d"        -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/rungrounddirection.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runshow.o: ../runshow.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/runshow.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runshow.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runshow.c  -o ${OBJECTDIR}/_ext/1472/runshow.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runshow.o.d"        -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runshow.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runwallfollow.o: ../runwallfollow.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/runwallfollow.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runwallfollow.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runwallfollow.c  -o ${OBJECTDIR}/_ext/1472/runwallfollow.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runwallfollow.o.d"        -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runwallfollow.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/translatorI2C.o: ../translatorI2C.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/translatorI2C.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/translatorI2C.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../translatorI2C.c  -o ${OBJECTDIR}/_ext/1472/translatorI2C.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/translatorI2C.o.d"        -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/translatorI2C.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/rungyroscope.o: ../rungyroscope.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/rungyroscope.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/rungyroscope.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../rungyroscope.c  -o ${OBJECTDIR}/_ext/1472/rungyroscope.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/rungyroscope.o.d"        -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/rungyroscope.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runsquare.o: ../runsquare.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/runsquare.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runsquare.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runsquare.c  -o ${OBJECTDIR}/_ext/1472/runsquare.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runsquare.o.d"        -omf=elf -mlarge-code -mlarge-data -O0 -I"../../../library" -I".." -I"." -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runsquare.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1472/DataEEPROM.o: ../DataEEPROM.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/DataEEPROM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/DataEEPROM.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../DataEEPROM.s  -o ${OBJECTDIR}/_ext/1472/DataEEPROM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1472/DataEEPROM.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/DataEEPROM.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/1472/DataEEPROM.o: ../DataEEPROM.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/DataEEPROM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/DataEEPROM.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../DataEEPROM.s  -o ${OBJECTDIR}/_ext/1472/DataEEPROM.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1472/DataEEPROM.o.d",--defsym=__MPLAB_BUILD=1,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/DataEEPROM.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/demoGCtronic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/demoGCtronic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf  -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x84F   -Wl,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--heap=128,--stack=512,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="../C:/Program Files/Microchip/MPLAB C30/lib",--library-path=".",--no-force-link,--smart-io,-Map="${DISTDIR}/demoGCtronic.X.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/demoGCtronic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/demoGCtronic.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -Wl,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=128,--stack=512,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="../C:/Program Files/Microchip/MPLAB C30/lib",--library-path=".",--no-force-link,--smart-io,-Map="${DISTDIR}/demoGCtronic.X.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}/xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/demoGCtronic.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
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
