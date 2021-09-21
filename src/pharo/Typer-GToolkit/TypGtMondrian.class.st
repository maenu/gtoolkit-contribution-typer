Class {
	#name : 'TypGtMondrian',
	#superclass : 'GtMondrian',
	#category : 'Typer-GToolkit'
}

{ #category : 'accessing' }
TypGtMondrian >> edges [

	^ TypGtMondrianEdgeBuilder new mondrian: self
]

{ #category : 'accessing' }
TypGtMondrian >> includesNode: anObject [

	^ self topStep includesNode: anObject
]

{ #category : 'accessing' }
TypGtMondrian >> initialize [

	| root |
	super initialize.
	root := stack pop root.
	root clipChildren: false.
	root constraints graph typGtBeIdentityNodes.
	stack push: (TypGtMondrianStep new
			 root: root;
			 yourself)
]

{ #category : 'accessing' }
TypGtMondrian >> nodes [

	^ TypGtMondrianNodeBuilder new mondrian: self
]
