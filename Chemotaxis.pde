PImage img;
Bacteria [] dots;
Drake hunter;

void setup(){
	size(600,600);
	background(0);
	img = loadImage("Drake.jpg");
	dots = new Bacteria[200];
	for(int i = 0; i < dots.length;i++)
	{

	  dots[i] = new Bacteria();
	}
	hunter = new Drake();
}
void draw(){

	fill(0);
	rect(-50,-50, 650,650);
	hunter.show();
	for(int i = 0; i < dots.length; i++)
	{
		dots[i].move();
		dots[i].show();
	}
}

void mousePressed()
{
	setup();
}

class Bacteria
{
	int x, y;
	boolean alive;
	Bacteria()
	{
		x = (int)(Math.random()*600);
		y = (int)(Math.random()*600);
		alive = true;
	}
	void move()
	{
		x = x + (int)(Math.random()*3)-1;
		y = y + (int)(Math.random()*3)-1;
	}
	void show()
	{
		noStroke();
		fill(255,200,0);

		// image(img, x, y);
		if(get(x,y) != color(255,200,0) && get(x,y)!=color(0)  )
			alive = false;
		if(alive == true)
			ellipse(x,y,15,15);
	}
}

class Drake
{
	int x, y;
	Drake()
	{
		x = mouseX;
		y = mouseY;
	}
	void show()
	{	
		fill(255);
		image(img, mouseX-img.width/2, mouseY-img.height/2);
	}
}
