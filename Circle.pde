/*****************************************************
    similarityOfPolygon
    
    2015 Seiya Iwasaki
*****************************************************/

import java.awt.Point;

class Circle extends designInfo{
    	/** field **/
    	private		int		centerX_, centerY_;
    	private		int 	width_, height_;

    	/** constructor **/
    	Circle(){
    		centerX_ = 0;
    		centerY_ = 0;
    		width_ = height_ = 50;
    	}
    	Circle(Point p, int d){
    		centerX_ = p.x;
    		centerY_ = p.y;
    		width_ = height_ = d;
    	}
    	Circle(int x, int y, int d){
    		centerX_ = x;
    		centerY_ = y;
    		width_ = height_ = d;
    	}
    	Circle(int x, int y, int w, int h){
    		centerX_ = x;
    		centerY_ = y;
    		width_ = w;
    		height_ = h;

    	}

    	/** draw **/
    	public void draw(){
    		inputDesignInfo();
    		ellipseMode(CENTER);
    		ellipse(centerX_, centerY_, width_, height_);
    	}

    	/** method **/
    	public boolean contains(Point p){
    		int afterX = p.x - centerX_;
    		int afterY = (width_ / height_) * (p.y - centerY_);

    		if(afterX * afterX + afterY * afterY <= ceil((width_ * width_) / 4.0)){
    			return true;
    		}else{
    			return false;
    		}
    	}
    	public boolean contains(int x, int y){
    		int afterX = x - centerX_;
    		int afterY = (width_ / height_) * (y - centerY_);

    		if(afterX * afterX + afterY * afterY <= ceil((width_ * width_) / 4.0)){
    			return true;
    		}else{
    			return false;
    		}
    	}

    	public void setCenter(Point p){
    		centerX_ = p.x;
    		centerY_ = p.y;
    	}
    	public void setCenter(int x, int y){
    		centerX_ = x;
    		centerY_ = y;
    	}
    	public Point getCenter(){
    		return new Point(centerX_, centerY_);
    	}


    	public void setWidth(int w){
    		width_ = w;
    	}
    	public int getWidth(){
    		return width_;
    	}


    	public void setHeight(int h){
    		height_ = h;
    	}
    	public int getHeight(){
    		return height_;
    	}
    }