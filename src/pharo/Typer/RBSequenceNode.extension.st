Extension { #name : #RBSequenceNode }

{ #category : #'*Typer' }
RBSequenceNode >> typIsReturnOnly [
	^ self statements size = 1 and: [ self statements first typIsReturnOnly ]
]

{ #category : #'*Typer' }
RBSequenceNode >> typIsSignal [
	^ statements anySatisfy: #typIsSignal
]

{ #category : #'*Typer' }
RBSequenceNode >> typTypeRecursive [
	self statements ifEmpty: [ ^ TypNilType instance ].
	^ (self statements collect: #typType) last
]
