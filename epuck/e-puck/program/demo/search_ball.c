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
#include "./../../library/motor_led/advance_one_timer/e_motors.h"

//*******************************************************
//variable globale
#define PIC_SIZE_MIN 3
static float ui_lin = 0.0;

//*******************************************************
//declaration des fcts interne au module search_ball

int get_tab_moy(unsigned char tab[], int start, int end);
int calc_pic_datas_g(int *largeur_pic, int *pos_pic, unsigned char buffer[], int nb_val);
int calc_pic_datas_d(int *largeur_pic, int *pos_pic, unsigned char buffer[], int nb_val);
int calc_lin_speed(int distance, int gain);
int calc_angle_speed(int pos_pic, int gain);


//fonction permettant de faire la moyenne d'un tableau
// function to take the average of an array
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

// recherche de pic en partant de la gauche, c'est à dire de la première valeur du tableau
// Peak search in from the left, that is, the first value of the table
int calc_pic_datas_g(int *largeur_pic, int *pos_center_pic, unsigned char buffer[], int nb_val)
{
	static int nb_moy = 10;
	int pic1, pic2;
	int difference;
	
	//détection de l'endroit du premier pic en moyennant les 10 dernière valeur et
	//en les comparant au pixel en cours (on suppose que le pic est après les 10 
	//premiers éléments) le flanc du  pic doit etre superieur a 3.
        // detect the location of the first peak by averaging the last 10 value
        // mby comparing the current pixel (assuming that the peak after 10
        // first elements) flank of the peak should be more than 3.
	pic1 = nb_moy+1;
	difference = 0;
	// tant que la différence est inf à 3, et que toutes les valeur n'ont pas été testé
	// recherche d'un pic descandant
        // As the difference is less than 3, and that all the value has not been tested
        // Search for a peak descandant
	while(pic1 < nb_val-1)
	{
		difference = get_tab_moy(buffer, pic1-nb_moy-1, pic1-1) - ((int)buffer[pic1]+(int)buffer[pic1+1]) / 2;
		if(difference > PIC_SIZE_MIN)
			break; 
		pic1++;
	}

	if(pic1 >= nb_val || difference <= PIC_SIZE_MIN)
		return PIC_NOT_FOUND;
	
	pic2 = pic1 + 1;
	difference = 0;
	// tant que la différence est inf à 3, et que toutes les valeur n'ont pas été testé
	// recherche d'un pic montant
        // As the difference is less than 3, and that all the value has not been tested
        // Search for a peak amount
	while(pic2 < nb_val-1)
	{
		difference = ((int)buffer[pic2]+(int)buffer[pic2]) / 2 - get_tab_moy(buffer, pic1, pic2);
		if(difference > PIC_SIZE_MIN)
			break; 
		pic2++;
	}
	
	*largeur_pic = pic2-pic1;
	// on calcule la position du centre du pic par rapport au centre de la camera.
        // We calculated the peak position of the center from the camera center.
	if(pic2 >= nb_val)
		*pos_center_pic = nb_val/2;
	else
		*pos_center_pic = pic1 + (pic2-pic1)/2 - nb_val/2;
	return PIC_FOUND;
}

// recherche de pic en partant de la droite, c'est à dire de la dernière valeur du tableau
// Search peak in from the right, ie the last value of the array
int calc_pic_datas_d(int *largeur_pic, int *pos_center_pic, unsigned char buffer[], int nb_val)
{
	static int nb_moy = 10;
	int pic1, pic2;
	int difference;

	//détection de l'endroit du premier pic en moyennant les 10 dernière valeur et
	//en les comparant au pixel en cours (on suppose que le pic est après les 10 
	//premiers éléments) le flanc du  pic doit etre superieur a 3.
        // detect the location of the first peak by averaging the last 10 value
        // by comparing the current pixel (assuming that the peak after 10
        // first elements) flank of the peak should be more than 3.
	pic1 = nb_val - (nb_moy+1);
	difference = 0;
	// tant que la différence est inf à 3, et que toutes les valeur n'ont pas été testé
	// recherche d'un pic descandant
        // As the difference is less than 3, and that all the value has not been tested
        // Search for a peak descandant
	while(pic1 > 0)
	{
		difference = get_tab_moy(buffer,  pic1+1, pic1+nb_moy+1) - ((int)buffer[pic1]+(int)buffer[pic1-1]) / 2;
		if(difference > PIC_SIZE_MIN)
			break;
		pic1--;
	}

	if(pic1 == 0 || difference <= PIC_SIZE_MIN)
		return PIC_NOT_FOUND;

	pic2 = pic1 - 1;
	difference = 0;
	// tant que la différence est inf à 3, et que toutes les valeur n'ont pas été testé
	// recherche d'un pic montant
        // As the difference is less than 3, and that all the value has not been tested
        // Search for a peak amount
	while(pic2 > 0)
	{
		difference = ((int)buffer[pic2]+(int)buffer[pic2-1]) / 2 - get_tab_moy(buffer, pic2+1, pic1);
		if(difference > PIC_SIZE_MIN)
			break;
		pic2--;
	}
	
	// on calcule la position du centre du pic par rapport au centre de la camera. 	
        // We calculated the peak position of the center from the camera center.
	*largeur_pic = pic1-pic2;
	if(pic2 <= 0)
		*pos_center_pic = -nb_val/2;
	else
		*pos_center_pic = pic2 + (pic1-pic2)/2 - nb_val/2;
	return PIC_FOUND;
}

