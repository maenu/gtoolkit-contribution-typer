Class {
	#name : 'TypGtMondrianEdgeBuilder',
	#superclass : 'GtMondrianEdgeBuilder',
	#category : 'Typer-GToolkit'
}

{ #category : 'accessing' }
TypGtMondrianEdgeBuilder >> edgeElementFor: anObject from: fromElement to: toElement [

	| element |
	element := super
		           edgeElementFor: anObject
		           from: fromElement
		           to: toElement.
	element userData at: #typGtEdge put: anObject.
	^ element
]

{ #category : 'accessing' }
TypGtMondrianEdgeBuilder >> privateConnect: aCollection from: aFromBlock to: aToBlock [

	| existing remains |
	existing := self topStep root graph edgeChildren.
	remains := OrderedCollection new.
	aCollection do: [ :e | 
		existing
			detect: [ :f | (f userData at: #typGtEdge) == e ]
			ifFound: [ Halt now ]
			ifNone: [ remains add: e ] ].
	^ super privateConnect: remains from: aFromBlock to: aToBlock
]
