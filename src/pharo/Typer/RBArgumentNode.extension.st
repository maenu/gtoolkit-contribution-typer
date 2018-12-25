Extension { #name : #RBArgumentNode }

{ #category : #'*Typer' }
RBArgumentNode >> typTypeRecursive [
	^ ((self parent isBlock or: [ self parent isMethod ]) and: [ self parent arguments anySatisfy: [ :e | e == self ] ])
		ifTrue: [ self parent typTypeForArgumentNamed: self name ]
		ifFalse: [ ((self whoDefines: self name) arguments detect: [ :e | e name = self name ]) typType ]
]
