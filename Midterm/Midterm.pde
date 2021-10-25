Enemy enemy;
ArrayList<Bullet> bullets;
ArrayList<Enemy> enemies;
boolean team1 = true;

void setup() {
  size(600, 800, P2D);
  bullets = new ArrayList<Bullet>();
  enemies = new ArrayList<Enemy>();
  enemy = new Enemy();
}

void draw() {
  background(255);
  fire();
  println("Number of bullets: " + bullets.size());
  println("Number of enemies: " + enemies.size());
  if (team1) {
    for (int i = 0; i<5; i++) {
      enemies.add(new Enemy());
    }
    team1 = false;
  }
  spawnEnemy();
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

void hitboxdetect(){
  
}
