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
	starBits = new Particle[25];
	for(int i=0; i<starBits.length; i++)
	{
		starBits[i]=new NormalParticle();
	}

	starBits[0]= new JumboParticle();
	starBits[1]= new OddballParticle(); 	// green - "spiral"
	starBits[2]= new Oddball2Particle();	// dark blue - reverse "spiral"
	starBits[3]= new Oddball3Particle();	// pink - orbit touches center
	starBits[4]= new Oddball4Particle();	// light blue - non-centered orbit
	starBits[5]= new Oddball5Particle();	// yellow - faster non-centered orbit
	starBits[6]= new Oddball6Particle();	// Tardis

	starBits[7]= new Oddball7Particle();	// random color

}
void draw()
{
	PImage img, maskImg;
	img = loadImage("giphy_blackbg.gif");
	maskImg = loadImage("giphy_blackbg_whitefg.gif");
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
			dSpeed = (Math.random()*10)+2;
			dTheta = Math.PI*2*Math.random();
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
			dSpeed = Math.random()*10;
			dTheta = Math.PI*2*Math.random();
			dThetaChg = Math.PI/50;
		}
	void move()
	{
			// squiggle path
			dX = dX+(Math.cos(dTheta)*dSpeed);
			dY = dY+(Math.sin(dTheta)*dSpeed);
			dTheta += dThetaChg;  //  circle tangent to center
//			dThetaChg += .05;     //  made into spinner
			dThetaChg += .04;     //  made into spinner
			if ( screenX<dX || screenY<dY || dY<0 || dX<0 ) {
				setParticle();
			}
	}
	void show()
	{
			fill(0,255,0);  // green - "spiral"
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
			// squiggle reverse path
			dX = dX+(Math.cos(dTheta)*dSpeed);
			dY = dY+(Math.sin(dTheta)*dSpeed);
			dTheta += dThetaChg;  //  circle tangent to center
//			dThetaChg -= .05;     //  made into reverse spinner
			dThetaChg -= .04;     //  made into reverse spinner
			if ( screenX<dX || screenY<dY || dY<0 || dX<0 ) {
				setParticle();
			}
	}
	void show()
	{
		fill(0,0,255);  // dark blue - reverse "spiral"
			ellipse((float)dX, (float)dY, 30, 30);
	}
}

class Oddball3Particle extends OddballParticle//uses inheritance
{
	void move()
	{
			// circular path adjacent to center
			dX = dX+(Math.cos(dTheta)*dSpeed);
			dY = dY+(Math.sin(dTheta)*dSpeed);
			dTheta += dThetaChg;  //  circle tangent to center
			if ( screenX<dX || screenY<dY || dY<0 || dX<0 ) {
				setParticle();
			}
	}

	void show()
	{
		fill(255,0,255);  // pink - orbit touches center
			ellipse((float)dX, (float)dY, 30, 30);
	}
}

class Oddball4Particle extends OddballParticle//uses inheritance
{
	void setParticle()
	{
		// circular path "orbiting" center
		dSpeed = -2*Math.PI;
		dTheta = 2*Math.PI;
		dThetaChg = 1/(1.5*Math.PI*dSpeed);
		dX = centerX-(Math.cos(dTheta)*dSpeed)+10;
		dY = centerY-(Math.sin(dTheta)*dSpeed)-180;
	}
	void move()
	{
			dX = dX+(Math.cos(dTheta)*dSpeed);
			dY = dY+(Math.sin(dTheta)*dSpeed);
			dTheta += dThetaChg;  //  circle tangent to center
			if ( screenX<dX || screenY<dY || dY<0 || dX<0 ) {
				setParticle();
			}
	}
	void show()
	{
		fill(0,255,255);  // light blue - non-centered orbit
			ellipse((float)dX, (float)dY, 30, 30);
	}
}

class Oddball5Particle extends OddballParticle//uses inheritance
{
	void setParticle()
	{
		// circular path "orbiting" center
		dSpeed = 3*(2*Math.PI);
		dTheta = 2*Math.PI;
		dThetaChg = 9/(Math.PI*dSpeed);
		dX = centerX-(Math.cos(dTheta)*dSpeed)+10;
		dY = centerY-(Math.sin(dTheta)*dSpeed)-100;
	}
	void move()
	{
			// circular path "orbiting" center
			dX = dX+(Math.cos(dTheta)*dSpeed);
			dY = dY+(Math.sin(dTheta)*dSpeed);
			dTheta += dThetaChg;  //  circle tangent to center
			if ( screenX<dX || screenY<dY || dY<0 || dX<0 ) {
				setParticle();
			}
	}
	void show()
	{
		fill(255,255,0);  // yellow - faster non-centered orbit
			ellipse((float)dX, (float)dY, 30, 30);
	}
}

