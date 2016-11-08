/* OOP Lab test 1
 * 08/11/2016
 * Name: Brendan Meath
 * Student Number: C15511093
 */

ArrayList<Star> stars = new ArrayList<Star>();

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
  drawGrid(-5, 5, #F000FF);
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
  float xMin = 50, xMax = width - 50;
  float yMin = 50, yMax = height -50;
  float xInterval = (xMax - xMin) / (max - min);
  float yInterval = (yMax - yMin) / (max - min);
  for(float i = min; i < max; i++)
  {
    for(float x = xMin; x <= xMax; x += xInterval)
    {
      textAlign(CENTER, TOP);
      text((int)i, x, 0);
      for( float y = yMin; y <= yMax; y += yInterval)
      {
        line(x, yMin, x, yMax);
        line(xMin, y, xMax, y);
        
      }
    }
  }
}