Extension { #name : #RBProgramNode }

{ #category : #'*Typer' }
RBProgramNode >> typAllChildrenBefore: aNode [
	^ aNode == self
		ifTrue: [ {} ]
		ifFalse: [ (self parent ifNil: [ {} ] ifNotNil: [ :e | e typAllChildrenBefore: self ]) , {self} , (self typChildrenBefore: aNode) ]
]

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
RBProgramNode >> typChildrenBefore: aNode [
	| children i |
	children := self children.
	i := children indexOf: aNode.
	i = 0
		ifTrue: [ ^ children ].
	i = 1
		ifTrue: [ ^ {} ].
	^ children copyFrom: 1 to: i - 1
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
