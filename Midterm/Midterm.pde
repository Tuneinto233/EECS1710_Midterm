Enemy enemy;
Bullet bullet;
ArrayList<Bullet> bullets;
ArrayList<Enemy> enemies;
boolean team1 = true;
boolean alive = true;
PImage plane1;
PFont font;




void setup() {
  size(600, 800, P2D);
  bullets = new ArrayList<Bullet>();
  enemies = new ArrayList<Enemy>();
  enemy = new Enemy();
  plane1 = loadImage("plane1.png");
  plane1.resize(50, 50);
  imageMode(CENTER);
  font = createFont("Arial", 50);
  textFont(font, 50);
}

void draw() {
  background(255);
  fire();
  mainSpawn();
  println("Number of bullets: " + bullets.size());
  println("Number of enemies: " + enemies.size());
  if (team1) {
    for (int i = 0; i<5; i++) {
      enemies.add(new Enemy());
    }
    team1 = false;
  }
  spawnEnemy();
  text(0, 50, 50);
}
  


void mousePressed() {
  bullets.add(new Bullet(mouseX, mouseY));
}

void fire() {
  for (int i = bullets.size()-1; i>=0; i--) {
    Bullet bullet = bullets.get(i);
    if (bullet.alive) {
      bullet.draw();
    } else {
      bullets.remove(i);
    }
  }
}

void spawnEnemy() {
  for (int i = enemies.size()-1; i>=0; i--) {
    Enemy enemy = enemies.get(i);
    if (enemy.alive) {
      enemy.draw();
    } else {
      enemies.remove(i);
    }
  }
}

void mainSpawn(){
  image(plane1, mouseX, mouseY);
}
