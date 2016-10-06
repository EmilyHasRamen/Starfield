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
	starBits[45]= new Oddball4Particle();
	starBits[46]= new Oddball3Particle();
	starBits[47]= new Oddball2Particle();
	starBits[48]= new OddballParticle();
	starBits[49]= new JumboParticle();

}
void draw()
{
	PImage img, maskImg;
	img = loadImage("giphy_blackbg.gif");
//	tint(255, 126);  // Apply transparency without changing color
//	tint(0, 126);
//	tint(255, 0);
	maskImg = loadImage("giphy_blackbg_whitefg.gif");
//	maskImg = loadImage("giphy_whitebg_blackfg.gif");
	img.mask(maskImg);
//	image(img, 0, 302);

	//your code here
	for(int i=0; i<starBits.length; i++)
	{
		starBits[i].hide();
		starBits[i].move();
		starBits[i].show();

		image(img, 0, 302);
	}

}
class NormalParticle implements Particle
//class NormalParticle implements Particle
{
	//your code here
	double dSpeed, dX, dY, dTheta;
		NormalParticle()
		{
			setParticle();
		}
		void setParticle()
		{
			dX = centerX;
			dY = centerY;
//			dSpeed = Math.random()*10;
			dSpeed = (Math.random()*10)+3;
			dTheta = Math.PI*2*Math.random();
//println("dX=" + dX + ", dY=" + dY + ", dSpeed=" + dSpeed + ", dTheta=" + dTheta);
		}
		void move()
		{
			dX = dX+(Math.cos(dTheta)*dSpeed);
			dY = dY+(Math.sin(dTheta)*dSpeed);

			if ( screenX<dX || screenY<dY || dY<0 || dX<0 ) {
//				NormalParticle();
				setParticle();
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
	double dSpeed, dX, dY, dTheta, dThetaChg;
		OddballParticle()
		{
			setParticle();
		}
		void setParticle()
		{
			dX = centerX;
			dY = centerY;
//			dSpeed = Math.random()*10;
			dSpeed = (Math.random()*10)+3;
			dTheta = Math.PI*2*Math.random();
//			dThetaChg = Math.PI*2*Math.random();
			dThetaChg = Math.PI/50;
//println("dX=" + dX + ", dY=" + dY + ", dSpeed=" + dSpeed + ", dTheta=" + dTheta);
		}
	void move()
	{
			dX = dX+(Math.cos(dTheta)*dSpeed);
			dY = dY+(Math.sin(dTheta)*dSpeed);
			dTheta += dThetaChg;
//			dThetaChg = Math.PI*2*Math.random();
//			dThetaChg += Math.PI/200;
			dThetaChg += .01;
			if ( screenX<dX || screenY<dY || dY<0 || dX<0 ) {
				setParticle();
			}
	}
	void show()
	{
		fill(0,255,0);	
			ellipse((float)dX, (float)dY, 30, 30);
	}
	void hide()
	{
			fill(0);
			ellipse((float)dX, (float)dY, 31, 31);
	}
}
class Oddball2Particle extends OddballParticle//uses inheritance
{
	void move()
	{
			dX = dX+(Math.cos(dTheta)*dSpeed);
			dY = dY+(Math.sin(dTheta)*dSpeed);
			dTheta += dThetaChg;
			dThetaChg -= .01;
			if ( screenX<dX || screenY<dY || dY<0 || dX<0 ) {
				setParticle();
			}
	}
	void show()
	{
		fill(0,0,255);	
			ellipse((float)dX, (float)dY, 30, 30);
	}
}
class Oddball3Particle extends OddballParticle//uses inheritance
{
	void move()
	{
			dX = dX+(Math.cos(dTheta)*dSpeed);
			dY = dY+(Math.sin(dTheta)*dSpeed);
			dTheta += dThetaChg;
			if ( screenX<dX || screenY<dY || dY<0 || dX<0 ) {
				setParticle();
			}
	}
	void show()
	{
		fill(255,0,255);	
			ellipse((float)dX, (float)dY, 30, 30);
	}
}
class Oddball4Particle extends OddballParticle//uses inheritance
{
		void setParticle()
		{
			dX = centerX;
			dY = centerY+10;
			dSpeed = Math.random()*10;
//			dSpeed = (Math.random()*10)+3;
			dTheta = Math.PI*2*Math.random();
//			dThetaChg = Math.PI*2*Math.random();
			dThetaChg = Math.PI/50;
//println("dX=" + dX + ", dY=" + dY + ", dSpeed=" + dSpeed + ", dTheta=" + dTheta);
		}
	void move()
	{
			dX = dX+(Math.cos(dTheta)*dSpeed);
			dY = dY+(Math.sin(dTheta)*dSpeed);
			dTheta += dThetaChg;
			if ( screenX<dX || screenY<dY || dY<0 || dX<0 ) {
				setParticle();
			}
	}
	void show()
	{
		fill(0,255,255);	
			ellipse((float)dX, (float)dY, 30, 30);
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
