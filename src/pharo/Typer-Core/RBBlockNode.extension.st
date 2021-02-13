Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Core' }
RBBlockNode >> typTypeForArgumentAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	| type |
	type := self typType.
	(self parent isMessage and: [ (self parent "typCastAs RBMessageNode") receiver ~~ self ])
		ifTrue: [ | i parent_ |
			parent_ := self parent "typCastAs RBMessageNode".
			i := parent_ arguments detectIndex: [ :e | e == self ].
			type := parent_ typTypeForArgumentAt: i.
			type isUnion
				ifTrue: [ type := ((type "typCastAs TypUnionType") types select: #isFunction) typAsType ] ].
	(type isFunction and: [ anInteger <= (type "typCastAs TypFunctionType") arguments size ])
		ifTrue: [ ^ self typAnnotateType: ((type "typCastAs TypFunctionType") arguments at: anInteger) ].
	^ self typAnnotateType: TypUnknownType instance
]

{ #category : #'*Typer-Core' }
RBBlockNode >> typTypeForArgumentNamed: aString [
	<typTypeArgument: 1 as: 'String'>
	| i |
	i := self arguments detectIndex: [ :f | f name = aString ].
	^ self typTypeForArgumentAt: i
]

{ #category : #'*Typer-Core' }
RBBlockNode >> typTypeForResult [
	<typTypeResultAs: 'TypType'>
	^ ((self typType) "typCastAs TypFunctionType") result
]

{ #category : #'*Typer-Core' }
RBBlockNode >> typTypeRecursive [
	^ BlockClosure
		typAsFunctionTypeWithArguments: (self arguments collect: [ :e | e typType ])
		result: (self body typType)
		argumentsOptional: false
]
