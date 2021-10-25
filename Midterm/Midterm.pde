Enemy enemy;
Bullet bullet;
ArrayList<Bullet> bullets;
ArrayList<Enemy> enemies;
boolean team1 = true;
boolean alive = true;
PVector hitbox;
boolean hitboxtest = false;
PImage plane1;



boolean hitDetectRect(PVector p1, PVector  p2) {
  hitbox = hitbox.copy().div(2);

  if (p1.x >= p2.x - hitbox.x && p1.x <= p2.x + hitbox.x && p1.y >= p2.y - hitbox.y && p1.y <= p2.y + hitbox.y) {
    return true;
  } else {
    return false;
  }
}


void setup() {
  size(600, 800, P2D);
  bullets = new ArrayList<Bullet>();
  enemies = new ArrayList<Enemy>();
  enemy = new Enemy();
  hitbox = new PVector(50, 50);
  plane1 = loadImage("plane1.png");
  plane1.resize(50, 50);
  imageMode(CENTER);
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

  if(hitboxtest){
  if (hitDetectRect(enemy.position, bullet.position)) {
    println("enemykilled");
  }
  }
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
