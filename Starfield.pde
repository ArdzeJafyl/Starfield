
//TO DO//
//Oddball
//Jumbo
//Design






int starNum = 1000;
Particle [] stars;
//float out = 0.5;

void setup()
{
	size(800,800);
	stars = new Particle[starNum];
	for (int i = 0; i <= 100; i++){
		stars[i] = new OddballParticle();
	}
	for (int i = 101; i <= 200; i++){
		stars[i] = new JumboParticle();
	}
	for(int i = 201; i < stars.length; i++){
		stars[i] = new NormalParticle();
	}
}

void draw()
{
	noStroke();
	fill(0,0,0,10);
	rect(0,0,800,800);
	//frameRate(1);
	for(int i = 0; i  < stars.length; i++){
		stars[i].lookOut();
		stars[i].move();
		stars[i].show();
	}
}
class NormalParticle implements Particle
{
	double x,y,spd,tha,d; //X and Y position, Speed, Angle
	int rot;
	color eys; //color

	NormalParticle(){ //Constucter For Normal
		d = Math.random()*400;
		spd = .1;//(Math.random()*6)+1;
		tha = (Math.random()*4*(Math.PI)-(2*(Math.PI))); //Use radians, 30 degrees
		eys = color(255);
		x = (Math.sin(tha)*d)+400;
		y = (Math.cos(tha)*d)+400;
		rot = (int)(Math.random()*2)-1;

	}
	public void move(){ //move function in Particle interface, Use Cosine(tha)*spd for X and Sine(tha)*spd for Y
		x = (Math.sin(tha)*spd)+x;
		y = (Math.cos(tha)*spd)+y;
		spd = spd + 0.5;
		// out = out-0.0008;
		if (rot > 0){
			tha = (tha + 0.05);//out;
		}else if (rot < 0 ){
			tha = (tha - 0.05);
		}else{
			tha = tha + 0;
		}
	}
	public void lookOut(){
		if (x > 800 || x < 0 || y > 800 || y <0){
			x = 400;
			y = 400;
			spd = 6;
		}
	}
	public void show(){ //show function in Particle Interface, display color and shape
		noStroke();
		fill(eys);
		ellipse( (float)x, (float)y, 2, 2);
	}

}

interface Particle
{
	public void show();
	public void move();
	public void lookOut();
}

class OddballParticle implements Particle//uses an interface
{
	double oX,oY,oSpd,oTha,size,jD;
	color oEys;

	OddballParticle(){//Constructer of Oddball
		oSpd = 6;
		size = 3;
		oTha = (Math.random()*4*(Math.PI)-(2*(Math.PI)));
		oEys = color(50,120,223);//(81,71,47);
		jD = Math.random()*400;
		oX = (Math.sin(oTha)*jD)+400;
		oY = (Math.cos(oTha)*jD)+400;
	}

	public void move(){
		oX = oX+(Math.cos(oTha)*oSpd);
		oY = oY+(Math.sin(oTha)*oSpd);
		size = size + 0.1;
	}

	public void show(){
		noStroke();
		fill(oEys);
		ellipse( (float)oX, (float)oY, (float)size, (float)size);
	}
	public void lookOut(){
		if (oX > 800 || oX < 0 || oY > 800 || oY <0){
			oX = 400;
			oY = 400;
			oTha = (Math.random()*4*(Math.PI)-(2*(Math.PI)));
			size = 3;
		}
	}
}
 
class JumboParticle extends OddballParticle//uses inheritance
{
	JumboParticle(){
		jD = Math.random()*400;
		oX = (Math.sin(oTha)*jD)+400;
		oY = (Math.cos(oTha)*jD)+400;
		oSpd = 6;
		oTha = (Math.random()*4*(Math.PI)-(2*(Math.PI)));
	}
	public void show(){
		noStroke();
		fill(255,0,0);
		ellipse( (float)oX, (float)oY, 3, 3);
	}
}

