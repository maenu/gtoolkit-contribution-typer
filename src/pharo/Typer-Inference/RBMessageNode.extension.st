Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfTypeForArgumentAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	| key |
	key := #typTypeForArgument , anInteger asString.
	^ self
		propertyAt: key
		ifAbsentPut: [ "typCastAs TypType"
			| receiverType argumentTypes |
			"need to set property to default to unknown on recursive calls"
			self propertyAt: key put: TypUnknownType new.
			receiverType := self typReceiverType.
			argumentTypes := self typArgumentTypes.
			TypMethodLookupIndex instance
				argumentTypeFor:
					(TypMethodLookup new
						receiverType: receiverType;
						selector: self selector asSymbol;
						argumentTypes: argumentTypes;
						argumentNodes: self arguments;
						yourself)
				at: anInteger ]
]
