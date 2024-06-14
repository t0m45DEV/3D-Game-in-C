#include <GL/glut.h>

#include "windowDisplay.h"
#include "player.h"
#include "input.h"
#include "map.h"


void display(void)
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    draw_map_2D();
    draw_player(player.x_pos, player.y_pos);
    glutSwapBuffers();
}


void window_create(int argc, char** argv)
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB);
    glutInitWindowSize(WINDOW_WIDTH, WINDOW_HEIGHT);
    glutInitWindowPosition(X_CENTER_POS, Y_CENTER_POS);
    glutCreateWindow(WINDOW_TITLE);
    gluOrtho2D(0, WINDOW_WIDTH, 0, WINDOW_HEIGHT);
    glClearColor(0.5, 0.5, 0.5, 0);
    glutDisplayFunc(display);
    glutKeyboardFunc(buttons);
    glutMainLoop();
}
