Extension { #name : #RBValueNode }

{ #category : #'*Typer' }
RBValueNode >> typType [
	^ self typTypeWithDiscovered: Dictionary new
]

{ #category : #'*Typer' }
RBValueNode >> typTypeRecursiveWithDiscovered: aDictionary [
	^ Object typAsType
]

{ #category : #'*Typer' }
RBValueNode >> typTypeWithDiscovered: aDictionary [
	^ aDictionary
		at: self
		ifAbsentPut: [ | type parameters |
			aDictionary at: self put: TypUnknownType instance.
			type := self typTypeRecursiveWithDiscovered: aDictionary.
			self comments
				detect: #typIsCastAs
				ifFound: [ :e | type := e typCastAs ]
				ifNone: [ {} ].
			parameters := self comments
				detect: #typIsParameters
				ifFound: [ :e | e typParameters ]
				ifNone: [ {} ].
			parameters ifNotEmpty: [ type := type asParametricType: parameters ].
			type ]
]
