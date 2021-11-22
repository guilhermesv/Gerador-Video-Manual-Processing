import com.hamoid.*;
VideoExport videoExport;

PImage spritesheetInicial;
// Taxa de Quadros real do vídeo final
int taxaQuadros = 6;
// Taxa de Quadros simulada, repetindo os frames para ter um vídeo com framerate alto, porém devagar.
int taxaQuadrosFalsa = 1;
boolean gravando = true;

Animacao animacaoGerada;

void setup() {
  
  size(1000, 1000, P3D);
  spritesheetInicial = loadImage("AnimacaoA-1000x1000-3x4.jpg");
  // Nº de colunas, Nº de linhas, Largura do Frame, Altura do Frame, Quantidades de Frames
  animacaoGerada = new Animacao(spritesheetInicial, 3, 4, 1000, 1000, 12);
  frameRate(taxaQuadros);
  
  if(gravando) {
     videoExport = new VideoExport(this, "Animação-Teste.mp4");
     videoExport.setQuality(150, 0);
     videoExport.setFrameRate(taxaQuadros);
     videoExport.startMovie();
  }
}

void draw() {
  animacaoGerada.exibir();
  if(gravando) {
    videoExport.saveFrame();
    if((frameCount/taxaQuadrosFalsa) > 160) {
      println("acabou");
      videoExport.endMovie();
      exit();
    }
  }
  println(frameRate);
}
