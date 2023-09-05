Extension { #name : #TypNode }

{ #category : #'*Typer-GToolkit' }
TypNode >> typGtAsElementIn: aMondrian [
	^ self
		typGtDecorate: (BrButton new
				aptitude: BrGlamorousButtonWithLabelAptitude;
				label: self asString;
				yourself)
		in: aMondrian
]

{ #category : #'*Typer-GToolkit' }
TypNode >> typGtBackground: aNumber [
	^ (self typGtColor alpha: aNumber) asBlBackground
]

{ #category : #'*Typer-GToolkit' }
TypNode >> typGtBorder: aNumber [
	^ BlBorder builder
		paint: (self typGtColor alpha: aNumber);
		width: 1;
		build
]

{ #category : #'*Typer-GToolkit' }
TypNode >> typGtColor [
	^ BrGlamorousColors hoveredButtonTextColor
]

{ #category : #'*Typer-GToolkit' }
TypNode >> typGtDecorate: anElement in: aMondrian [
	anElement userData at: #typGtNode put: self.
	^ anElement
		when: BlMouseOverEvent
			do: [ | edges nodes |
				edges := self edges.
				nodes := edges flatCollect: #nodes.
				(aMondrian topStep root graph nodeChildren
					groupedBy: [ :e | nodes includes: (e userData at: #typGtNode) ])
					keysAndValuesDo: [ :b :e | b ifTrue: [ e do: #typGtOnMouseOver ] ifFalse: [ e do: #typGtOnMouseOut ] ].
				(aMondrian topStep root graph edgeChildren
					groupedBy: [ :e | edges includes: (e userData at: #typGtEdge) ])
					keysAndValuesDo: [ :b :e | b ifTrue: [ e do: #typGtOnMouseOver ] ifFalse: [ e do: #typGtOnMouseOut ] ] ];
		when: BlMouseOutEvent
			do: [ | edges nodes |
				edges := self edges.
				nodes := edges flatCollect: #nodes.
				aMondrian topStep root graph nodeChildren do: #typGtOnReset.
				aMondrian topStep root graph edgeChildren do: #typGtOnReset ];
		when: BlClickEvent do: [ anElement phlow spawnObject: self ];
		yourself
]

{ #category : #'*Typer-GToolkit' }
TypNode >> typGtGraphFor: aView [

	<gtView>
	^ aView typGtMondrian
		  title: 'Graph';
		  priority: 10;
		  painting: [ :m | self typGtGraphPaintOn: m ]
]

{ #category : #'*Typer-GToolkit' }
TypNode >> typGtGraphPaintOn: aMondrian [
	| nodes edges connections |
	nodes := nodes := self neighbors , {self}.
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
						border: (BlBorder paint: BrGlamorousColors defaultHeaderTextColor width: 3) ].
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
