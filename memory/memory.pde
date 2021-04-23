PImage katze;
PImage lowe;
PImage mensch;

int imgLength = 250;
int padding = 20;

int w = ((imgLength + padding) * 3) + padding;

ArrayList<Card> allCards = new ArrayList<Card>();

void handleClick(int x, int y) {
  for (Card card : allCards) {
    card.checkBB(x, y);
  }
}

public class Card {
  boolean isClicked = false;
  
  int posX = 0;
  int posY = 0;
  int width = imgLength;
  int height = imgLength;
  PImage mImage;

  public Card(int posX, int posY, PImage mImage) {
    this.posX = padding + posX * (imgLength + padding);
    this.posY = padding + posY * (imgLength + padding);
    this.mImage = mImage;
    allCards.add(this);
  }

  void checkBB(int x, int y) {
    if ((x >= posX && x <= (posX + width)) && (y >= posY && y <= (posY + height))) {
      isClicked = !isClicked;
    }
  }

  void draw() {
    if (isClicked) {
      image(mImage, posX, posY);
    } else {
      rect(posX, posY, width, height);
    }
  }
}

Card lowe1;
Card lowe2;
Card katze1;
Card katze2;
Card mensch1;
Card mensch2;

void setup() {
  size(830, 830);

  katze = loadImage("katze.jpg");
  lowe = loadImage("löwe.jpg");
  mensch = loadImage("mensch.jpg");

  lowe1 = new Card(0, 0, lowe);
  lowe2 = new Card(0, 1, lowe);
  katze1 = new Card(0, 2, katze);
  katze2 = new Card(1, 0, katze);
  mensch1 = new Card(1, 1, mensch);
  mensch2 = new Card(1, 2, mensch);
}

void draw() {
  lowe1.draw();
  lowe2.draw();
  katze1.draw();
  katze2.draw();
  mensch1.draw();
  mensch2.draw();
}

void mouseReleased() {
  handleClick(mouseX, mouseY);
}
