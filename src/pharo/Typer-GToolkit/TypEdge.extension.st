Extension { #name : #TypEdge }

{ #category : #'*Typer-GToolkit' }
TypEdge >> typGtAsElementIn: aMondrian [

	^ BlParabollaArcElement new
		  layout: BlFrameLayout new;
		  zIndex: -1;
		  clipChildren: false;
		  curvatureFraction: 0.33;
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
TypEdge >> typGtAsElementIn: aMondrian with: aCollection [
	| label |
	label := BrLabel new
			constraintsDo: [ :c | 
				c frame horizontal alignCenter.
				c frame vertical alignCenter ];
			aptitude: BrGlamorousLabelAptitude;
			beTinySize;
			yourself.
	aCollection size = 1
		ifTrue: [ label
				when: BlClickEvent
					do: [ :e | 
						e consumed: true.
						label phlow spawnObject: self ];
				text: self asString asRopedText ]
		ifFalse: [ label
				when: BlClickEvent
					do: [ :e | 
						e consumed: true.
						label phlow spawnObject: aCollection ];
				text: ('+{1} {2}'
						format: {aCollection size - 1.
								self asString}) asRopedText ].
	^ (self typGtAsElementIn: aMondrian)
		addChild: label;
		yourself
]

{ #category : #'*Typer-GToolkit' }
TypEdge >> typGtColor [

	^ Color black alpha: 0.2
]

{ #category : #'*Typer-GToolkit' }
TypEdge >> typGtGraphFor: aView [

	<gtView>
	^ aView typGtMondrian
		  title: 'Graph';
		  priority: 10;
		  painting: [ :m | 
			  m nodes
				  stencil: [ :e | e typGtAsElementIn: m ];
				  with: { 
						  origin.
						  target }.
			  m edges
				  stencil: [ :e | e typGtAsElementIn: m ];
				  connect: { self } from: #origin to: #target.
			  m layout force ]
]

{ #category : #'*Typer-GToolkit' }
TypEdge >> typGtKeyFor: aView [

	<gtView>
	^ aView explicit
		  title: 'Key';
		  priority: 10;
		  stencil: [ GtInspectorTool forObject: key ]
]

{ #category : #'*Typer-GToolkit' }
TypEdge >> typGtPaintOn: aMondrian [

	aMondrian nodes
		stencil: [ :e | e typGtAsElementIn: aMondrian ];
		with: { 
				origin.
				target }.
	aMondrian edges
		stencil: [ :e | e typGtAsElementIn: aMondrian ];
		connectFrom: origin to: target
]
