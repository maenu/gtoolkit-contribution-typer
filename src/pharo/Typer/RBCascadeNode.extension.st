Extension { #name : #RBCascadeNode }

{ #category : #'*Typer' }
RBCascadeNode >> typSignalsAlways [
	^ self messages anySatisfy: #typSignalsAlways
]

{ #category : #'*Typer' }
RBCascadeNode >> typTypeRecursive [
	^ (self messages collect: #typType) last
]
