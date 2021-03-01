Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfAnnotateType: aType [
	"Annotates aType according to my comments used for casting and setting parameters."

	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'TypType'>
	^ self comments inject: aType into: [ :r :e | e typInfType: r ]
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfType [
	<typTypeResultAs: 'TypType'>
	| key |
	key := #typInfType.
	^ self
		propertyAt: key
		ifAbsent: [ "need to set property to default to unknown on recursive calls"
			self
				propertyAt: key put: TypUnknownType new;
				propertyAt: key
					put: (self typInfAnnotateType: self typInfTypeRecursive) ]
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfTypeRecursive [
	<typTypeResultAs: 'TypType'>
	^ TypUnknownType new
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfTypeReset [
	properties
		ifNotNil: [ (properties keys select: [ :e | e beginsWith: #typ ])
				do: [ :e | self removeProperty: e ] ].
	self children do: #typInfTypeReset
]
