/********************************************************************************

			Programm to follow balls using the camera				      
			Version 2.0 août 2007				                          
			Jonathan Besuchet, Alain Balleret


This file is part of the e-puck library license.
See http://www.e-puck.org/index.php?option=com_content&task=view&id=18&Itemid=45

(c) 2004-2007 Jonathan Besuchet, Alain Balleret

Robotics system laboratory http://lsro.epfl.ch
Laboratory of intelligent systems http://lis.epfl.ch
Swarm intelligent systems group http://swis.epfl.ch
EPFL Ecole polytechnique federale de Lausanne http://www.epfl.ch

**********************************************************************************/

/*! \file
 * \brief Following balls using the camera
 * \section sect_follow1 Introduction
 * This demo show you how you can drive the camera to make vision based
 * algorithmes.
 * This programm uses the camera to follow balls. There are three differents
 * configurations:
 * - Following the green balls: put the selector on position 6. Now the e-puck
 * will follow the first green ball he saw indifferently of the color.
 * - Following the red balls: put the selector on position 7. Now the e-puck
 * will follow the first red ball he saw indifferently of the color.
 * - Following all the balls: put the selector on position 8. Now the e-puck
 * will follow the first ball he saw indifferently of the color.
 * \image html cam.gif
 *
 * \section sect_follow2 How it works
 * The goal of this programm is to search a ball, when one is found the e-puck
 * has to go in it direction and has to stop at a specified distance. This is
 * done by the following steps:
 * - First of all we have to capture an image. The image is 4 pixels height and
 * 480 pixels width. We take one pixel each for pixels then the image is finally
 * 1 pixel height and 120 pixels width => stored in array 1x120.
 * - We normalize the array to 10 (the mean value of the array is now ten).
 * - We search a pic in the array which correspond of a ball (look at the
 * picture below to see how is the values when a ball is detected).
 * - We work with the motors to do two thinks at the same time: 1) to put this
 * pic on the center of the array => it would place the e-puck across the ball;
 * 2) to adjust the thickness of this pic at the desired value => it would place
 * the e-puck on the good distance of the ball. To have the best control we use
 * a PI (proportionnal intergral) regulator.
 * \subsection pic The graphe of the array when a ball is detected
 * \image html pic.gif
 * \subsection subsect1 Follow the good color
 * When we want to follow all the balls, the camera is used in gray scale mode.
 * \n When we want to follow the green ball for exemple, the camera is used in
 * color mode. In color mode, we have three values: 1 for the red, 1 one
 * for the green, 1 for the blue. Then to follow the green ball we only have to
 * take the red constituent, because the value of green in the red constituent
 * is near zero => it makes a pic in the array.
 * \n When we want to follow the red ball, it's the same principle: we take the
 * green constituent,...
 *
 * \section sect_follow3 Playing the demo
 * The programm works with the contrast of the color between the ball and the 
 * environement, so to have the best result you should place the e-puck in an
 * arena which has white wall and good luminosity.
 * \n To play the demo select the configuration you want (follow all, green, 
 * red balls) and let's go. The e-puck will turn on himself until he finds a
 * ball.
 *
 * \section sect_follow4 Video of the demo
 * - Following all the balls: http://www.youtube.com/watch?v=Pga71leqf1A
 * - Following the green balls: http://www.youtube.com/watch?v=FGXBy9FOnmw
 *
 * \author Code: Jonathan Besuchet, Alain Balleret \n Doc: Jonathan Besuchet
 */

#include <p30F6014A.h>
#include <string.h>

#include "motor_led/e_epuck_ports.h"
#include "motor_led/e_init_port.h"
#include "uart/e_uart_char.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "camera/fast_2_timer/e_poxxxx.h"

#include "search_ball.h"

#define NB_VAL 240
#define VIT_ROT_RECHERCHE 300

unsigned char red_buffer[NB_VAL];
unsigned char green_buffer[NB_VAL];

//paramètres de la camèra
int epaisseur_ligne_cam = 4;
int pos_ligne1 = ARRAY_WIDTH/2-4/2;

void select_cam_mode(int mode);
char execute(unsigned char *red_buf, unsigned char *green_buf);
void follow_red(unsigned char *buf, int size);
void follow_green(unsigned char *buf, int size);

/*------ internal functions ------*/

/*! \brief Set the mode of the camera 
 * \param mode Put RGB_565_MODE or GREY_SCALE_MODE
 */
void select_cam_mode(int mode)
{
	e_poxxxx_config_cam(pos_ligne1,0, epaisseur_ligne_cam,ARRAY_HEIGHT, 4,4,  mode);
	e_poxxxx_set_mirror(1,1);
	e_poxxxx_write_cam_registers();
}

