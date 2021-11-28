Class {
	#name : #TypGtMondrianNodeBuilder,
	#superclass : #GtMondrianNodeBuilder,
	#category : 'Typer-GToolkit-Typer-GToolkit'
}

{ #category : #accessing }
TypGtMondrianNodeBuilder >> with: aCollection [

	| elements |
	elements := aCollection
		            reject: [ :e | mondrian includesNode: e ]
		            thenCollect: [ :e | 
		            mondrian nodeAt: e put: (self nodeElementFor: e) ].
	self topStep addChildren: elements asOrderedCollection.
	createdElements addAll: elements.
	^ elements
]
