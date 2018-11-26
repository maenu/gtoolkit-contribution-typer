Extension { #name : #ClassDescription }

{ #category : #'*Typer' }
ClassDescription >> typAsType [
	^ TypClassType new
		clazz: self;
		yourself
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForClassInstanceVariableNamed: aSymbol [
	^ self typTypeForClassInstanceVariableNamed: aSymbol withDiscovered: Set new
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForClassInstanceVariableNamed: aSymbol withDiscovered: aSet [
	^ TypVariableResolvers instance typTypeForVariableNamed: aSymbol ofClass: self class withDiscovered: aSet
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForClassVariableNamed: aSymbol [
	^ self typTypeForClassVariableNamed: aSymbol withDiscovered: Set new
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForClassVariableNamed: aSymbol withDiscovered: aSet [
	^ TypVariableResolvers instance typTypeForVariableNamed: aSymbol ofClass: self instanceSide withDiscovered: aSet
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForInstanceVariableNamed: aSymbol [
	^ self typTypeForInstanceVariableNamed: aSymbol withDiscovered: Set new
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForInstanceVariableNamed: aSymbol withDiscovered: aSet [
	^ TypVariableResolvers instance typTypeForVariableNamed: aSymbol ofClass: self withDiscovered: aSet
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForPoolVariableNamed: aSymbol [
	^ self typTypeForPoolVariableNamed: aSymbol withDiscovered: Set new
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForPoolVariableNamed: aSymbol withDiscovered: aSet [
	^ TypVariableResolvers instance typTypeForVariableNamed: aSymbol ofClass: self instanceSide withDiscovered: aSet
]
