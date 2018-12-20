Extension { #name : #RBProgramNode }

{ #category : #'*Typer' }
RBProgramNode >> typAllReachableChildrenAfter: aNode [
	^ (IdentitySet with: self)
		,
			(aNode == self
				ifTrue: [ IdentitySet new ]
				ifFalse: [ (self typReachableChildrenAfter: aNode) flatCollect: [ :e | e typAllReachableChildrenAfter: aNode ] ])
]

{ #category : #'*Typer' }
RBProgramNode >> typAllReachableChildrenBefore: aNode [
	^ (aNode == self or: [ (self allChildren asIdentitySet includes: aNode) not ])
		ifTrue: [ IdentitySet new ]
		ifFalse: [ (self parent ifNil: [ IdentitySet new ] ifNotNil: [ :e | e typAllReachableChildrenBefore: self ])
				,
					((self typReachableChildrenBefore: aNode)
						flatCollect: [ :e | 
							{e}
								,
									(e isBlock
										ifTrue: [ {} ]
										ifFalse: [ e allChildren ]) ]) ]
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
RBProgramNode >> typReachableChildrenAfter: aNode [
	| children i |
	children := self children.
	i := children indexOf: aNode.
	i = 0
		ifTrue: [ ^ children ].
	i = children size
		ifTrue: [ ^ {} ].
	^ (children copyFrom: i + 1 to: children size) asIdentitySet
]

{ #category : #'*Typer' }
RBProgramNode >> typReachableChildrenBefore: aNode [
	^ aNode parents
		detect: [ :e | e parent == self ]
		ifFound: [ :e | 
			| children i |
			children := self children.
			i := children indexOf: e.
			i = children size
				ifTrue: [ IdentitySet new ]
				ifFalse: [ (children copyFrom: 1 to: i - 1) asIdentitySet ] ]
		ifNone: [ IdentitySet new ]
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
