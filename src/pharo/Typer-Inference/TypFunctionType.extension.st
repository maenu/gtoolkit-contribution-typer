Extension { #name : #TypFunctionType }

{ #category : #'*Typer-Inference' }
TypFunctionType >> typInfContexts [
	^ out
		at: #typInfContext
		ifPresent: [ :s | s collect: #target ]
		ifAbsent: [ #() ]
]

{ #category : #'*Typer-Inference' }
TypFunctionType >> typInfHasContexts [
	^ out includesKey: #typInfContexts
]

{ #category : #'*Typer-Inference' }
TypFunctionType >> typInfHasNode [
	^ out includesKey: #typInfNode
]

{ #category : #'*Typer-Inference' }
TypFunctionType >> typInfNode [
	^ self outAt: #typInfNode
]

{ #category : #'*Typer-Inference' }
TypFunctionType >> typInfWithContexts: aCollection [
	| copy |
	self typInfContexts asIdentitySet = aCollection asIdentitySet
		ifTrue: [ ^ self ].
	copy := self copy.
	aCollection asIdentitySet
		do: [ :c | 
			copy
				outAdd: (TypInfEdge
						origin: copy
						target: c
						key: #typInfContext) ].
	^ copy
]

{ #category : #'*Typer-Inference' }
TypFunctionType >> typInfWithNode: aNode [
	self outAt: #typInfNode ifPresent: [ :n | n == aNode ifTrue: [ ^ self ] ].
	^ self copy
		outAt: #typInfNode put: aNode;
		yourself
]
