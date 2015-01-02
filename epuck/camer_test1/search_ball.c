/********************************************************************************

			Code to search a ball around the e-puck								
			December 2007: first version							
			Jonathan Besuchet & Alain Balleret 


This file is part of the e-puck library license.
See http://www.e-puck.org/index.php?option=com_content&task=view&id=18&Itemid=45

(c) 2004-2007 Jonathan Besuchet & Alain Balleret

Robotics system laboratory http://lsro.epfl.ch
Laboratory of intelligent systems http://lis.epfl.ch
Swarm intelligent systems group http://swis.epfl.ch
EPFL Ecole polytechnique federale de Lausanne http://www.epfl.ch

**********************************************************************************/

#include <p30F6014A.h>
#include <stdlib.h>

#include "search_ball.h"
#include "../motor_led/advance_one_timer/e_motors.h"

//*******************************************************

#define PIC_SIZE_MIN 3

int get_tab_moy(unsigned char tab[], int start, int end);
int find_color( unsigned char buffer[], int nb_val);


int get_tab_moy(unsigned char tab[], int start, int end)
{
	int i;
	int moy = 0;
	if(start == end)
		return tab[start];
	for(i=start; i<end; i++)
	{
		moy += tab[i];
	}
	if(moy == 0)
		return 0;
	return moy/(end-start);	
}

int find_color( unsigned char buffer[], int nb_val)
{
	static int nb_moy = 10;
	int pic1;
	int difference;
	

	pic1 = nb_moy+1;
	difference = 0;

	while(pic1 < nb_val-1)
	{
		difference = get_tab_moy(buffer, pic1-nb_moy-1, pic1-1) - ((int)buffer[pic1]+(int)buffer[pic1+1]) / 2;
		if(difference > PIC_SIZE_MIN)
			return COLOR_FOUND;
		pic1++;
	}
    return COLOR_NOT_FOUND;
}

void normalize(unsigned char buffer[], int nb_val)
{
	int moy = get_tab_moy(buffer, 0, nb_val);
	int i;
	
	if(moy == 0)
		return;
	for(i=0; i<nb_val; i++)
	{
		buffer[i] = (10*buffer[i])/moy;
	}
}


int search_ball( unsigned char buffer[], int nb_val)
{ 

	char color_found;

	color_found = find_color( buffer, nb_val);
        
	if(color_found == COLOR_FOUND)
		return COLOR_FOUND;
        else
		return COLOR_NOT_FOUND;
	
}

