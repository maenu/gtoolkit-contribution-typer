Extension { #name : #RBCascadeNode }

{ #category : #'*Typer' }
RBCascadeNode >> typIsSignal [
	^ self messages last typIsSignal
]

{ #category : #'*Typer' }
RBCascadeNode >> typTypeRecursive [
	^ (self messages collect: #typType) last
]
