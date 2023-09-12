Class {
	#name : #TypGtGraphForceBasedLayout,
	#superclass : #GtGraphForceBasedLayout,
	#category : #'Typer-GToolkit-Mondrian'
}

{ #category : #accessing }
TypGtGraphForceBasedLayout >> initialize [
	super initialize.
	strength := 1.
	center := 0 @ 0.
	length := 20.
	gravity := 2.5.
	charge := -80.
	friction := 0.95.
	theta := 1.
	alpha := 0.9
]

{ #category : #accessing }
TypGtGraphForceBasedLayout >> isFixed: aNode [
	^ fixedNodes includesKey: aNode children first element graph model
]

{ #category : #accessing }
TypGtGraphForceBasedLayout >> step [
	"run a step of the force layout algorithm"

	| from to fp tp x y len k quad old |
	"If there is no nodes, then there is not much to do"
	nodes ifEmpty: [ ^ self ].
	edges
		do: [ :e | 
			from := e fromNode.
			fp := from position.
			to := e toNode.
			tp := to position.
			x := tp x - fp x.
			y := tp y - fp y.
			len := (x * x + (y * y)) sqrt.
			(len closeTo: 0) not
				ifTrue: [ len := (self strengthOf: e) * (len - (self lengthOf: e)) / len.
					x := x * len.
					y := y * len.
					k := (weights at: from) / ((weights at: from) + (weights at: to)).
					to position: (tp x - (x * k)) @ (tp y - (y * k)).
					k := 1 - k.
					from position: (fp x + (x * k)) @ (fp y + (y * k)) ] ].
	k := alpha * gravity.
	(k closeTo: 0) not
		ifTrue: [ nodes
				do: [ :ea | 
					| pos |
					pos := ea position.
					ea position: (pos x) @ (pos y + k) ] ].
	quad := GtGraphQuadTree withAll: nodes.
	self accumulate: quad.
	nodes
		do: [ :e | 
			(self isFixed: e)
				ifFalse: [ self repulse: e from: quad ]
				ifTrue: [ translator
						translateTopLeftOf: e
						to: (fixedNodes at: e children first element graph model) ] ].
	nodes
		do: [ :e | 
			old := e position.
			e
				position: (old x - (((oldPositions at: e) x - old x) * friction))
						@ (old y - (((oldPositions at: e) y - old y) * friction)).
			oldPositions at: e put: old ]
]
