Extension { #name : #RBArrayNode }

{ #category : #'*Typer-Inference' }
RBArrayNode >> typSignalsAlways [
	^ self statements anySatisfy: [ :e | e typSignalsAlways = true ]
]

{ #category : #'*Typer-Inference' }
RBArrayNode >> typTypeRecursive [
	| type |
	type := Array typAsType.
	type
		at: type parameters keys first
		put: (self statements collect: #typType) typAsType.
	^ type
]
