Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfAnnotateType: aType [
	"Annotates aType according to my comments used for casting and setting parameters."

	<typPraResult: 'TypType'>
	<typPraArguments: 'TypType'>
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
	<typPraResult: 'TypType'>
	^ self
		propertyAt: 'typInfType-' , TypInfSelf value asString
		ifAbsent: [ "need to set property to default to unknown on recursive calls"
			self
				propertyAt: 'typInfType-' , TypInfSelf value asString
					put: self typInfUnknown;
				propertyAt: 'typInfType-' , TypInfSelf value asString
					put:
					(self
						typInfAnnotateType:
							(self typInfTypeRecursive
								addOrigin: (TypInfNodeOrigin node: self);
								yourself)) ]
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfTypeIn: aType [
	^ TypInfSelf value: aType during: [ self typInfType ]
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfTypeRecursive [
	<typPraResult: 'TypType'>
	^ self typInfUnknown
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfTypeReset [

	properties ifNotNil: [ 
		(properties keys select: [ :e | e beginsWith: #typInf ]) do: [ :e | 
			self removeProperty: e ] ].
	self children do: #typInfTypeReset
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfUnknown [
	^ TypUnknownType new
		addOrigin: (TypInfNodeOrigin node: self);
		yourself
]
