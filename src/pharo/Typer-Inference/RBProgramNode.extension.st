Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Inference' }
RBProgramNode >> typAnnotateType: aType [
	"Annotates aType according to my comments used for casting and setting parameters."

	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'TypType'>
	^ self comments inject: aType into: [ :r :e | e typType: r ]
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typSignalsAlways [
	<typTypeResultAs: '{!,Boolean}'>
	^ false
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typType [
	<typTypeResultAs: 'TypType'>
	| key |
	key := #typType.
	^ self
		propertyAt: key
		ifAbsent: [ "need to set property to default to unknown on recursive calls"
			self
				propertyAt: key put: TypUnknownType new;
				propertyAt: key
					put: (self typAnnotateType: self typTypeRecursive) ]
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	^ TypUnknownType new
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typTypeReset [
	properties
		ifNotNil: [ (properties keys select: [ :e | e beginsWith: #typ ])
				do: [ :e | self removeProperty: e ] ].
	self children do: #typTypeReset
]
