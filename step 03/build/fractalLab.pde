Branch root;
int len;
PVector begin = new PVector(width / 2, height);
PVector end = new PVector(width / 2, height - len);

// ================================================================

void fractalSetup(){
	len = 10;
	root = new Branch(begin, end);
}

// ================================================================

void fractalRender(){
	root.start = new PVector(width / 2, height);
	root.finish = new PVector(width / 2, height - len);
	root.show();

	if(arrow[1])
		root.grow();
}

// ================================================================

class Branch {
	PVector start;
	PVector finish;

	Branch(PVector begin, PVector end){
		start = begin;
		finish = end;
	}

	void show(){
		stroke(#60A261);
		strokeWeight(4);
		line(start.x, start.y, finish.x, finish.y);
	}
 

	void grow(){
		for (int i = 0; i < 10; ++i) {			
			PVector dir = PVector.sub(finish, start);
			branchGRow(-PI / 6, dir);
			branchGRow(PI / 6, dir);
		}
	}

	void branchGRow(float angle, PVector dir){
		pushMatrix();
			dir.rotate(angle);
			PVector dest = PVector.add(finish, dir);	
			Branch branch = new Branch(finish, dest);
			branch.show();
			fill(#98C74E);
			ellipse(dest.x, dest.y, 8, 8);
			dir.rotate(-angle);
		popMatrix();
	}
}