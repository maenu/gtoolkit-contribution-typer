Extension { #name : #RBProgramNode }

{ #category : #'*Typer' }
RBProgramNode >> typType [
	<typTypeResultAs: 'TypType'>
	^ self typTypeWithDiscovered: Dictionary new
]

{ #category : #'*Typer' }
RBProgramNode >> typTypeRecursiveWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ TypUnknownType instance
]

{ #category : #'*Typer' }
RBProgramNode >> typTypeWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ aDictionary
		at: self
		ifAbsentPut: [ | type parameters |
			aDictionary at: self put: TypUnknownType instance.
			type := self typTypeRecursiveWithDiscovered: aDictionary.
			self comments
				detect: #typIsCastAs
				ifFound: [ :e | type := e typCastAs ]
				ifNone: [ {} ].
			parameters := (self comments
				detect: #typIsParameters
				ifFound: [ :e | e typParameters ]
				ifNone: [ {} ]) "typCastAs OrderedCollection<TypType>".
			parameters ifNotEmpty: [ type := type asParametricType: parameters ].
			type ]
]