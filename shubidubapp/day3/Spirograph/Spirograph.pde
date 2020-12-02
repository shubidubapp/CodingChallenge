ArrayList<Spiro> spiro_list = new ArrayList();

Boolean saving = true;

float t;
float t_step = TWO_PI / 720.0f;

int draw_step = 4;


void setup() {
  size(1000, 1000);
  background(0);
  strokeWeight(1.5);
  stroke(255);

  example();
}

void example() {
  for (int i = 0; i < 20; i++) {
    PVector c = new PVector(30*i + 30, 10*i + 10, 7.5*i + 7.5);
    int step_ = 5;
    int base_scale = 10;
    spiro_list.add(new Spiro(base_scale + i*step_, 0.25, 0.99, width/8, height - height/8, c));
    spiro_list.add(new Spiro(base_scale + i*step_, 0.25, 0.99, width - width/8, height - height/8, c));
    spiro_list.add(new Spiro(base_scale + i*step_, 0.25, 0.99, width/8, height/8, c));
    spiro_list.add(new Spiro(base_scale + i*step_, 0.25, 0.99, width - width/8, height/8, c));
  }
  spiro_list.add(new Spiro(35, 0.45, 0.7, width/2f, height/2f, new PVector(60, 180, 180)));
  spiro_list.add(new Spiro(160, 0.8, 0.5, width/2f, height/2f, new PVector(30, 180, 50)));
  spiro_list.add(new Spiro(175, 0.35, 0.3, width/2f, height/2f, new PVector(200, 200, 75)));
  spiro_list.add(new Spiro(200, 0.35, 0.3, width/2f, height/2f, new PVector(200, 60, 75)));

  for (int i = 0; i < 20; i++) {

    spiro_list.add(new Spiro(280 + i*10, 0.25, 0.8, width/2f, height/2f, new PVector(60, 180, 180)));
  }
}


void draw() {
  for (int j = 0; j < draw_step; j++) {
    for (int i = spiro_list.size() - 1; i > -1; i--) {
      spiro_list.get(i).draw(t);
      float rot_amount = spiro_list.get(i).k * 100 / gcd(spiro_list.get(i).k * 100, 100f);
      if (t / TWO_PI > rot_amount) {
        spiro_list.remove(spiro_list.get(i));
      }
    }
    t += t_step;
  }
  if (saving) {
    saveFrame("out/output-######.png");
  }
  if (spiro_list.size() == 0) {
    noLoop();
  }
}

float gcd(float a, float b) {
  if (b==0) return a;

  return gcd(b, a%b);
}

float c_mod(float c) {
  return mod(c, 255);
}

float mod(float a, float b) {
  if (a == b) return a;
  return a % b;
}
