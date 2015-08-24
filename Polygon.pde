/*****************************************************
    similarityOfPolygon
    
    2015 Seiya Iwasaki
*****************************************************/
import java.awt.Point;

class Polygon{
    /** field **/
    private    int        vertexSize_;
    private    color      color_;
    private    int        weight_;
    private    boolean    fillF_;
    private    Point      offset_;
    private    Point[]    vertex_;
    
    /** constructor **/
    Polygon(int vertexSize){
        vertexSize_ = vertexSize;
        color_ = #000000;
        weight_ = 2;
        fillF_ = false;
        offset_ = new Point(0, 0);
        vertex_ = new Point[vertexSize];
        initVertex();
    }

    /** initialize **/
    private void initVertex(){
        int R = 100;
        for(int i = 0; i < vertexSize_; i++){
            vertex_[i] = new Point();
            vertex_[i].setLocation(R * cos(radians(360 * i / vertexSize_)),
                                   R * sin(radians(360 * i / vertexSize_)));
        }
    }
    
    /** draw **/
    public void draw(){
        inputParam();

        // draw polygon
        pushMatrix();
        translate(offset_.x, offset_.y);

        beginShape();
        for(int i = 0; i < vertexSize_; i++){
            vertex(vertex_[i].x, vertex_[i].y);
        }
        endShape(CLOSE);

        popMatrix();

    }

    private void inputParam(){
        smooth();
        stroke(color_);
        strokeWeight(weight_);
        if(fillF_) {
            noStroke();
            fill(color_);
        }else{
            noFill();
        }
    }
    
    /** method **/
    public int getVertexSize(){
        return vertexSize_;
    }


    public Point[] getVertex(){
        return vertex_;
    }
    public Point getVertex(int index){
        return vertex_[index];
    }


    public void setColor(color c){
        color_ = c;
    }
    public color getColor(){
        return color_;
    }


    public void setWeight(int w){
        weight_ = w;
    }
    public int getWeight(){
        return weight_;
    }


    public void fillF(){
        fillF_ = true;
    }
    public void noFillF(){
        fillF_ = false;
    }


    public void setOffset(int x, int y){
        offset_.setLocation(x, y);
    }
    public void setOffset(Point p){
        offset_.setLocation(p);
    }
    public Point getOffset(){
        return offset_;
    }
}
