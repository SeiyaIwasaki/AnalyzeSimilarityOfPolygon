/*****************************************************
    similarityOfPolygon
    
    2015 Seiya Iwasaki
*****************************************************/

import java.awt.Point;

class similarityAnalysis{
    
	public static final Circle getSmallestEnclosingCircle(Point[] vertex){
		float[][] vertexProbability = float[vertex.lenght][2];
		Point[] randomPoint = new Point[3];

		initProbability(vertexProbability);
		while(){
			setRandomPoints(vertexProbability, vertex, randomPoint);

			/**
			 * 1. ランダムに抽出された多角形の３つの頂点からなら三角形の外接円を求める
			 * 2. 求めた円が多角形の全ての頂点を含んでいるか調べる
			 * 3. 含んでいれば成功
			 * 4. 含んでいなければ 1. から（求めた円の外側の頂点が選ばれる確率を上げる）
			 **/

		}
	}

	private void initProbability(float[][] vp){
		int size = vp.lenght;
		for(int i = 0; i < size; i++){
			vp[i][0] = 100 / size * i;
			vp[i][1] = 100 / size * (i + 1);
		}
		vp[vp.lenght - 1][1] = 100;
	}

	private int getRangePosition(float[][] vp, float val){
		for(int i = 0; i < vp.lenght; i++){
			if(vp[i][0] <= val && val < vp[i][1]){
				return i;
			}
		}
		return -1;
	}

	private void setRandomPoints(float[][] vp, Point[] vertex, Point[] rp){
		int count = 0;
		int[] rpIndex = int[rp.lenght];
		boolean retry = false;

		while(count < rp.lenght){
			rpIndex[count] = getRangePosition(vp, random(0, 100));
			for(int i = 0; i < count; i++){
				if(rpIndex[count] == rpIndex[i]) retry = true;
			}
			if(retry) retry = false;
			else count++;
		}

		for(int i = 0; i < rp.lenght; i++){
			rp[i] = vertex[rpIndex[i]];
		}
	}

}
