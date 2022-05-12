#include<stdio.h>
#include<stdlib.h>
#include <GL/glut.h>
#include<math.h>
#include<time.h>
#include<windows.h>

#define PI 3.14
float AnguloLuna = 0.0, 
AnguloTierra = 0.0, 
AnguloAsteroide = 0.0,
AnguloMarte = 0.0,
AnguloMercurio = 0.0,
AnguloVenus = 0.0,
AnguloJupiter = 0.0,
anguloSaturno = 0.0,
anguloUrano = 30.0,
anguloNeptuno = 60.0;
GLfloat sx = 0.2, sy = 0.2, sz = 0.2;

int planeta1;
GLfloat Negro[] = { 0.0f,0.0f,0.0f,1.0f };
GLfloat Blanco[] = { 1.0f,1.0f,1.0f,1.0f };
GLfloat Azul[] = { 0.0f,0.0f,0.9f,1.0f };
GLfloat er[] = { 0.0f,5.0f,0.9f,1.0f };
GLfloat Amarillo[] = { 0.7f,0.2f,0.0f,1.0f };
GLfloat qAmb[] = { 0.1,0.1,0.1,1.0 };
GLfloat qDif[] = { 1.0,1.0,1.0,1.0 };
GLfloat qSpec[] = { .50,.50,.50,.10 };
GLfloat qPos[] = { 0,0,0,0.1 };
GLfloat sc[8] = { 0.295 , 0.40,0.50, 0.60,0.80,1.0,1.05,1.13 };
double ang = 2 * PI / 300;
double angulo = 2 * PI / 50;

void initLighting()
{
    glEnable(GL_LIGHTING);
    glEnable(GL_LIGHT7);

    glLightfv(GL_LIGHT7, GL_AMBIENT, qAmb);
    glLightfv(GL_LIGHT7, GL_DIFFUSE, qDif);
    glLightfv(GL_LIGHT7, GL_SPECULAR, qSpec);
   
}
void myinit()
{
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glPointSize(1.0);
    glLineWidth(2.0);

}

void background()
{
    glBegin(GL_QUADS);
    glColor3f(0.0, 0.00, 0.00);
    glVertex3f(-01.00, 01.00, 1);
    glColor3f(.20, 0.0, 0.70);
    glVertex3f(01.00, 1.00, 1);
    glColor3f(0, 0.0, 0.0);
    glVertex3f(1.00, -1.00, 1);
    glColor3f(.70, .10, .20);
    glVertex3f(-1.00, -1.00, 1);
    glEnd();
}

void orbit()
{
    glColor3f(0.5, 0.5, 0.5);


    int i = 0;
    for (i = 0; i < 8; i++) {
        glPushMatrix();
        if (i == 5)
        {
            glRotatef(45, 1.0, 0.0, 0.0);
        }
        else
        {
            glRotatef(63, 1.0, 0.0, 0.0);
        }
        glScalef(sc[i], sc[i], sc[i]);
        glBegin(GL_POINTS);
        double ang1 = 0.0;
        int i = 0;
        for (i = 0; i < 300; i++)
        {
            glVertex2d(cos(ang1), sin(ang1));
            ang1 += ang;
        }
        glEnd();
        glPopMatrix();
    }
}

