#include <p30f6014A.h>
#include <stdlib.h>//for random numbers
#include "stdio.h"
#include "string.h"
#include "math.h"
#include "e_epuck_ports.h"
#include "e_init_port.h"#include "e_motors.h"#include "utility.h"#include "e_led.h"#include "e_prox.h"#include "e_ad_conv.h"#include "e_uart_char.h"#include "e_randb.h"#include "btcom.h"
#include "e_remote_control.h"
#include "e_agenda.h"

void indicateDirectionLED(double bearing);//turns on the LED corresponding to bearing bearing

int sel;//the position of the selector switch
char debugMessage[80];//this is some data to store screen-bound debug messages
int seeSomething;//boolean for forward facing prox sensors

int main(void){	myWait(500);//saftey wait period to prevent UART clogging	e_init_port();	sel = getselector();	if(sel == 0) while(1) NOP();

	//init uart for randb comm	e_init_uart1();	e_init_randb(I2C);

	//init randb	e_randb_set_range(50);//0 is full range, 255 is zero range, calibrated for 128	e_randb_set_calculation(ON_BOARD);	e_randb_store_light_conditions();
	myWait(50);

	e_init_prox();

	int prox_values[8] = {0,0,0,0,0,0,0,0};
	int closest;
	int closest_index;
	int speed = 200;
	int i;

	while(1)
	{
		//put code here to find which prox sensor has the
		//closest proximity reading

		allRedLEDsOff();
		
		//turn on the LED corresponding to that prox sensor

		//if either of the front two prox sensors see something
		//close, turn, otherwise, move straight

		myWait(100);
	}

	//in case it gets here, it shouldn't fall off the edge
	while(1) NOP();
}


void indicateDirectionLED(double bearing)
{
	bearing = ((double) ((((int) bearing) + 360)%360));

	allRedLEDsOff();

	if(bearing >= 337.5 || bearing < 22.5)
	{
		setLED(0,1);
	}else if(bearing >= 22.5 && bearing < 67.5){
		setLED(7,1);
	}else if(bearing >= 67.5 && bearing < 112.5){
		setLED(6,1);
	}else if(bearing >= 112.5 && bearing < 157.5){
		setLED(5,1);
	}else if(bearing >= 157.5 && bearing < 202.5){
		setLED(4,1);
	}else if(bearing >= 202.5 && bearing < 247.5){
		setLED(3,1);
	}else if(bearing >= 247.5 && bearing < 292.5){
		setLED(2,1);
	}else if(bearing >= 292.5 && bearing < 337.5){
		setLED(1,1);
	}
}
