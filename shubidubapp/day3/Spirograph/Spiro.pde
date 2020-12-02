class Spiro {
  float R;
  float r;
  float l;

  float t;
  float px;
  float py;

  float draw_x;
  float draw_y;

  PVector rgb;

  Boolean first = true;
  float k;
  float rot_amount;
  
  Spiro(float R_, float k_, float l_, float draw_x_, float draw_y_, PVector rgb_) {
    R = R_;
    l = l_;
    draw_x = draw_x_;
    draw_y = draw_y_;
    rgb = rgb_;
    k = k_;
  }

  void draw(){
    t += TWO_PI / 360;
    draw(t);
  }

  void draw(float t_) {
    
    float x = R * ((1-k) * cos(t_) + l*k*cos(((1-k)*t_)/k));
    float y = R * ((1-k) * sin(t_) - l*k*sin(((1-k)*t_)/k));
    if (first) {
      px = x;
      py = y;
      first = false;
    }
    
    
    
    colorMode(RGB);
    stroke(rgb.x, rgb.y, rgb.z);
    line(draw_x + x, draw_y + y, draw_x + px, draw_y + py);
    px = x;
    py = y;
  }
}
