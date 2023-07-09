Extension { #name : #TypInfReturnEdge }

{ #category : #'*Typer-GToolkit' }
TypInfReturnEdge >> typGtAsElementIn: aMondrian [

	^ BlParabollaArcElement new
		  zIndex: -1;
		  curvatureFraction: 0.1;
		  border: (BlBorder builder
				   paint: self typGtColor;
				   width: 1;
				   build);
		  toHead: (BlArrowheadTriangle new
				   scale: 2;
				   border: (BlBorder builder
						    paint: self typGtColor;
						    width: 1;
						    build);
				   background: self typGtColor;
				   yourself);
		  yourself
]

{ #category : #'*Typer-GToolkit' }
TypInfReturnEdge >> typGtColor [

	^ Color red alpha: 0.5
]
