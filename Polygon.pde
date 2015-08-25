/*****************************************************
    similarityOfPolygon
    
    2015 Seiya Iwasaki
*****************************************************/

class Polygon extends designInfo{
    /** field **/
    private    int        vertexSize_;
    private    Point      offset_;
    private    Point[]    vertex_;
    
    /** constructor **/
    Polygon(int vertexSize){
        vertexSize_ = vertexSize;
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
        inputDesignInfo();

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
    public Point[] getActVertex(){
        Point[] vertex = new Point[vertexSize_];
        for(int i = 0; i < vertexSize_; i++){
            vertex[i] = new Point(vertex_[i].x + offset_.x, vertex_[i].y + offset_.y);
        }
        return vertex;
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
