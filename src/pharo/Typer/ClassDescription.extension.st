Extension { #name : #ClassDescription }

{ #category : #'*Typer' }
ClassDescription >> typAsType [
	^ TypClassType new
		clazz: self;
		yourself
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForClassInstanceVariableNamed: aString [
	^ self typTypeForClassInstanceVariableNamed: aString withDiscovered: Set new
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForClassInstanceVariableNamed: aString withDiscovered: aSet [
	^ TypVariableResolvers instance typTypeForVariableNamed: aString ofClass: self class withDiscovered: aSet
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForClassVariableNamed: aString [
	^ self typTypeForClassVariableNamed: aString withDiscovered: Set new
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForClassVariableNamed: aString withDiscovered: aSet [
	^ TypVariableResolvers instance typTypeForVariableNamed: aString ofClass: self instanceSide withDiscovered: aSet
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForInstanceVariableNamed: aString [
	^ self typTypeForInstanceVariableNamed: aString withDiscovered: Set new
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForInstanceVariableNamed: aString withDiscovered: aSet [
	^ TypVariableResolvers instance typTypeForVariableNamed: aString ofClass: self withDiscovered: aSet
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForPoolVariableNamed: aString [
	^ self typTypeForPoolVariableNamed: aString withDiscovered: Set new
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForPoolVariableNamed: aString withDiscovered: aSet [
	^ TypVariableResolvers instance typTypeForVariableNamed: aString ofClass: self instanceSide withDiscovered: aSet
]
