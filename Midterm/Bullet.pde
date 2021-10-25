class Bullet {
  PVector position, mousePos, bulletspeed;
  float bulletlength = 15;
  boolean alive = true;
  int timestamp;
  float lifetime = 2000;


  Bullet(float x, float y) {
    stroke(0);
    bulletspeed = new PVector(0, -10);
    position = new PVector(x, y);
    timestamp = millis();
  }

  void draw() {
    line(position.x, position.y, position.x, position.y - 10);
    position.add(bulletspeed);
    if (alive && millis() > timestamp + lifetime) alive = false;
  }
}
