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
    		x = 0;
    		y = 0;
    		width_ = height_ = 50;
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