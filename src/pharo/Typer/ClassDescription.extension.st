Extension { #name : #ClassDescription }

{ #category : #'*Typer' }
ClassDescription >> typAsType [
	^ TypClassType new
		clazz: self;
		yourself
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForVariableNamed: aString [
	^ self typTypeForVariableNamed: aString withDiscovered: Set new
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForVariableNamed: aString withDiscovered: aSet [
	^ TypVariableResolvers instance typTypeForVariableNamed: aString ofClass: self withDiscovered: aSet
]