class Oddball6Particle extends OddballParticle//uses inheritance
{
//	double dSpeed, dX, dY, dTheta, dThetaChg;
	PImage img, maskImg, imgBlack;
		void setParticle()
		{
			// circular path "orbiting" center
			imgBlack = loadImage("Tardis_black_100x100.jpg");
			img = loadImage("Tardis_100x100.jpg");
			maskImg = loadImage("Tardis_blackbg_whitefg_100x100.jpg");
			img.mask(maskImg);

			dSpeed = -2*(2*Math.PI);
			dTheta = 2*Math.PI;
			dThetaChg = 4/(Math.PI*dSpeed);
			dX = centerX-(Math.cos(dTheta)*dSpeed)-50;
			dY = centerY-(Math.sin(dTheta)*dSpeed)-150;
		}
	void move()
	{
			// circular path "orbiting" center
			dX = dX+(Math.cos(dTheta)*dSpeed);
			dY = dY+(Math.sin(dTheta)*dSpeed);
			dTheta += dThetaChg;  //  circle tangent to center
			if ( screenX<dX || screenY<dY || dY<0 || dX<0 ) {
				setParticle();
			}
	}
	void show()
	{
		image(img, (float)dX, (float)dY);
	}
	void hide()
	{
		image(imgBlack, (float)dX, (float)dY);
	}
}

class Oddball7Particle extends OddballParticle//uses inheritance
{
//	double dSpeed, dX, dY, dTheta, dThetaChg;
	PImage img, maskImg, imgBlack;
	int colorR, colorG, colorB;
		void setParticle()
		{
			// circular path "orbiting" center
			// 1st set random radius (limited by window size 500 x 500), where radius = dSpeed * dSpeed
			// set dTheta to anything, say (1,0), since it's changed by adding dThetaChg each move() to circle around
			// then make sure dThetaChg to set to 1 / dSpeed for circular path
			// finally set object dSpeed away from center, offsetting dX and dY by +(0.5+dSpeed) and -(dSpeed*dSpeed)
			dTheta = 0;	// same as  dTheta = 2*Math.PI;
			dSpeed = Math.random()*10+5;
			dThetaChg = 1/dSpeed;
			dX = centerX-(Math.cos(dTheta)*dSpeed)+(0.5*dSpeed);
			dY = centerY-(Math.sin(dTheta)*dSpeed)-(dSpeed*dSpeed);
//			println( "dSpeed = " + dSpeed + ", dTheta = " + dTheta + ", dThetaChg = " + dThetaChg + ", dX = " + dX + ", dXChg = " + (Math.cos(dTheta)*dSpeed) + ", dY = " + dY + ", dYChg = " + (Math.sin(dTheta)*dSpeed) );

			// set random color of object
			colorR = (int)(Math.random()*256);
			colorG = (int)(Math.random()*256);
			colorB = (int)(Math.random()*256);
//			println("colorR = " + colorR + ", colorG = " + colorG + ", colorB = " + colorB);
		}

	void move()
	{
			// circular path "orbiting" center
			dX = dX+(Math.cos(dTheta)*dSpeed);
			dY = dY+(Math.sin(dTheta)*dSpeed);
			dTheta += dThetaChg;  //  circle tangent to center
			if ( screenX<dX || screenY<dY || dY<0 || dX<0 ) {
				setParticle();
			}
	}

	void show()
	{
		fill(colorR, colorG, colorB);
//		ellipse((float)dX, (float)dY, 30, 30);
		ellipse((float)dX, (float)dY, 50, 50);

/*
		// draw rings to check orbit of object
		stroke(153);
		noFill();
		ellipse((float)centerX, (float)centerY, 100, 100);
		ellipse((float)centerX, (float)centerY, 200, 200);
		ellipse((float)centerX, (float)centerY, 300, 300);
		ellipse((float)centerX, (float)centerY, 400, 400);
		ellipse((float)centerX, (float)centerY, 500, 500);
		stroke(0);
*/
 	}
	void hide()
	{
		fill(0);
//		ellipse((float)dX, (float)dY, 31, 31);
		ellipse((float)dX, (float)dY, 51, 51);
	}
}


class JumboParticle extends NormalParticle//uses inheritance
{
	//your code here
	
	void show()
	{
		fill(255,0,0);  //  red
		ellipse((float)dX, (float)dY, 55, 55);
	}
	void hide()
	{
		fill(0);	
		ellipse((float)dX, (float)dY, 56, 56);
	}
}
