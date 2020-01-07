Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Core' }
RBBlockNode >> typTypeForArgumentAt: anInteger in: aContext [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := self typTypeIn: aContext.
	(self parent isMessage and: [ (self parent "typCastAs RBMessageNode") receiver ~~ self ])
		ifTrue: [ | i parent_ |
			parent_ := self parent "typCastAs RBMessageNode".
			i := parent_ arguments detectIndex: [ :e | e == self ].
			type := parent_ typTypeForArgumentAt: i in: aContext.
			type isUnion
				ifTrue: [ type := ((type "typCastAs TypUnionType") types select: #isFunction) typAsType ] ].
	(type isFunction and: [ anInteger <= (type "typCastAs TypFunctionType") arguments size ])
		ifTrue: [ ^ self typAnnotateType: ((type "typCastAs TypFunctionType") arguments at: anInteger) ].
	^ self typAnnotateType: TypUnknownType instance
]

{ #category : #'*Typer-Core' }
RBBlockNode >> typTypeForArgumentNamed: aString in: aContext [
	<typTypeArgument: 1 as: 'String'>
	<typTypeResultAs: 'TypType'>
	| i |
	i := self arguments detectIndex: [ :f | f name = aString ].
	^ self typTypeForArgumentAt: i in: aContext
]

{ #category : #'*Typer-Core' }
RBBlockNode >> typTypeForResultIn: aContext [
	<typTypeResultAs: 'TypType'>
	^ ((self typTypeIn: aContext) "typCastAs TypFunctionType") result
]

{ #category : #'*Typer-Core' }
RBBlockNode >> typTypeRecursiveIn: aContext [
	^ BlockClosure
		typAsFunctionTypeWithArguments: (self arguments collect: [ :e | e typTypeIn: aContext ])
		result: (self body typTypeIn: aContext)
		argumentsOptional: false
]
