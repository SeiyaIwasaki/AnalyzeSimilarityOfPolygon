/*****************************************************
    similarityOfPolygon
    
    2015 Seiya Iwasaki
*****************************************************/

import java.awt.Point;

class similarityAnalysis{
    
	public Circle getSmallestEnclosingCircle(Point[] vertex){
		float[][] vertexProbability = new float[vertex.length][2];
		Point[] randomPoint = new Point[3];

		Circle seCircle;
		int vCount = 0;
		initProbability(vertexProbability);
		while(true){
			setRandomPoints(vertexProbability, vertex, randomPoint);
			seCircle = getSeCircle(randomPoint);
			
			for(int i = 0; i < vertex.length; i++){
				if(seCircle.contains(vertex[i])){
					vCount++;
				}
			}
			println(vCount);

			if(vCount == vertex.length){
				break;
			}else{
				vCount = 0;
			}

		}

		return seCircle;
	}

	private void initProbability(float[][] vp){
		int size = vp.length;
		for(int i = 0; i < size; i++){
			vp[i][0] = 100 / size * i;
			vp[i][1] = 100 / size * (i + 1);
		}
		vp[vp.length - 1][1] = 100;
	}

	private int getRangePosition(float[][] vp, float val){
		for(int i = 0; i < vp.length; i++){
			if(vp[i][0] <= val && val < vp[i][1]){
				return i;
			}
		}
		return -1;
	}

	private void setRandomPoints(float[][] vp, Point[] vertex, Point[] rp){
		int count = 0;
		int[] rpIndex = new int[rp.length];
		boolean retry = false;

		while(count < rp.length){
			rpIndex[count] = getRangePosition(vp, random(0, 100));
			for(int i = 0; i < count; i++){
				if(rpIndex[count] == rpIndex[i]) retry = true;
			}
			if(retry) retry = false;
			else count++;
		}

		for(int i = 0; i < rp.length; i++){
			rp[i] = vertex[rpIndex[i]];
		}
	}

	private Circle getSeCircle(Point[] rp){
		int x1 = rp[0].x, x2 = rp[1].x, x3 = rp[2].x;
		int y1 = rp[0].y, y2 = rp[1].y, y3 = rp[2].y;
		Circle circle;
		ArrayList<Circle> circleList = new ArrayList<Circle>();

		// Circle 1
		circle = new Circle((x1 + x2) / 2, (y1 + y2) / 2, ceil(dist(x1, y1, x2, y2)));
		if(circle.contains(x3, y3)) circleList.add(circle);

		// Circle 2
		circle = new Circle((x1 + x3) / 2, (y1 + y3) / 2, ceil(dist(x1, y1, x3, y3)));
		if(circle.contains(x2, y2)) circleList.add(circle);

		// Circle 3
		circle = new Circle((x2 + x3) / 2, (y2 + y3) / 2, ceil(dist(x2, y2, x3, y3)));
		if(circle.contains(x1, y1)) circleList.add(circle);

		if(circleList.size() > 0){
			int min = circleList.get(0).getWidth();
			for(int i = 1; i < circleList.size(); i++){
				if(min > circleList.get(i).getWidth()) min = circleList.get(i).getWidth();
			}
			for(Circle c : circleList){
				if(c.getWidth() == min) return c;
			}
		}

		// Circle 4
		int p = ((y1 - y3) * (y1 * y1 - y2 * y2 + x1 * x1 - x2 * x2)
		          - (y1 - y2) * (y1 * y1 - y3 * y3 + x1 * x1 - x3 * x3))
		          / (2 * (y1 - y3) * (x1 - x2) - 2 * (y1 - y2) * (x1 - x3));

		int q = ((x1 - x3) * (x1 * x1 - x2 * x2 + y1 * y1 - y2 * y2) 
			      - (x1 - x2) * (x1 * x1 - x3 * x3 + y1 * y1 - y3 * y3))
			      / (2 * (x1 - x3) * (y1 - y2) - 2 * (x1 - x2) * (y1 - y3));

		circle = new Circle(p, q, ceil(dist(p, q, x1, y1) * 2));
		return circle;
	}

}
