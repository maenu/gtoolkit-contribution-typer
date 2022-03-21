Extension { #name : #TypInfTightenEdge }

{ #category : #'*Typer-GToolkit' }
TypInfTightenEdge >> typGtAsElementIn: aMondrian [

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
TypInfTightenEdge >> typGtColor [

	^ Color orange alpha: 0.5
]

{ #category : #'*Typer-GToolkit' }
TypInfTightenEdge >> typGtTypeFor: aView [

	<gtView>
	^ aView explicit
		  title: 'Type';
		  priority: 10;
		  stencil: [ GtInspectorTool forObject: type ]
]
