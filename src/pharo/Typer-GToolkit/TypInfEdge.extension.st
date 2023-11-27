Extension { #name : #TypInfEdge }

{ #category : #'*Typer-GToolkit' }
TypInfEdge >> typGtAsElementIn: aMondrian [
	| label element |
	label := BrLabel new
			constraintsDo: [ :c | 
				c frame horizontal alignCenter.
				c frame vertical alignCenter ];
			aptitude: BrGlamorousLabelAptitude;
			when: BlClickEvent
				do: [ :e | 
					e consumed: true.
					label phlow spawnObject: self ];
			text: ((key displayStringLimitedTo: 16) asRopedText
					glamorousCodeFont;
					fontSize: 5;
					yourself);
			visibility: BlVisibility hidden;
			yourself.
	element := BlParabollaArcElement new.
	element userData at: #typGtEdge put: self.
	^ element
		layout: BlFrameLayout new;
		zIndex: -1;
		clipChildren: false;
		border: (self typGtBorder: 0.7);
		toHead: (BlArrowheadTriangle new
				scale: 2;
				background: (self typGtBackground: 0.7);
				yourself);
		addChild: label as: #label;
		preventMeAndChildrenMouseEvents;
		yourself
]

{ #category : #'*Typer-GToolkit' }
TypInfEdge >> typGtAsElementIn: aMondrian with: aCollection [
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
TypInfEdge >> typGtBackground: aNumber [
	^ (self typGtColor alpha: aNumber) asBlBackground
]

{ #category : #'*Typer-GToolkit' }
TypInfEdge >> typGtBorder: aNumber [
	^ BlBorder builder
		paint: (self typGtColor alpha: aNumber);
		width: 1;
		build
]

{ #category : #'*Typer-GToolkit' }
TypInfEdge >> typGtColor [
	^ BrGlamorousColors lightBorderColor
]

{ #category : #'*Typer-GToolkit' }
TypInfEdge >> typGtGraphFor: aView [
	<gtView>
	^ aView typGtMondrian
		title: 'Graph';
		priority: 10;
		painting: [ :m | 
			m nodes
				stencil: [ :e | e typGtAsElementIn: m ];
				with: {origin.
						target}.
			m edges
				stencil: [ :e | e typGtAsElementIn: m ];
				connect: {self}
					from: #origin
					to: #target.
			m layout force ]
]

{ #category : #'*Typer-GToolkit' }
TypInfEdge >> typGtGraphPaintOn: aMondrian [
	aMondrian nodes
		stencil: [ :e | e typGtAsElementIn: aMondrian ];
		with: {origin.
				target}.
	aMondrian edges
		stencil: [ :e | e typGtAsElementIn: aMondrian ];
		connectFrom: origin to: target
]

{ #category : #'*Typer-GToolkit' }
TypInfEdge >> typGtKeyFor: aView [
	<gtView>
	^ aView explicit
		title: 'Key';
		priority: 10;
		stencil: [ GtInspectorTool forObject: key ]
]
