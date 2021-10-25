class Enemy {
  PVector position;
  float speed = 10;
  float acceleration = 1;
  PImage plane3;
  float y;
  boolean alive = true;
  int timestamp;
  float lifetime = 20000;

  Enemy() {
    position = new PVector(random(25, width-25), y);
    plane3 = loadImage("plane3.png");
    plane3.resize(50, 50);
    timestamp = millis();
    position.y = -50;
  }

  void spawn() {
    image(plane3, position.x, position.y);
  }

  void move() {
    speed = 3;
    acceleration = 0.1;
    position.y += speed + acceleration;
  }

  void draw() {
    spawn();
    move();
    if (alive && millis() > timestamp + lifetime) alive = false;
  }
}
