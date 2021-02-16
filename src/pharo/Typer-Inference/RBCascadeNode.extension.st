Extension { #name : #RBCascadeNode }

{ #category : #'*Typer-Inference' }
RBCascadeNode >> typSignalsAlways [
	^ self messages anySatisfy: [ :e | e typSignalsAlways = true ]
]

{ #category : #'*Typer-Inference' }
RBCascadeNode >> typTypeRecursive [
	^ (self messages collect: #typType) last
]
