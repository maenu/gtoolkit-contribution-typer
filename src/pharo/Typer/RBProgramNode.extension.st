Extension { #name : #RBProgramNode }

{ #category : #'*Typer' }
RBProgramNode >> typAnnotateType: aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := aType.
	self comments
		detect: #typIsCastAs
		ifFound: [ :e | type := e typCastAs ]
		ifNone: [  ].
	self comments
		detect: #typIsParameters
		ifFound: [ :f | 
			| parameters |
			parameters := f typParameters.
			(type canBeParametricType and: [ parameters isNotEmpty ])
				ifTrue: [ type := type asParametricType: parameters ] ]
		ifNone: [  ].
	^ type
]

{ #category : #'*Typer' }
RBProgramNode >> typType [
	<typTypeResultAs: 'TypType'>
	^ self
		propertyAt: #typType
		ifAbsentPut: [ "need to set property to default to unknown on recursive calls"
			self propertyAt: #typType put: TypUnknownType instance.
			self typAnnotateType: self typTypeRecursive ]
]

{ #category : #'*Typer' }
RBProgramNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	self subclassResponsibility
]

{ #category : #'*Typer' }
RBProgramNode >> typTypeReset [
	self removeProperty: #typType ifAbsent: [  ].
	self children do: #typTypeReset
]
