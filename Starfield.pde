//your code here
Partical[] starBits;
void setup()
{
	//your code here
	background(0)
	size(500,500)
}
void draw()
{
	//your code here
	starBits= new NormalParticle[50];
	for(int i=10; )
}
class NormalParticle
{
	//your code here
	double dSpeed, dX, dY, dTheta 
		NormalParticle(int x=0, int y=0 )
		{
			myX=x;
			myY=y;
			doublespeed= Math.random()*10
			doubleTheta= Math.PI*2*Math.random();
		}
		void move()
		{
			myX=x+(int)(Math,random()*11)-5;
			myY=y+(int)(Math,random()*11)-5;
		}
		void show()
		{
			//Remember that there should be a hide function
			ellipse(myX, myY, width, height);
		}
		
	}
interface Particle
{
	//your code here
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

