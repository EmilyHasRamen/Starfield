//your code here
Particle[] starBits;
public final double centerX=250, centerY=250;
public final float screenX=500, screenY=500;
void setup()
{
	//your code here
	background(0);
//	size(screenX,screenY);
	size(500,500);
	starBits = new Particle[50];
	for(int i=0; i<starBits.length; i++)
	{
		starBits[i]=new NormalParticle();
	}
	starBits[49]= new JumboParticle();

}
void draw()
{
	PImage img;
	img = loadImage("giphy_blackbg.gif");
	tint(255, 126);  // Apply transparency without changing color
//	tint(0, 126);
//	tint(255, 0);
	image(img, 0, 302);

	//your code here
	for(int i=0; i<starBits.length; i++)
	{
		starBits[i].hide();
		starBits[i].move();
		starBits[i].show();
	}

}
class NormalParticle implements Particle
//class NormalParticle implements Particle
{
	//your code here
	double dSpeed, dX, dY, dTheta;
		NormalParticle()
		{
			dX = centerX;
			dY = centerY;
			dSpeed = Math.random()*10;
			dTheta = Math.PI*2*Math.random();
//println("dX=" + dX + ", dY=" + dY + ", dSpeed=" + dSpeed + ", dTheta=" + dTheta);
		}
		void move()
		{
			dX = dX+(Math.cos(dTheta)*dSpeed);
			dY = dY+(Math.sin(dTheta)*dSpeed);

			if ( screenX<dX || screenY<dY || dY<0 || dX<0 ) {
//				NormalParticle();
			dX = centerX;
			dY = centerY;
			dSpeed = Math.random()*10;
			dTheta = Math.PI*2*Math.random();
			}
		}
		void show()
		{
//println("dX=" + dX + ", dY=" + dY + ", dSpeed=" + dSpeed + ", dTheta=" + dTheta);
			//Remember that there should be a hide function
			fill(255);
			ellipse((float)dX, (float)dY, 10, 10);
		}
		
		void hide()
		{
			fill(0);
			ellipse((float)dX, (float)dY, 11, 11);
		}
}
interface Particle
{
	//your code here
	public void move();
	public void show();
	public void hide();
}
class OddballParticle implements Particle //uses an interface
{
	//your code here
	void move()
	{

	}
	void show()
	{

	}
	void hide()
	{
	}
}
class JumboParticle extends NormalParticle//uses inheritance
{
	//your code here
	
	void show()
	{
		fill(255,0,0);	
		ellipse((float)dX, (float)dY, 25, 25);
	}
	void hide()
	{
		fill(0);	
		ellipse((float)dX, (float)dY, 26, 26);
	}
}
