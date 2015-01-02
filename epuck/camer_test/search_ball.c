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
//variable globale
#define PIC_SIZE_MIN 3
//static float ui_lin = 0.0;

//*******************************************************
//declaration des fcts interne au module search_ball

int get_tab_moy(unsigned char tab[], int start, int end);
int calc_pic_datas_g(int *largeur_pic, int *pos_pic, unsigned char buffer[], int nb_val);
//int calc_pic_datas_d(int *largeur_pic, int *pos_pic, unsigned char buffer[], int nb_val);


//fonction permettant de faire la moyenne d'un tableau
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
int calc_pic_datas_g(int *largeur_pic, int *pos_center_pic, unsigned char buffer[], int nb_val)
{
	static int nb_moy = 10;
	int pic1, pic2;
	int difference;
	
	//détection de l'endroit du premier pic en moyennant les 10 dernière valeur et
	//en les comparant au pixel en cours (on suppose que le pic est après les 10 
	//premiers éléments) le flanc du  pic doit etre superieur a 3.
	pic1 = nb_moy+1;
	difference = 0;
	// tant que la différence est inf à 3, et que toutes les valeur n'ont pas été testé
	// recherche d'un pic descandant
	while(pic1 < nb_val-1)
	{
		difference = get_tab_moy(buffer, pic1-nb_moy-1, pic1-1) - ((int)buffer[pic1]+(int)buffer[pic1+1]) / 2;
		if(difference > PIC_SIZE_MIN)
			break; 
		pic1++;
	}

	//determination de la largeur du pic.
    //si no_pt = nb_val ca veut dire qu'il ny a pas de pic.
	if(pic1 >= nb_val || difference <= PIC_SIZE_MIN)
		return PIC_NOT_FOUND;
	
	pic2 = pic1 + 1;
	difference = 0;
	// tant que la différence est inf à 3, et que toutes les valeur n'ont pas été testé
	// recherche d'un pic montant
	while(pic2 < nb_val-1)
	{
		difference = ((int)buffer[pic2]+(int)buffer[pic2]) / 2 - get_tab_moy(buffer, pic1, pic2);
		if(difference > PIC_SIZE_MIN)
			break; 
		pic2++;
	}
	
	*largeur_pic = pic2-pic1;
	// on calcule la position du centre du pic par rapport au centre de la camera.
	if(pic2 >= nb_val)
		*pos_center_pic = nb_val/2;
	else
		*pos_center_pic = pic1 + (pic2-pic1)/2 - nb_val/2;
	return PIC_FOUND;
}

// recherche de pic en partant de la droite, c'est à dire de la dernière valeur du tableau
/*int calc_pic_datas_d(int *largeur_pic, int *pos_center_pic, unsigned char buffer[], int nb_val)
{
	static int nb_moy = 10;
	int pic1, pic2;
	int difference;

	//détection de l'endroit du premier pic en moyennant les 10 dernière valeur et
	//en les comparant au pixel en cours (on suppose que le pic est après les 10 
	//premiers éléments) le flanc du  pic doit etre superieur a 3.
	pic1 = nb_val - (nb_moy+1);
	difference = 0;
	// tant que la différence est inf à 3, et que toutes les valeur n'ont pas été testé
	// recherche d'un pic descandant
	while(pic1 > 0)
	{
		difference = get_tab_moy(buffer,  pic1+1, pic1+nb_moy+1) - ((int)buffer[pic1]+(int)buffer[pic1-1]) / 2;
		if(difference > PIC_SIZE_MIN)
			break;
		pic1--;
	}

	//determination de la largeur du pic.
    //si no_pt = 0 ca veut dire qu'il ny a pas de pic.
	if(pic1 == 0 || difference <= PIC_SIZE_MIN)
		return PIC_NOT_FOUND;

	pic2 = pic1 - 1;
	difference = 0;
	// tant que la différence est inf à 3, et que toutes les valeur n'ont pas été testé
	// recherche d'un pic montant
	while(pic2 > 0)
	{
		difference = ((int)buffer[pic2]+(int)buffer[pic2-1]) / 2 - get_tab_moy(buffer, pic2+1, pic1);
		if(difference > PIC_SIZE_MIN)
			break;
		pic2--;
	}
	
	// on calcule la position du centre du pic par rapport au centre de la camera. 	
	*largeur_pic = pic1-pic2;
	if(pic2 <= 0)
		*pos_center_pic = -nb_val/2;
	else
		*pos_center_pic = pic2 + (pic1-pic2)/2 - nb_val/2;
	return PIC_FOUND;
}
*/
//********************************************************************
//Fonctions externe

// permet de normaliser le buffer 
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
int search_ball( unsigned char buffer[], int nb_val)
{ 
	int largeur_pic_g;//, largeur_pic_d;
	int pos_pic_g;//, pos_pic_d;
	char pic_found_g;//, pic_found_d;
	
	//on fait une fois la recherche du pic depuis la gauche 'g'
	//et une fois depuis la droite 'd'.
	pic_found_g = calc_pic_datas_g(&largeur_pic_g, &pos_pic_g, buffer, nb_val);
	//pic_found_d = calc_pic_datas_d(&largeur_pic_d, &pos_pic_d, buffer, nb_val);
	
	//on retoune la largeur du pic. PIC_NOT_FOUND si pas de pic trouvé
	if(pic_found_g == PIC_FOUND)
		return PIC_FOUND;
        else
		return PIC_NOT_FOUND;
	
}

