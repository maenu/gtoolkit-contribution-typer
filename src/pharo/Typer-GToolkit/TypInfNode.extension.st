Extension { #name : #TypInfNode }

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtAsElementIn: aMondrian [
	"	^ BrEditor new
		  aptitude: BrGlamorousCodeEditorAptitude new;
		  background: BlBackground transparent;
		  text: node formattedCode;
		  beReadOnlyWithoutSelection;
		  hFitContent;
		  vFitContent;
		  yourself"

	| label |
	label := BrLabel new
			constraintsDo: [ :c | 
				c frame horizontal alignCenter.
				c frame vertical alignCenter ];
			aptitude: BrGlamorousLabelAptitude;
			text: (self typGtAsShortString asRopedText
					glamorousCodeFont;
					fontSize: 4;
					foreground: Color white;
					yourself);
			yourself.
	^ self
		typGtDecorate: (BlElement new
				layout: BlFrameLayout new;
				size: 10 @ 10;
				geometry: BlCircleGeometry new;
				background: (self typGtBackground: 0.7);
				addChild: label as: #label;
				yourself)
		in: aMondrian
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtAsShortString [
	self subclassResponsibility
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtCoderFor: aView [
	<gtView>
	^ aView forward
		title: 'Method';
		priority: 1;
		object: [ context typGtAsCoderViewModel
				highlighter: (TypGtRbHighlighter new
						node: node;
						yourself);
				yourself ];
		view: #gtLiveFor:
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtDecorate: anElement in: aMondrian [
	| badge |
	badge := BrBadge new
			label: iterations size;
			exact: 8 @ 8;
			aptitude: BrGlamorousBadgeWithLabelAptitude + BrGlamorousBadgeCircularAptitude;
			constraintsDo: [ :c | c ignoreByLayout ];
			relocate: 6 @ -4;
			visibility: BlVisibility hidden;
			yourself.
	anElement
		when: BlMouseOverEvent
			do: [ badge visibility: BlVisibility visible.
				anElement fireEvent: (TypGtExpandContextRequest context: context) ];
		when: BlMouseOutEvent do: [ badge visibility: BlVisibility hidden ].
	super typGtDecorate: anElement in: aMondrian.
	anElement userData
		at: #explainer
		put: ((TypGtExplainerElementContext on: anElement)
				isTarget: true;
				model: self;
				yourself).
	^ anElement
		clipChildren: false;
		addChild: badge;
		addAptitude: (BrGlamorousWithTooltipAptitude
				content: [ BrEditor new
						aptitude: BrGlamorousCodeEditorAptitude new;
						background: BlBackground transparent;
						text: self class name , String lf , self type asString , String lf
								, node formattedCode;
						beReadOnlyWithoutSelection;
						hFitContent;
						vFitContent;
						yourself ]) + GtExplainerLinesAptitude new beForTarget;
		yourself
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtFlowFor: aView [
	<gtView>
	^ aView typGtMondrian
		title: 'Control Flow';
		priority: 2;
		painting: [ :m | self typGtFlowPaintOn: m ]
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtFlowPaintOn: aMondrian [
	| nodes edges connections |
	nodes := context allNodes.
	edges := (((nodes flatCollect: #inEdges)
			select: [ :e | nodes includes: e origin ])
			, ((nodes flatCollect: #outEdges) select: [ :e | nodes includes: e target ]))
			asIdentitySet.
	connections := (edges groupedBy: [ :e | e origin -> e target ]) associations
			collect: [ :a | a key -> (a value sorted: [ :e :f | e key = #next ]) ]
			as: Dictionary.
	aMondrian nodes
		stencil: [ :e | 
			| element |
			element := e typGtAsElementIn: aMondrian.
			e == self
				ifTrue: [ element
						outskirts: BlOutskirts outside;
						border: (BlBorder paint: (BrGlamorousColors textHighlightColor alpha: 0.5) width: 3) ].
			element ];
		with: nodes.
	aMondrian edges
		passive;
		fromNearestTightCircle;
		toNearestTightCircle;
		stencil: [ :e | 
			| localEdges |
			localEdges := connections at: e origin -> e target.
			(e typGtAsElementIn: aMondrian)
				curvatureFraction: (localEdges indexOf: e ifAbsent: 0) / (localEdges size * 2 + 1);
				yourself ];
		connect: (edges reject: [ :e | e key = #next ] thenCollect: #value)
			from: #origin
			to: #target.
	aMondrian edges
		fromNearestTightCircle;
		toNearestTightCircle;
		stencil: [ :e | 
			| localEdges |
			localEdges := connections at: e origin -> e target.
			(e typGtAsElementIn: aMondrian)
				curvatureFraction: ((localEdges indexOf: e ifAbsent: 1) - 1) / (localEdges size * 2 + 1);
				yourself ];
		connect: (edges select: [ :e | e key = #next ] thenCollect: #value)
			from: #origin
			to: #target.
	aMondrian layout force fix: self at: 0 @ 0
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtIterationsFor: aView [
	<gtView>
	^ aView forward
		title: 'Iterations';
		priority: 2;
		object: [ iterations ];
		view: #gtLiveFor:
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtMinimalFlowFor: aView [
	<gtView>
	^ aView typGtMondrian
		title: 'Minimal Flow';
		priority: 3;
		painting: [ :m | self typGtMinimalFlowPaintOn: m ]
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtMinimalFlowPaintOn: aMondrian [
	| nodes edges changed connections |
	nodes := context root allNextNodes.
	edges := nodes
			flatCollect: [ :n | 
				(n in at: #next ifAbsent: IdentitySet new)
					, (n out at: #next ifAbsent: IdentitySet new) ]
			as: IdentitySet.
	changed := true.
	[ changed ]
		whileTrue: [ | queue |
			changed := false.
			queue := edges asOrderedCollection.
			[ queue isEmpty ]
				whileFalse: [ | a |
					a := queue removeFirst.
					edges
						detect: [ :b | 
							b origin == a target
								and: [ (edges select: [ :c | c origin == a target ]) size = 1
										and: [ (edges select: [ :c | c target == a target ]) size = 1 ] ] ]
						ifFound: [ :b | 
							| next |
							changed := true.
							next := TypInfNextEdge origin: a origin target: b target.
							queue
								remove: a ifAbsent: [  "noop" ];
								remove: b ifAbsent: [  "noop" ];
								add: next.
							edges
								remove: a ifAbsent: [  "noop" ];
								remove: b ifAbsent: [  "noop" ];
								add: next ]
						ifNone: [  "noop" ] ] ].
	nodes := edges flatCollect: #nodes.
	connections := (edges groupedBy: [ :e | e origin -> e target ]) associations
			collect: [ :a | a key -> a value asOrderedCollection ]
			as: Dictionary.
	aMondrian nodes
		stencil: [ :e | e typGtAsElementIn: aMondrian ];
		with: nodes.
	aMondrian edges
		passive;
		fromNearestTightCircle;
		toNearestTightCircle;
		stencil: [ :e | e typGtAsElementIn: aMondrian ];
		connect: (edges reject: [ :e | e key = #next ] thenCollect: #value)
			from: #origin
			to: #target.
	aMondrian edges
		fromNearestTightCircle;
		toNearestTightCircle;
		stencil: [ :e | 
			| localEdges |
			localEdges := connections at: e origin -> e target.
			(e typGtAsElementIn: aMondrian)
				curvatureFraction: 1 - ((localEdges indexOf: e) / localEdges size);
				yourself ];
		connect: (edges select: [ :e | e key = #next ] thenCollect: #value)
			from: #origin
			to: #target.
	aMondrian layout force fix: self at: 0 @ 0
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtShaCanType [
	^ false
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtStateFor: aView [
	<gtView>
	^ aView forward
		title: 'State';
		priority: 11;
		object: [ state ];
		view: #typGtItemsFor:
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtTypeFor: aView [
	<gtView>
	state ifNil: [ ^ aView empty ].
	^ aView explicit
		title: 'Type';
		priority: 10;
		stencil: [ GtInspectorTool forObject: self type ]
]
