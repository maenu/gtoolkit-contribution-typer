Extension { #name : #RBProgramNode }

{ #category : #'*Typer' }
RBProgramNode >> typType [
	<typTypeResultAs: 'TypType'>
	^ self
		propertyAt: #typType
		ifAbsentPut: [ | type |
			"need to set property to default to unknown on recursive calls"
			self propertyAt: #typType put: TypUnknownType instance.
			type := self typTypeRecursive.
			self comments detect: #typIsCastAs ifFound: [ :e | type := e typCastAs ] ifNone: [  ].
			self comments
				detect: #typIsParameters
				ifFound: [ :e | 
					| parameters |
					parameters := e typParameters.
					(type canBeParametricType and: [ parameters isNotEmpty ])
						ifTrue: [ type := type asParametricType: parameters ] ]
				ifNone: [  ].
			type ]
]

{ #category : #'*Typer' }
RBProgramNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	^ TypUnknownType instance
]

{ #category : #'*Typer' }
RBProgramNode >> typTypeReset [
	self removeProperty: #typType ifAbsent: [  ].
	self children do: #typTypeReset
]
