//////////////////////////////////////////////////////////////////////////////////////
//Template for camera tutorial  												 	// 
//Developed by: Christian Ahler.                                                    //
//////////////////////////////////////////////////////////////////////////////////////

// The camera is, by default, configured with the following settings:
// - Automatic white balance control
// - Automatic exposure control
// - Automatic flicker detection ( 50Hz and 60Hz )

// Setup library path: Project->Build options->
// Project->Directories: "Include search path" in dropdown: Enter path 
// to the libraries. Eg. C:\Projects\E-pucks\Libraries.
// Add the same under "Assembler include search path"  

#include <p30F6014A.h>
#include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "a_d/e_prox.h"
#include "camera/fast_2_timer/e_poxxxx.h"
#include "camera/fast_2_timer/e_po6030k.h"
#include "camera/fast_2_timer/e_po3030k.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/e_init_port.h"
#include "uart/e_uart_char.h"
#include "I2C/e_I2C_master_module.h"
#include "I2C/e_I2C_protocol.h"
#include "runfollowball.h"
#include "motor_led/advance_one_timer/e_led.h"
#include "additional_functions_seas.h"
#include "a_d/e_ad_conv.h"
#include "utility.h"
#include "stdio.h"  //Necessary for sprint 
#include "string.h" //Necessary for string manipulation 
#include "stdlib.h" //Neccessary for itoa conversion 
//#include "math.h"
//Buffer for the camera image
//static unsigned char buffer[300]; //MUST BE UNSIGNED. VERY ESSENTIAL.
//static unsigned char buffer_processing[300]; //MUST BE UNSIGNED. VERY ESSENTIAL.
//static signed char print_buffer[100];

//Eases the transmission of integers as ascii code
#define uart_send_text(msg) do { e_send_uart1_char(msg,strlen(msg)); while(e_uart1_sending()); } while(0) 

int main(void)
{	
	//Definitions of variables
	//int cam_mode,cam_width,cam_heigth,cam_zoom,buffer_size;
        int selector;
        long delay;
	e_init_motors();
	e_init_port();    //Configure port pins
	e_init_uart1();   //Initialize UART to 115200 Kbit
	e_i2cp_init();    //I2C bus for the camera
	e_init_ad_scan(ALL_ADC);
	wait_for_bluetooth(); //Short delay to ensure programming 

	if(RCONbits.POR) {	//Reset if necessary
	RCONbits.POR=0;
	RESET();
	}
        selector = getselector();
        if(selector ==0){
            while(1) NOP();
        } else if (selector==2) {
		//run_follow_ball_red();
            run_find_red_or_green();
	}
        /*else if (selector==3) {
		run_follow_ball_green();
        }
         * */
	//Below function is defined in e_common.c 
	//ARRAY_WIDTH	640	(Just for reference, not to be modified, defined elsewhere)	
	//ARRAY_HEIGHT	480 (Just for reference, not to be modified, defined elsewhere)
	//cam_mode=RGB_565_MODE; //Value defined in e_poxxxx.h (RGB_565_MODE, GREY_SCALE_MODE, YUV_MODE)
	//cam_width=x;
	//cam_heigth=x; 
	//cam_zoom=8; //8: Fully zoomed out
	//buffer_size=cam_width*cam_heigth<<1; //Multiply by 1 or 2 depending on if grayscale or color is used.

	//e_poxxxx_init_cam(); //Located in e_common.c 
	 
	//Returns 0 if setup parameters are ok. Returns -1 if not.       
	/*if(0 != e_poxxxx_config_cam((ARRAY_WIDTH -cam_width*cam_zoom)/2,x,cam_width*cam_zoom,cam_heigth*cam_zoom,cam_zoom,cam_zoom,cam_mode))	
	{
		e_set_led(0, 1);  //Turn on center diode when robot is considered from the front if setup FAILED.
		while(1);         //And then stay passive 
	}
	*/
	//manual_camera_calibration();
	
	//Write settings to the camera. //Warning: This function MUST be the last to call before the while loop
    //e_poxxxx_write_cam_registers(); //Initialization and changes to the setup of the camera.
			  	

	//e_start_agendas_processing(); //Motor control
	//e_set_speed_right(x); 
	//e_set_speed_left(x);
	
	while(1) //Infinite loop, capturing images and transmitting selected and prepossed data them via Bluetooth.
	{
		//e_poxxxx_launch_capture(&buffer[0]); 	//Start image capture    
		//while(!e_poxxxx_is_img_ready());		//Wait for capture to complete
		
		//RGB bytes structure: RRRRRGGG GGGBBBBB
		//                    |        |        |
		//           Even ordered bytes Odd ordered bytes

		//	sprintf(buffer_processing,"%s","Your message"); //"w,%u,%u\r\n"
		//	uart_send_text(buffer_processing);

       e_start_agendas_processing(); //Motor control
       if (e_get_prox(0)>500) {		//escape
			e_set_speed_left(-100);
			e_set_speed_right(-100);
		} else if (e_get_prox(0)>100) {	//follow
			e_set_speed_left(100);
			e_set_speed_right(100);
		} else {						//stop
			e_set_speed_left(0);
			e_set_speed_right(0);
		}
       //e_led_clear();
       //e_set_body_led(0);
       //e_set_front_led(0);
       //e_set_led(0,1);
         for(delay=0;delay<50000;delay++);

		








	} //End of infinite loop

} //End of main
	
