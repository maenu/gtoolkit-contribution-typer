Extension { #name : #RBGlobalNode }

{ #category : #'*Typer' }
RBGlobalNode >> typTypeWithDiscovered: aDictionary [
	^ aDictionary
		at: self
		ifAbsentPut: [ self binding isGlobalClassNameBinding
				ifTrue: [ self binding value class typAsType ]
				ifFalse: [ | type |
					type := self binding isClassVariable
						ifTrue: [ self methodNode methodClass instanceSide typAsType ]
						ifFalse: [ self methodNode methodClass instanceSide typAsType ].
					TypVariableResolvers instance typeForVariable: type -> name ] ]
]
