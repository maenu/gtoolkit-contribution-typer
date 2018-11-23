Extension { #name : #ClassDescription }

{ #category : #'*Typer' }
ClassDescription >> typTypesForVariableNamed: aString [
	^ self typTypesForVariableNamed: aString withDiscovered: Set new
]

{ #category : #'*Typer' }
ClassDescription >> typTypesForVariableNamed: aString withDiscovered: aSet [
	self flag: 'this is static/dynamic inferrence'.
	^ (((((self withAllSuperclasses flatCollect: #methods) flatCollect: #instanceVariableWriteNodes) select: [ :e | e name = aString ]) collect: #parent)
		collect: [ :e | 
			(aSet includes: e)
				ifTrue: [ TypTypes new ]
				ifFalse: [ e typTypesWithDiscovered: aSet ] ]) inject: TypTypes new into: [ :a :b | a , b ]
]
