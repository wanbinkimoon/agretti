
Branch branch;

// ================================================================

void fractalSetup(){
	branch = new Branch();
}

// ================================================================

void fractalRender(){
	branch.show();
}

// ================================================================

class Branch {
	float begin;
	float end;

	void show(){
		stroke(#60A261);
		line(width / 2, height, width / 2, height - 20);
	}
}