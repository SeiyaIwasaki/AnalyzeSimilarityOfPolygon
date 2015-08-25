/*****************************************************
    similarityOfPolygon
    
    2015 Seiya Iwasaki
*****************************************************/

/** Objects **/
final int kVertexSize = 5, kEditableScope = 250;
final int kDisplayW = 1000, kDisplayH = 700;

similarityAnalysis similarity;
editablePolygon polygon1, polygon2;
Circle seCircle1, seCircle2;

/** SetUp **/
void setup(){
    // Application Settings
    frameRate(30);
    size(kDisplayW, kDisplayH);
    colorMode(RGB, 256, 256, 256, 256);

    similarity = new similarityAnalysis();   

    polygon1 = new editablePolygon(kVertexSize, kEditableScope);
    polygon1.setOffset(250, 250);
    polygon2 = new editablePolygon(kVertexSize, kEditableScope);
    polygon2.setOffset(750, 250);

	seCircle1 = similarity.getSmallestEnclosingCircle(polygon1.getActVertex());
	seCircle2 = similarity.getSmallestEnclosingCircle(polygon2.getActVertex());
}

/** draw **/
void draw(){
    background(#FFFFFF);
    polygon1.draw();
    polygon2.draw();

   	seCircle1.draw();
   	seCircle2.draw();

    noFill();
    stroke(#626063);
    strokeWeight(5);
    line(width / 2, 0, width / 2, height - 200);
}

/** method **/
void mousePressed(){
	polygon1.mousePressed(mouseX, mouseY);
	polygon2.mousePressed(mouseX, mouseY);
}
void mouseReleased(){
	polygon1.mouseReleased(mouseX, mouseY);
	polygon2.mouseReleased(mouseX, mouseY);
	seCircle1 = similarity.getSmallestEnclosingCircle(polygon1.getActVertex());
	seCircle2 = similarity.getSmallestEnclosingCircle(polygon2.getActVertex());
}
void mouseDragged(){
	polygon1.mouseDragged(mouseX, mouseY);
	polygon2.mouseDragged(mouseX, mouseY);
}
