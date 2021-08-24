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

	^ TypNilType new copyWithOrigins: { (TypInfNodeOrigin node: self) }
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
					  (self typInfAnnotateType:
							   (self typInfTypeRecursive copyWithOrigins:
									    { (TypInfNodeOrigin node: self) })) ]
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
		(properties keys select: [ :e | e beginsWith: #typ ]) do: [ :e | 
			self removeProperty: e ] ].
	self children reject: #isNil thenDo: #typInfTypeReset
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfUnknown [

	^ TypUnknownType new copyWithOrigins:
		  { (TypInfNodeOrigin node: self) }
]
