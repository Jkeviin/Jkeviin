String[][] strs = new String[6][2];
PFont font;
Confetti[] confetti = new Confetti[100];

void setup() {
 size(1920, 1080);
 font = createFont("HelveticaNeue-48.vlw", 48);
 textFont(font);
 frameRate(30);
 textAlign(CENTER);
 textSize(40);
 background(#0d1117);
 fill(255);

 strs[0][0] = "¡Bienvenido!";
 strs[0][1] = "Soy un experto en desarrollo full stack.";

 strs[1][0] = "Mis habilidades incluyen:";
 strs[1][1] = "Java, JS, TS, Node.js, NestJS, Express, GraphQL, MongoDB, SQL Oracle, Angular, TypeORM.";

 strs[2][0] = "Experiencia en metodologías ágiles y tradicionales.";
 strs[2][1] = "Siempre en la búsqueda de nuevas oportunidades para aprender y crecer.";

 strs[3][0] = "He construido aplicaciones web robustas";
 strs[3][1] = "He dominado cada tema a través de proyectos prácticos";

 strs[4][0] = "¡Contáctame!";
 strs[4][1] = "email: kevin.dev.soft@hotmail.com";

 // Inicializamos el confeti
 for (int i = 0; i < confetti.length; i++) {
  confetti[i] = new Confetti(random(width), random(height), random(-1, 1), random(-1, 1));
 }
}

int i = 0;
boolean delete = false;
int s = 0;
int offset = 50;
int mainFontSize = 60;
int secondaryFontSize = 40;

void draw() {
 background(#0d1117);
 fill(255);

 // Dibujamos el confeti
 for (int i = 0; i < confetti.length; i++) {
  confetti[i].display();
  confetti[i].move();
 }

 if (s < strs.length) {
 if ((strs[s][0].length() >= i || strs[s][1].length() >= i) && !delete) {
  if (strs[s][0].length() >= i) {
  textSize(mainFontSize);
  text(strs[s][0].substring(0, i), width/2, height/2 - offset);
  } else {
  textSize(mainFontSize);
  text(strs[s][0], width/2, height/2 - offset);
  }
  if (strs[s][1].length() >= i) {
  textSize(secondaryFontSize);
  text(strs[s][1].substring(0, i), width/2, height/2 + offset);
  } else {
  textSize(secondaryFontSize);
  text(strs[s][1], width/2, height/2 + offset);
  }
  i++;
 } else {
  if (!delete) {
  delay(1500);
  }
  delete = true;
 }

 if (delete) {
  if (i > 0) {
  if (i < strs[s][0].length()) {
   textSize(mainFontSize);
   text(strs[s][0].substring(0, i - 1), width/2, height/2 - offset);
  } else {
   textSize(mainFontSize);
   text(strs[s][0], width/2, height/2 - offset);
  }
  if (i < strs[s][1].length()) {
   textSize(secondaryFontSize);
   text(strs[s][1].substring(0, i - 1), width/2, height/2 + offset);
  } else {
   textSize(secondaryFontSize);
   text(strs[s][1], width/2, height/2 + offset);
  }
  i--;
  } else {
  delete = false;
  s++;
  if (s == strs.length) { // Si s alcanza la longitud de strs, lo reiniciamos a 0
    s = 0;
  }
  }
 }
 }
}

class Confetti {
 float x, y, speedX, speedY;

 Confetti(float x, float y, float speedX, float speedY) {
  this.x = x;
  this.y = y;
  this.speedX = speedX;
  this.speedY = speedY;
 }

 void display() {
  ellipse(this.x, this.y, 5, 5);
 }

 void move() {
  this.x += this.speedX;
  this.y += this.speedY;

  if (this.x > width || this.x < 0) {
  this.speedX *= -1;
  }

  if (this.y > height || this.y < 0) {
  this.speedY *= -1;
  }
 }
}
