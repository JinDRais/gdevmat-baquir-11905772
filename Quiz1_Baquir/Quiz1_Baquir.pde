float amplitude = 0, time = 0.0f, speed = .01, frequency = 1;

// the function that gets called at the very first frame
void setup()
{
  size(360, 244, P3D); //set window size to 1280 x 720 
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}


// the function that gets called at every frame
void draw()
{
  background(0); // sets the background color of the whole window

  drawCartesianPlane();
  drawLinearFunction();
  drawQuadraticFunction();
  drawSineWave();
}

void drawCartesianPlane()
{
  strokeWeight(3); //changes the thickness of the line below it
  color white = color(255, 255, 255); // declare a color variable
  fill (white); // fills it with the color selected
  stroke(white); // all the strokes will be with the color selected
  line(-0, -300, 0, 300); // draws a line x1, y1, x2, y2
  line(-300, -0, 300, 0);


  //Sine Wave
  for (int i = -300; i <= 300; i+=10)
  {
    line (i, -2, i, 2);
    line (-2, i, 2, i);
  }
}  

void drawLinearFunction()
{
  /*
   f(x) = -5x + 40
   Let x be 2, then y = 30 (2,30);
   Let x be -5, then y = 65(-5, 65);
   */

  color purple = color(128, 0, 128);
  fill (purple);
  noStroke();

  for (float x = -200; x <= 200; x+=0.1f)
  {
    circle(x, (x * -5) + 2, 5); // draws a circle at x,y with thickness
  }
}

void drawQuadraticFunction()
{
  /*
   f(x) = x^2 - 15x - 3;
   Let x be 2, then y = 3;
   Let x be -1, then y = -6;
   */

  color yellow = color(255, 255, 0);
  fill (yellow);
  stroke(yellow);
  noStroke();

  for (float x = -300; x <= 300; x+=0.1f)
  {
    circle(x, ((float)Math.pow(x, 2) - (x * 15) - 3), 5);
  }
}

void drawSineWave()
{
  color blue = color (0, 0, 255);
  fill(blue);
  stroke(blue);

  //Drawing sine wave
  for (float x = -(1); x <=1; x+=0.01f)
  {
    circle(x * 180, (float)Math.sin(time + x) * amplitude, 1);
  }

  time += speed;
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      amplitude+=5;
    } else if (keyCode == DOWN)
    {
      amplitude-=5;
    } else if (keyCode == RIGHT)
    {
      speed += 0.02f; 
      print("increase frequency, get quicker");
    } else if (keyCode == LEFT)
    {
      speed -= 0.02f;
      print("decrease frequency, get slower");
    }
  }
  if (keyPressed)
  {

    if (key == ']')
    {
      frequency+=.24;
      print("increase frequency");
      print(frequency);
    } else if (key == '[')
    {
      frequency-=.24;
      print("decrease frequency");
      print(frequency);
    }
  }
}
