Extension { #name : #LocalVariable }

{ #category : #'*Typer-Inference' }
LocalVariable >> typInfNode: aNode [

	^ aNode isDefinition
		  ifTrue: [ TypInfLocalDefinition node: aNode ]
		  ifFalse: [ TypInfLocal node: aNode ]
]
