Extension { #name : #TypInfReturnEdge }

{ #category : #'*Typer-GToolkit' }
TypInfReturnEdge >> typGtAsElementIn: aMondrian [

	^ BlParabollaArcElement new
		  layout: BlFrameLayout new;
		  zIndex: -1;
		  clipChildren: false;
		  curvatureFraction: 0.1;
		  border: (BlBorder builder
				   paint: self typGtColor;
				   width: 2;
				   build);
		  toHead: (BlArrowheadTriangle new
				   scale: 2;
				   border: (BlBorder builder
						    paint: self typGtColor;
						    width: 2;
						    build);
				   background: self typGtColor;
				   yourself);
		  yourself
]

{ #category : #'*Typer-GToolkit' }
TypInfReturnEdge >> typGtColor [

	^ Color red alpha: 0.3
]
