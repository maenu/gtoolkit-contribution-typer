Class {
	#name : #TypGtMondrian,
	#superclass : #GtMondrian,
	#category : #'Typer-GToolkit-Mondrian'
}

{ #category : #accessing }
TypGtMondrian >> asPannableElement [

	^ super asPannableElement
		  clipChildren: false;
		  yourself
]

{ #category : #accessing }
TypGtMondrian >> edges [

	^ TypGtMondrianEdgeBuilder new mondrian: self
]

{ #category : #accessing }
TypGtMondrian >> existingNodes [

	^ self root graph allNodeChildren
		  collect: [ :e | e graph model ]
		  as: IdentitySet
]

{ #category : #accessing }
TypGtMondrian >> includesNode: anObject [

	^ self topStep includesNode: anObject
]

{ #category : #accessing }
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

{ #category : #accessing }
TypGtMondrian >> layout [

	^ TypGtMondrianLayoutBuilder new mondrian: self
]

{ #category : #accessing }
TypGtMondrian >> nodes [

	^ TypGtMondrianNodeBuilder new mondrian: self
]
