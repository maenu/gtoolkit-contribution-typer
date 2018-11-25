Extension { #name : #ClassDescription }

{ #category : #'*Typer' }
ClassDescription >> typAsType [
	^ TypClassType new
		clazz: self;
		yourself
]

{ #category : #'*Typer' }
ClassDescription >> typTypesForVariableNamed: aString [
	^ self typTypesForVariableNamed: aString withDiscovered: Set new
]

{ #category : #'*Typer' }
ClassDescription >> typTypesForVariableNamed: aString withDiscovered: aSet [
	^ TypVariableResolvers instance typTypesForVariableNamed: aString ofClass: self withDiscovered: aSet
]
