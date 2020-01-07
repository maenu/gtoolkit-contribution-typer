Extension { #name : #RBSequenceNode }

{ #category : #'*Typer-Core' }
RBSequenceNode >> typSignalsAlwaysIn: aContext [
	^ self statements anySatisfy: [ :e | (e typSignalsAlwaysIn: aContext) = true ]
]

{ #category : #'*Typer-Core' }
RBSequenceNode >> typTypeRecursiveIn: aContext [
	self statements ifEmpty: [ ^ TypNilType instance ].
	^ (self statements collect: [ :e | e typTypeIn: aContext ]) last
]
