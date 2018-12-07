Extension { #name : #RBProgramNode }

{ #category : #'*Typer' }
RBProgramNode >> typType [
	<typTypeResultAs: 'TypType'>
	^ self
		propertyAt: #typType
		ifAbsentPut: [ | type parameters |
			"need to set property to default to unknown on recursive calls"
			self propertyAt: #typType put: TypUnknownType instance.
			type := self typTypeRecursive.
			self comments detect: #typIsCastAs ifFound: [ :e | type := e typCastAs ] ifNone: [ {} ].
			parameters := self comments detect: #typIsParameters ifFound: [ :e | e typParameters ] ifNone: [ {} "typCastAs OrderedCollection<TypType>" ].
			parameters ifNotEmpty: [ type := type asParametricType: parameters ].
			type ]
]

{ #category : #'*Typer' }
RBProgramNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	^ TypUnknownType instance
]
