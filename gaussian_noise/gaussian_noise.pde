int block_width;
int num_blocks = 64;
int[] numbers = new int[num_blocks + 1];

float progress;
int cycle = 0;

float speed = 5;

void setup() {
    size(640, 360);

    block_width = width / num_blocks;
    background(0);
    noStroke();

    colorMode(HSB, 360.0, 100.0, 100.0, 100.0);
}

void draw() {
    fill(color((110 * (cycle + 1)) % 360, 70.0, 80.0), 7);
    rect(0,0,width,height);

    progress = -frameCount * speed % (height * 2.2);
    cycle = floor(frameCount * speed / (height * 2.2));

    translate(0, progress + height);
    fill(color((110 * (cycle)) % 360, 70.0, 80.0), 90);

    rect(0, -height, width, height);

    for (int i = 0; i < numbers.length; i++) {
        numbers[i] = (int) (randomGaussian() * height / 4);
    }

    numbers = sort(numbers, numbers.length);

    int i = 0;
    for (int w = 0; w < width; w += block_width) {
        rect(w, 0, block_width, abs(numbers[i]));
        i++;
    }
}
