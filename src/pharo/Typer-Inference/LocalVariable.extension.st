Extension { #name : #LocalVariable }

{ #category : #'*Typer-Inference' }
LocalVariable >> typInfNode: aNode context: aContext [

	^ aNode isDefinition
		  ifTrue: [ TypInfLocalDefinition node: aNode context: aContext ]
		  ifFalse: [ TypInfLocal node: aNode context: aContext ]
]
