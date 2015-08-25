/*****************************************************
    similarityOfPolygon
    
    2015 Seiya Iwasaki
*****************************************************/

class designInfo{
	/** field **/
    private    color      color_;
    private    int        weight_;
    private    boolean    fillF_;

    /** constructor **/
    designInfo(){
    	// default settings
    	color_ = #000000;
    	weight_ = 2;
    	fillF_ = false;
    }

    /** method **/
    public void inputDesignInfo(){
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
}