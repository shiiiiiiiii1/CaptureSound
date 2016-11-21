import processing.video.*;   // カメラキャプチャのライブラリ
import ddf.minim.*;   // 音出力・生成のライブラリ
import ddf.minim.signals.*;   // 音出力・生成のライブラリ

Capture cam;

Minim minim;
AudioOutput out;
SineWave sine;


void setup() {
/* 音出力・生成のセットアップ */
  minim = new Minim(this);
/* カメラキャプチャのセットアップ */
  size(1280, 720);
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("no camera!!!!!");
    exit();
  } else {
    println("DEVICE resolution");
    for (String c : cameras) {
      println(c);
    }
    cam = new Capture(this, cameras[0]);
    println("device start");
    cam.start();
    loadPixels();
  }
}

void draw() {
  if (cam.available()) {
    out = minim.getLineOut(Minim.STEREO);
    cam.read();
    cam.loadPixels();
    int pixel_sum = 0;
    int pixel_count = cam.height * cam.height;
    int pixel_ave;

    for (int y = 0; y < cam.height; y++){
      for (int x = 0; x < cam.width; x++){
        int pixelColor = cam.pixels[y * cam.width + x];

        int r = (pixelColor >> 16) & 0xff;
        int g = (pixelColor >> 8 ) & 0xff;
        int b = pixelColor & 0xff;

        r = g = b = (r + g + b)/3;
        pixel_sum += r;

        pixels[y * cam.width + x] = color(r, g, b);
      }
    }
    pixel_ave = pixel_sum / pixel_count;
    println("pixel_ave: "+pixel_ave);
    pixel_ave += 500;
    updatePixels();
    sine = new SineWave(pixel_ave, 0.8, out.sampleRate());
    out.addSignal(sine);
    delay(750);
    out.close();
  }
}

void stop() {
  out.close();
  minim.stop();
  super.stop();
}