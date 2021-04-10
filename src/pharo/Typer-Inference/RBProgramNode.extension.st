Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfAnnotateType: aType [
	"Annotates aType according to my comments used for casting and setting parameters."

	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'TypType'>
	^ self comments inject: aType into: [ :r :e | e typInfType: r ]
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfNil [
	^ TypNilType new
		addOrigin: (TypInfNodeOrigin node: self);
		yourself
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfType [
	<typTypeResultAs: 'TypType'>
	^ self
		propertyAt: 'typInfType-' , TypInfSelf value asString
		ifAbsent: [ "need to set property to default to unknown on recursive calls"
			self
				propertyAt: 'typInfType-' , TypInfSelf value asString put: self typInfUnknown;
				propertyAt: 'typInfType-' , TypInfSelf value asString
					put: (self typInfAnnotateType: self typInfTypeRecursive) ]
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfTypeIn: aType [
	^ TypInfSelf value: aType during: [ self typInfType ]
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfTypeRecursive [
	<typTypeResultAs: 'TypType'>
	^ self typInfUnknown
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfTypeReset [
	properties
		ifNotNil: [ (properties keys
				select: [ :e | 
					(e beginsWith: #typInf)
						and: [ TypInfSelf value isNil
								or: [ e endsWith: '-' , TypInfSelf value asString ] ] ])
				do: [ :e | self removeProperty: e ] ].
	self children do: #typInfTypeReset
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfUnknown [
	^ TypUnknownType new
		addOrigin: (TypInfNodeOrigin node: self);
		yourself
]
