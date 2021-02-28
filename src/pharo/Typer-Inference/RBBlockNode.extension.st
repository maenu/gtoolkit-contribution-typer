Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Inference' }
RBBlockNode >> typInfResult [
	<typTypeResultAs: 'TypType'>
	^ ((self typInfType) "typCastAs TypFunctionType") result
]

{ #category : #'*Typer-Inference' }
RBBlockNode >> typInfTypeForArgumentAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	| type |
	type := self typInfType.
	(self parent isMessage
		and: [ self parent receiver ~~ self	"typCastAs RBMessageNode" ])
		ifTrue: [ | i parent_ |
			parent_ := self parent.	"typCastAs RBMessageNode"
			i := parent_ arguments detectIndex: [ :e | e == self ].
			type := parent_ typInfTypeForArgumentAt: i.
			type isUnion
				ifTrue:
					[ type := (type types select: #isFunction) typAsType	"typCastAs TypUnionType" ] ].
	(type isFunction
		and: [ anInteger <= type arguments size	"typCastAs TypFunctionType" ])
		ifTrue: [ ^ type arguments at: anInteger	"typCastAs TypFunctionType" ].
	^ TypUnknownType new
]

{ #category : #'*Typer-Inference' }
RBBlockNode >> typInfTypeForArgumentNamed: aString [
	<typTypeArgument: 1 as: 'String'>
	| i |
	i := self arguments detectIndex: [ :f | f name = aString ].
	^ self typInfTypeForArgumentAt: i
]

{ #category : #'*Typer-Inference' }
RBBlockNode >> typInfTypeRecursive [
	^ BlockClosure
		typAsFunctionTypeWithResult: self body typInfType
		arguments: (self arguments collect: #typInfType)
		argumentsOptional: false
		signalsAlways: self body typInfSignalsAlways
]
