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
}

void loadData(String file, String options)
{
  tfile = loadTable(file, options);
  
  for(TableRow row :tfile.rows())
  {
    Star s_tmp = new Star(row);
    stars.add(s_tmp);
  }
}