void draw(void)
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    background();
    orbit();
    glLoadIdentity();
    glPushMatrix();
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_COLOR_MATERIAL);
    glPushMatrix();
    glColor3f(0.7, 0.5, 0.0);
    glScalef(sx, sy, sz);
    glLightfv(GL_LIGHT7, GL_POSITION, qPos);
    glMaterialfv(GL_FRONT_AND_BACK, GL_EMISSION, Amarillo);
    glutSolidSphere(1, 50, 50);
    glMaterialfv(GL_FRONT_AND_BACK, GL_EMISSION, Negro);
    glPopMatrix();

    glScalef(0.2, 0.2, 0.2);
    glPushMatrix();
    glRotatef(AnguloMercurio, 0.0, 1.0, -0.5);
    glTranslatef(1.5, 0.0, 0.0);
    glColor3f(1.0, 0.9, 0.0);
    glScalef(0.08, 0.08, 0.08);
    glutSolidSphere(1, 50, 50);
    glPopMatrix();

    glPushMatrix();
    glRotatef(AnguloVenus, 0.0, 1.0, -0.5);
    glTranslatef(2.0, 0.0, 0.0);
    glColor3f(0.9, 0.1, 0.0);
    glScalef(0.1, 0.1, 0.1);
    glutSolidSphere(1, 50, 50);
    glPopMatrix();

    glPushMatrix();
    glRotatef(AnguloTierra, 0.0, 1.0, -0.5);
    glTranslatef(2.5, 0.0, 0.0);
    glColor3f(0.0, 0.1, 0.7);
    glScalef(0.23, 0.23, 0.23);
    glutSolidSphere(1, 50, 50);
    glPushMatrix();
    glRotatef(AnguloLuna, 0.0, 0.1, 0.05);
    glTranslatef(1.3, 0.0, 0.0);
    glColor3f(1.0, 1.0, 1.0);
    glScalef(0.5, 0.5, 0.5);
    glutSolidSphere(0.5, 50, 50);
    glPopMatrix();
    glPopMatrix();

    glPushMatrix();
    glRotatef(AnguloMarte, 0.0, 1.0, -0.5);
    glTranslatef(-3.0, 0.0, 0.0);
    glColor3f(0.05, 0.05, 0.01);
    glScalef(0.17, 0.17, 0.17);
    glutSolidSphere(1, 50, 50);
    glPopMatrix();

    glPushMatrix();
    glColor3f(3.30, 3.30, 3.30);
    glRotatef(63, 1.0, 0.0, 0.0);
    int j = 0, i = 0, div = 90; float siz = 2;
    float scl[4] = { 3.3,3.4,3.35,3.2 };
    for (j = 0; j < 4; j++)
    {
        glPushMatrix(); siz -= 0.3;
        glPointSize(siz);
        glScalef(scl[j], scl[j], scl[j]);
        glBegin(GL_POINTS);
        double ang1 = 0.0 - AnguloAsteroide, a = (2 * PI) / div;
        for (i = 0; i < div; i++)
        {
            glVertex2d(cos(ang1), sin(ang1));
            ang1 += a;
        }
        div += 10;
        glEnd();
        glPopMatrix();
    }
    glPopMatrix();

    glPushMatrix();
    glRotatef(AnguloJupiter, 0.0, 1.0, -0.5);
    glTranslatef(-4.0, 0.0, 0.0);
    glColor3f(0.4, 0.2, 0.0);
    glScalef(0.5, 0.5, 0.5);
    glutSolidSphere(1, 50, 50);
    glPushMatrix();
    glRotatef(AnguloLuna, 1.0, -0.5, 0.0);
    glTranslatef(0.0, 0, 1.1);
    glColor3f(1.0, 1.0, 1.0);
    glScalef(0.1, 0.1, 0.1);
    glutSolidSphere(0.5, 50, 50);
    glPopMatrix();
    glPopMatrix();

    glPushMatrix();
    glRotatef(anguloSaturno, 0.0, 1.0, -1.0);
    glTranslatef(-5.0, 0.0, 0.0);
    glColor3f(0.9, 0.0, 0.0);
    glScalef(0.4, 0.4, 0.4);
    glutSolidSphere(1, 50, 50);
    glPushMatrix();
    glRotatef(45, 1.0, 0.0, 0.0);
    glPointSize(3);
    glColor3f(5.0, 3.0, 1.0);
    glScalef(1.2, 1.2, 1.2);
    glBegin(GL_POINTS);
    double ang1 = 0.0;
    i = 0;
    for (i = 0; i < 50; i++)
    {
        glVertex2d(cos(ang1), sin(ang1));
        ang1 += angulo;
    }
    glEnd();

    glPointSize(2);
    glPopMatrix();
    glPopMatrix();

    glPushMatrix();
    glRotatef(anguloUrano, 0.0, 1.0, -0.5);
    glTranslatef(5.2, 0.0, 0.0);
    glColor3f(0.0, 0.5, 0.9);
    glScalef(0.23, 0.23, 0.23);
    glutSolidSphere(1, 50, 50);
    glPopMatrix();

    glPushMatrix();
    glRotatef(anguloNeptuno, 0.0, 1.0, -0.5);
    glTranslatef(-5.7, 0.0, 0.0);
    glColor3f(0.0, 0.0, 0.9);
    glScalef(0.2, 0.2, 0.2);
    glutSolidSphere(1, 50, 50);
    glPopMatrix();


    glPopMatrix();
    glFlush();
}

void update(int value) {

    if ((AnguloLuna >= 0 && AnguloLuna < 180))
    {
        sx -= 0.0003; sy -= 0.0003; sz -= 0.0003;
    }
    else { sx += 0.0003; sy += 0.0003; sz += 0.0003; }


    AnguloLuna += 2;
    if (AnguloLuna > 360) {
        AnguloLuna -= 360;
    }
    AnguloTierra += 0.7;
    if (AnguloTierra > 360) {
        AnguloTierra -= 360;
    }
    AnguloMercurio += 2;
    if (AnguloMercurio > 360) {
        AnguloMercurio -= 360;
    }
    AnguloVenus += 0.9;
    if (AnguloVenus > 360) {
        AnguloVenus -= 360;
    }
    AnguloMarte += 0.5;
    if (AnguloMarte > 360) {
        AnguloMarte -= 360;
    }
    AnguloJupiter += 0.2;
    if (AnguloJupiter > 360) {
        AnguloJupiter -= 360;
    }
    anguloSaturno += 0.1;
    if (anguloSaturno > 360) {
        anguloSaturno -= 360;
    }
    anguloUrano += 0.05;
    if (anguloUrano > 360) {
        anguloUrano -= 360;
    }
    anguloNeptuno += 0.02;
    if (anguloNeptuno > 360) {
        anguloNeptuno -= 360;
    }
    AnguloAsteroide += 0.002;
    if (AnguloAsteroide > 360) {
        AnguloAsteroide -= 360;
    }
    glutPostRedisplay();
    glutTimerFunc(20, update, 0);
}

int main(int argc, char** argv)
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
    glutInitWindowPosition(0, 0);
    glutInitWindowSize(1000, 1000);
    glutCreateWindow("Sistema Solar");
    initLighting();
    myinit();
    glutDisplayFunc(draw);
    glutTimerFunc(25, update, 0);
    glutMainLoop();
    return 0;
}