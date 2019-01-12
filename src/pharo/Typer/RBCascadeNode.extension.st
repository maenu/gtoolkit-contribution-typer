Extension { #name : #RBCascadeNode }

{ #category : #'*Typer' }
RBCascadeNode >> typSignalsAlways [
	^ self messages anySatisfy: [ :e | e typSignalsAlways = true ]
]

{ #category : #'*Typer' }
RBCascadeNode >> typTypeRecursive [
	^ (self messages collect: #typType) last
]
