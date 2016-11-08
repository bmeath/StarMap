/* OOP Lab test 1
 * 08/11/2016
 * Name: Brendan Meath
 * Student Number: C15511093
 */

ArrayList<Star> stars = new ArrayList<Star>();
float xprev, yprev;

void setup()
{
  size(800, 800);
  
  String file = "HabHYG15ly.csv";
  String options = "header";
  loadData(file, options);
  printStars(stars);
}

void draw()
{
  background(0);
  drawGrid(-5, 5, #F000FF);
  plotStars(stars);
}

void mousePressed()
{
  for(Star s:stars)
  {
    if(s.inRange())
    {
      xprev = map(s.Xg, -5, 5, 50, width - 50);
      yprev = map(s.Yg, -5, 5, 50, height - 50);
      stroke(#00FFFF);
      line(xprev, yprev, mouseX, mouseY);
      text(s.DisplayName, 25, height - 25);
    }
  }
}

void mouseReleased()
{
  for(Star s:stars)
  {
    if(s.inRange())
    {
      
      
      stroke(#00FFFF);
      line(xprev, yprev, map(s.Xg, -5, 5, 50, width - 50), map(s.Yg, -5, 5, 50, height - 50));
      text(s.DisplayName, 25, height - 25);
    }
  }
}

void loadData(String file, String options)
{
  
  Table tfile = loadTable(file, options);
  
  for(TableRow row :tfile.rows())
  {
    Star s_tmp = new Star(row);
    stars.add(s_tmp);
  }
}

void printStars(ArrayList<Star> starList)
{
  for(Star s:starList)
  {
    println(s);
  }
}

void drawGrid(float min, float max, color colour)
{
  stroke(colour);
  fill(colour);
  
  // I know i could have used map() here
  float xMin = 50, xMax = width - 50;
  float yMin = 50, yMax = height -50;
  float xInterval = (xMax - xMin) / (max - min);
  float yInterval = (yMax - yMin) / (max - min);
  float i, x, y;
  
  i = min;
  for(x = xMin; x <= xMax; x += xInterval)
  {
    line(x, yMin, x, yMax);
    textAlign(CENTER, TOP);
    text((int)i++, x, 0);
  }
  
  i = min;
  for(y = yMin; y <= yMax; y += yInterval)
  {
    line(xMin, y, xMax, y);
    textAlign(LEFT, CENTER);
    text((int)i++, 0, y);
  }
}

void plotStars(ArrayList<Star> starList )
{
  stroke(#FF0000);
  
  float x, y, diameter;
  for(Star s:starList)
  {
    noFill();
    x = map(s.Xg, -5, 5, 50, width - 50);
    y = map(s.Yg, -5, 5, 50, height - 50);
    diameter = s.AbsMag;
    ellipse(x, y, diameter, diameter);
    fill(255);
    textAlign(LEFT, CENTER);
    text(s.DisplayName, x, y);
  }
}