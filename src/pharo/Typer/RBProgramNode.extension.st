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
RBProgramNode >> typAllReachableChildrenBefore [
	^ self children , (self children flatCollect: #typAllReachableChildrenBefore)
]

{ #category : #'*Typer' }
RBProgramNode >> typAllReachableChildrenBefore: aNode [
	^ (aNode == self or: [ (aNode parents asIdentitySet includes: self) not ])
		ifTrue: [ IdentitySet new ]
		ifFalse: [ | node children i |
			node := aNode parents reversed detect: [ :e | e parent == self ].
			children := self children.
			i := children detectIndex: [ :e | e == node ].
			children := (children copyFrom: 1 to: i) asOrderedCollection copy.
			(children removeLast typAllReachableChildrenBefore: aNode)
				, (children flatCollect: [ :e | e typAllReachableChildrenBefore , {e} ]) ]
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
	i := children detectIndex: [ :e | e == aNode ] ifNone: 0.
	i = 0
		ifTrue: [ ^ children ].
	i = children size
		ifTrue: [ ^ {} ].
	^ (children copyFrom: i + 1 to: children size) asIdentitySet
]

{ #category : #'*Typer' }
RBProgramNode >> typReachableChildrenBefore: aNode [
	^ aNode parents reversed
		detect: [ :e | e parent == self ]
		ifFound: [ :e | 
			| children i |
			children := self children.
			i := children detectIndex: [ :f | f == e ].
			i = 1
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