/*! \brief Execute all the steps to follow the ball
 * 
 * The steps are:
 * - normalizing the array to 10
 * - searching the ball (the pic an the array)
 * - if a ball is found => follow him
 * \param buf_execute the array containing the image
 * \param epuck The struct which contains the e-puck state
 */
char execute(unsigned char *red_buf,unsigned char *green_buf)
{
	char found_red,found_green;

	normalize(red_buf, NB_VAL/2);
	found_red = search_ball( red_buf, NB_VAL/2);				// fonction permettant de trouver un pic
	normalize(green_buf, NB_VAL/2);
	found_green = search_ball( green_buf, NB_VAL/2);				// fonction permettant de trouver un pic
        if(found_red){
            if(found_green)
                return FOUND_RED_GREEN;
            else
                return FOUND_RED;
        }else if(found_green)
            return FOUND_GREEN;
        else
                return NOT_FOUND;
       
        /*
	if(color_found == COLOR_FOUND)
	{
							// change l'état de l'epuck dans la structure
		BODY_LED = 1;
		e_set_speed_left(100);
		e_set_speed_right(100);
	}
	else
	{
		BODY_LED = 0;
		e_set_speed_left(0);
		e_set_speed_right(0);
	
	}
         */
}

/*! \brief The filter to follow the red ball
 * \param buf The array containing the image
 * \param size The size of the array
 */
void follow_red(unsigned char *buf, int size)
{
	int i;
	unsigned char green;
	for(i=0; i<size/2; i++)
	{
		green = (((buf[2*i] & 0x07) << 5) | ((buf[2*i+1] & 0xE0) >> 3));
		//blue = ((buf[2*i+1] & 0x1F) << 3);
		buf[i] = green;
	}
}

/*! \brief The filter to follow the green ball
 * \param buf The array containing the image
 * \param size The size of the array
 */
void follow_green(unsigned char *buf, int size)
{
	int i;
	unsigned char red;
	for(i=0; i<size/2; i++)
	{
		red = (buf[2*i] & 0xF8);
		//blue = ((buf[2*i+1] & 0x1F) << 3);
		buf[i] = red;
	}
}

/*------ external functions ------*/

/*! \brief The "main" function to follow the green ball */
/*void run_follow_ball_green(void)
{
	unsigned char *tab_start = buffer;

	e_init_port();    // configure port pins
	e_start_agendas_processing();
	e_init_motors();
	e_init_uart1();   // initialize UART to 115200 Kbaud

	e_poxxxx_init_cam();
	select_cam_mode(RGB_565_MODE);

	while(1)
	{			

		// on rempli tous le buffer et on travaille sur le debut
	
		e_poxxxx_launch_capture((char *)tab_start);
		while(!e_poxxxx_is_img_ready());
	
		follow_green(tab_start, NB_VAL);
		execute(tab_start);
	}
}
*/
/*! \brief The "main" function to follow the red ball */

void run_find_red_or_green(void)
{
	unsigned char *tab_start = red_buffer;
        int find =0;
	e_init_port();    // configure port pins
	e_start_agendas_processing();
	e_init_motors();
	e_init_uart1();   // initialize UART to 115200 Kbaud

	e_poxxxx_init_cam();
	select_cam_mode(RGB_565_MODE);

	while(1)
	{			
		//*****************************************************
		// on rempli tous le buffer et on travaille sur le debut
	
		e_poxxxx_launch_capture((char *)tab_start);
		while(!e_poxxxx_is_img_ready());
	         memcpy(green_buffer, red_buffer,NB_VAL );
		follow_red(red_buffer, NB_VAL);
                follow_red(green_buffer, NB_VAL);
		find= execute(red_buffer,green_buffer);
                if(find ==FOUND_RED_GREEN){
                     BODY_LED = 1;
                }
                else if(find ==FOUND_RED){
                     e_set_speed_left(100);
                }
                else if(find ==FOUND_GREEN){
                     e_set_speed_right(100);
                }
                else{
                    BODY_LED = 0;
		e_set_speed_left(0);
		e_set_speed_right(0);
                }
	}
}
/*
void run_follow_ball_red(void)
{
	unsigned char *tab_start = buffer;

	e_init_port();    // configure port pins
	e_start_agendas_processing();
	e_init_motors();
	e_init_uart1();   // initialize UART to 115200 Kbaud

	e_poxxxx_init_cam();
	select_cam_mode(RGB_565_MODE);

	while(1)
	{
	
		// on rempli tous le buffer et on travaille sur le debut

		e_poxxxx_launch_capture((char *)tab_start);
		while(!e_poxxxx_is_img_ready());

		follow_red(tab_start, NB_VAL);
		execute(tab_start);
	}
}
 */
