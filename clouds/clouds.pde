void setup() {
  size(720, 720);
  loadPixels();
  colorMode(HSB, 360, 1.0, 1.0, 1.0);
  noiseSeed(1);
  noiseDetail(4, 0.5);
}

float scale = .5;
float scrollIntensity = .4;

int offsetX = 0;
int offsetY = 0;

void draw() {
  for (int i = 0; i < (width * height); i++) {
    pixels[i] = color((frameCount * 2 + i % width / 4) % 360, 1.0, noise((i % width - mouseX + offsetX) * pow(scale, 2), (i / width - mouseY + offsetY) * pow(scale, 2)));
  }
  updatePixels();
}

void mouseWheel(MouseEvent event) {
  scale *= 1 + event.getCount() * scrollIntensity;
}

void mouseMoved(MouseEvent event) {
  offsetX += mouseX - pmouseX;
  offsetY += mouseY - pmouseY;
}