//********************************************************************
//Fonctions externe
// External Features
void epuck_init(Epuck *epuck)
{       
        // initialise l'état de l'epuck en recherche de balle
	// Reset the state of the ball Research epuck
        epuck->state = IS_SEARCHING_BALL;	
	epuck->dist_ball = -1;
	epuck->angle_ball = -1;
	epuck->lin_speed = 0;
	epuck->angle_speed = 300;
}

// permet de normaliser le buffer
// Normalizes the buffer 
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


//Recherche et retourne la position et l'épaisseur du pic. 
// Research and returns the position and width of the peak.
int search_ball(Epuck *epuck, unsigned char buffer[], int nb_val)
{ 
	int largeur_pic_g, largeur_pic_d;
	int pos_pic_g, pos_pic_d;
	char pic_found_g, pic_found_d;
	
	//on fait une fois la recherche du pic depuis la gauche 'g'
	//et une fois depuis la droite 'd'.
        // we did once looking peak from the left 'g'
        // and once from the right 'd'.
	pic_found_g = calc_pic_datas_g(&largeur_pic_g, &pos_pic_g, buffer, nb_val);
	pic_found_d = calc_pic_datas_d(&largeur_pic_d, &pos_pic_d, buffer, nb_val);
	
	//on retoune la largeur du pic. PIC_NOT_FOUND si pas de pic trouvé
        // we returned on the peak width. PIC_NOT_FOUND if no peak found
	if(pic_found_g == PIC_NOT_FOUND && pic_found_d == PIC_NOT_FOUND)
		return PIC_NOT_FOUND;
	//si seul l'acquisition par la gauche retourne une valeur
        // we returned on the peak width. PIC_NOT_FOUND if no peak found
	else if(pic_found_g == PIC_FOUND && pic_found_d == PIC_NOT_FOUND)
	{
		epuck->dist_ball = largeur_pic_g;
		epuck->angle_ball = pos_pic_g;
		return PIC_FOUND;
	}
	//si seul l'acquisition par la droite retourne une valeur
        // if only the acquisition by the right returns a value
	else if(pic_found_g == PIC_NOT_FOUND && pic_found_d == PIC_FOUND)
	{
		epuck->dist_ball = largeur_pic_d;
		epuck->angle_ball = pos_pic_d;
		return PIC_FOUND;
	}
	// si les deux acquisitions rendent une valeur, alors on fait la moyenne des deux
        // If the two acquisitions make a value, then you average the two
	else
	{
		epuck->dist_ball = (largeur_pic_g + largeur_pic_d) / 2;
		epuck->angle_ball = (pos_pic_g + pos_pic_d) / 2;
		return PIC_FOUND;
	}
}

//fonction qui envoie l'epuck vers la balle
// function that sends the puck towards the ball
void goto_ball(Epuck *epuck)
{
	int lin_speed = 0;
	int angle_speed = 0;
	int gain_lin = 35;
	int gain_angle = 6;

	lin_speed = calc_lin_speed(epuck->dist_ball, gain_lin);
	angle_speed = calc_angle_speed(epuck->angle_ball, gain_angle);

/*	if((abs(lin_speed) + abs(angle_speed)) > 1000)
	{
		lin_speed = lin_speed * 999/(abs(lin_speed) + abs(angle_speed));
		angle_speed = angle_speed * 999/(abs(lin_speed) + abs(angle_speed));
	}
*/	
	epuck->lin_speed = lin_speed;
	epuck->angle_speed = angle_speed;
	e_set_speed(lin_speed, angle_speed);
}

//fonction qui calcule la vitesse linéaire optimiale à l'aide d'un régulateur PI
// function that calculates the optimal linear speed using a PI controller
int calc_lin_speed(int distance, int gain)
{
	int consigne = 50;
	float h = 0.1;
	int ti = 3;
	int ecart = consigne-distance;
	int lin_speed;

	ui_lin = ui_lin + h * ecart / ti;
	lin_speed = (ecart + ui_lin) * gain;

	if(lin_speed >= 1000)
	{
		ui_lin = 999/gain - ecart;
		if(ui_lin > 60)			// valeur aberrante vue sur matlab, donc on restreint à 40 la valeur de ui
			ui_lin = 60.0;
		lin_speed = 999;
	}
	else if(lin_speed <= -1000)
	{
		ui_lin = -999/gain + ecart;
		if(ui_lin < -10)		// valeur aberrante vue sur matlab, donc on restreint à -10 la valeur de ui
			ui_lin = -10.0;
		lin_speed = -999;
	}
	return lin_speed;
}

//fonction qui calcule la vitesse angulaire optimiale à l'aide d'un régulateur P
int calc_angle_speed(int pos_pic, int gain)
{
	int consigne = 0;
	int angle_speed = 0;
	int ecart = consigne - pos_pic;

	angle_speed = ecart*gain;

	if(angle_speed >= 1000)
		angle_speed = 999;
	else if(angle_speed <= -1000)
		angle_speed = -999;

	return angle_speed;
}

//vide le terme intégrateur.
// empty the term integrator.
void ARW()
{
	ui_lin = 0.0;
}
