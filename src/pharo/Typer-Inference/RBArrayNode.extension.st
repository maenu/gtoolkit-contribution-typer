Extension { #name : #RBArrayNode }

{ #category : #'*Typer-Inference' }
RBArrayNode >> typInfSignalsAlways [
	^ self statements anySatisfy: [ :e | e typInfSignalsAlways = true ]
]

{ #category : #'*Typer-Inference' }
RBArrayNode >> typInfTypeRecursive [
	| type |
	type := Array typAsType.
	type
		at: type parameters keys first
		put: (self statements collect: #typInfType) typAsType.
	^ type
]
