#ifndef _H_RAYCASTER
#define _H_RAYCASTER

#include <GL/glut.h>
#include <stdbool.h>

#include "player.h"
#include "map.h"
#include "trigonometry.h"
#include "3D_render.h"

#define ANGLE_OF_VISION 30
#define AMMOUNT_OF_RAYS (ANGLE_OF_VISION * 2)

#define PRECISION 0.0001


/*
    Cast the 2D top-down vision rays for the player and calls the 3D render
*/
void cast_rays(bool debug_view);

#endif