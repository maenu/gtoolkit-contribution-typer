Class {
	#name : #TypGtMondrianEdgeBuilder,
	#superclass : #GtMondrianEdgeBuilder,
	#category : #'Typer-GToolkit-Mondrian'
}

{ #category : #accessing }
TypGtMondrianEdgeBuilder >> privateConnect: aCollection from: aFromBlock to: aToBlock [
	| existing remains |
	existing := self topStep root graph edgeChildren.
	remains := OrderedCollection new.
	aCollection
		do: [ :e | 
			existing
				detect: [ :f | (f userData at: #typGtEdge) == e ]
				ifNone: [ remains add: e ] ].
	^ super
		privateConnect: remains
		from: aFromBlock
		to: aToBlock
]
