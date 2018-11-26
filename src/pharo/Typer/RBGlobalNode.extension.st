Extension { #name : #RBGlobalNode }

{ #category : #'*Typer' }
RBGlobalNode >> typTypeWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	^ self binding isClassVariable
		ifTrue: [ self methodNode methodClass instanceSide typTypeForClassVariableNamed: name withDiscovered: aSet ]
		ifFalse: [ self binding isFromSharedPool
				ifTrue: [ self methodNode methodClass instanceSide typTypeForPoolVariableNamed: name withDiscovered: aSet ]
				ifFalse: [ self binding value class typAsType ] ]
]
