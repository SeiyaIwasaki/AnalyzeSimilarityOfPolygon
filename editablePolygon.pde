/*****************************************************
    similarityOfPolygon
    
    2015 Seiya Iwasaki
*****************************************************/

import java.awt.Rectangle;

class editablePolygon extends Polygon{
	/** field **/
	private		int 		activeVertexIndex_;
	private		Rectangle	editableScope_;

	private		final int	scopeOfClick_ = 20;
	private		final color scopeOutlineColor_ = #25b7c0;
	private		final color	scopeColor_ = #00afcc;
	private		final color activeScopeColor_ = #008db7;

	/** constructor **/
	editablePolygon(int vertexSize, int scope){
		super(vertexSize);
		activeVertexIndex_ = -1;
		editableScope_ = new Rectangle(-scope, -scope, scope * 2, scope * 2);
	}

	/** draw **/
	@Override
	public void draw(){
		super.draw();

		// draw scopeOfClick
		Point vertex;
		Point offset = getOffset();
		float distanceVM;
		inputColor();

		for(int i = 0; i < getVertexSize(); i++){
			vertex = getVertex(i);
			distanceVM = dist(vertex.x + offset.x, vertex.y + offset.y, mouseX, mouseY);
			if(distanceVM <= scopeOfClick_ && activeVertexIndex_ == -1){
				fill(scopeColor_);
				ellipse(vertex.x + offset.x, vertex.y + offset.y, scopeOfClick_, scopeOfClick_);
			}
		}

		// draw activeScope
		if(activeVertexIndex_ != -1){
			vertex = getVertex(activeVertexIndex_);
			fill(activeScopeColor_);
			ellipse(vertex.x + offset.x, vertex.y + offset.y, scopeOfClick_, scopeOfClick_);
		}

		// draw editableScope
		noFill();
		rect(editableScope_.x, editableScope_.y, editableScope_.width, editableScope_.height);
	}

	private void inputColor(){
		stroke(scopeOutlineColor_);
	}

	/** Edit Polygon Method **/
	public void mousePressed(int mouseX, int mouseY){
		Point vertex;
		Point offset = getOffset();
		float distanceVM;

		for(int i = 0; i < getVertexSize(); i++){
			vertex = getVertex(i);
			distanceVM = dist(vertex.x + offset.x, vertex.y + offset.y, mouseX, mouseY);
			if(distanceVM <= scopeOfClick_){
				activeVertexIndex_ = i;
			}
		}
	}

	public void mouseReleased(int mouseX, int mouseY){
		if(activeVertexIndex_ != -1){
			activeVertexIndex_ = -1;
		}
	}

	public void mouseDragged(int mouseX, int mouseY){
		Point offset = getOffset();
		if(activeVertexIndex_ != -1){
			Point vertex = getVertex(activeVertexIndex_);
			if(editableScope_.contains(mouseX, mouseY)){
				vertex.x = mouseX - offset.x;
				vertex.y = mouseY - offset.y;
			}
		}
	}

	/** method **/
	@Override
	public void setOffset(int x, int y){
        super.setOffset(x, y);
        editableScope_.translate(x, y);
    }
    @Override
    public void setOffset(Point p){
        super.setOffset(p);
        editableScope_.translate(p.x, p.y);
    }
}