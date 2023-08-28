Extension { #name : #TypFunctionType }

{ #category : #'*Typer-Inference' }
TypFunctionType >> typInfWithNode: aNode [
	^ self
		outAt: #typInfNode
		ifPresent: [ :n | 
			n == aNode
				ifTrue: [ self ]
				ifFalse: [ self copy
						outAt: #typInfNode put: aNode;
						yourself ] ]
		ifAbsent: [ self copy
				outAt: #typInfNode put: aNode;
				yourself ]
]
