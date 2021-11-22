// Daniel Shiffman
// http://youtube.com/thecodingtrain
// https://thecodingtrain.com/CodingChallenges/111-animated-sprite.html

// Horse Spritesheet from
// https://opengameart.org/content/2d-platformer-art-assets-from-horse-of-spring

// Animated Sprite
// https://youtu.be/3noMeuufLZY

class Animacao {

  PImage spritesheet;
  int nColunas, nLinhas, quadroLargura, quadroAltura, quadroTotal;
  ArrayList<PImage> animacao;

  Animacao(  PImage spritesheet_, int nColunas_, 
    int nLinhas_, int quadroLargura_, 
    int quadroAltura_, int quadroTotal_) {

    spritesheet = spritesheet_;
    nColunas = nColunas_;
    nLinhas = nLinhas_;
    quadroLargura = quadroLargura_;
    quadroAltura = quadroAltura_;
    quadroTotal = quadroTotal_;
    animacao = new ArrayList<PImage>();
    
    for (int i = 0; i < nLinhas; i++) {
      for (int j = 0; j < nColunas; j++) {
        int x = j * quadroLargura;
        int y = i * quadroAltura;
        PImage quadroTemp = spritesheet.get(x, y, quadroLargura, quadroAltura);
        animacao.add(quadroTemp);
      }
    }
  }
  
  void exibir() {
    int quadro = (frameCount/taxaQuadrosFalsa) % quadroTotal;
    image(animacao.get(quadro), 0, 0);
  }
}
