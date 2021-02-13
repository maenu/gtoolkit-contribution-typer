Extension { #name : #RBCascadeNode }

{ #category : #'*Typer-Core' }
RBCascadeNode >> typSignalsAlways [
	^ self messages anySatisfy: [ :e | (e typSignalsAlways) = true ]
]

{ #category : #'*Typer-Core' }
RBCascadeNode >> typTypeRecursive [
	^ (self messages collect: [ :e | e typType ]) last
]
