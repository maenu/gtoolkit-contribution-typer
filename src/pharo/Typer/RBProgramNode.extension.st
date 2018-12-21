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
RBProgramNode >> typPrevious [
	| i |
	self parent ifNil: [ ^ nil ].
	i := self parent children detectIndex: [ :e | e == self ].
	i = 1
		ifTrue: [ ^ nil ].
	^ self parent children at: i - 1
]

{ #category : #'*Typer' }
RBProgramNode >> typReachableTypeFor: aString until: aMethodOrBlockNode [
	| previous |
	self == aMethodOrBlockNode
		ifTrue: [ ^ TypNilType instance ].
	previous := self typPrevious ifNil: [ ^ self parent typReachableTypeFor: aString until: aMethodOrBlockNode ].
	(previous isAssignment and: [ previous variable name = aString ])
		ifTrue: [ ^ previous typType ].
	^ previous typReachableTypeFor: aString until: aMethodOrBlockNode
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
	^ TypUnknownType instance
]

{ #category : #'*Typer' }
RBProgramNode >> typTypeReset [
	self removeProperty: #typType ifAbsent: [  ].
	self children do: #typTypeReset
]
