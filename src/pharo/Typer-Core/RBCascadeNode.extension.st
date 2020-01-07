Extension { #name : #RBCascadeNode }

{ #category : #'*Typer-Core' }
RBCascadeNode >> typSignalsAlwaysIn: aContext [
	^ self messages anySatisfy: [ :e | (e typSignalsAlwaysIn: aContext) = true ]
]

{ #category : #'*Typer-Core' }
RBCascadeNode >> typTypeRecursiveIn: aContext [
	^ (self messages collect: [ :e | e typTypeIn: aContext ]) last
]
