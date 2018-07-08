int stageW      = 800;
int stageH      = 400;
color bgC       = #357A5B;
String dataPATH = "../../data";

// Green Palette
// #357A5B #60A261 #98C74E #CCF62C

// ================================================================

boolean DEBUG = true;
boolean MIDI = false;

boolean showHint = false;
// ================================================================

void settings(){ 
	// fullScreen(P3D, 2);
	// fullScreen(P3D, SPAN);
	size(stageW, stageH);
	pixelDensity(displayDensity());	
}

// ================================================================

void setup() {
	background(bgC);
	midiSetup();
	fractalSetup();
}

// ================================================================
void draw() {
	background(bgC);
	midiMapper();
	fractalRender();


	if(showHint){
		fill(75, 200); noStroke();
  	rect(0, 0, width, 48);

  	fill(#00AEFF);
  	textAlign(LEFT);
  	textSize(16);
  	String helpString = "Q: Quit    P: Save screenshot in ./render folder ";
  	text(helpString, 12, 28);
	}
}

// ================================================================

void keyPressed(){	
	switch (key) {
		case 'q':
			exit();
			break;
		case 'p':
			screenShot();
			break;
		case 'h':
			showHelp();
			break;
	}
}

// ================================================================

boolean letsRender = false;
int     renderNum  = 0;
String  renderPATH = "../render/";

// ================================================================

void screenShot(){
	letsRender = true;
	if (letsRender) {
		letsRender = false;
		save(renderPATH + renderNum + ".png");
		renderNum++;
	}
}

void showHelp(){
	showHint = !showHint;
}