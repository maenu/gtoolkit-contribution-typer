Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfAnnotateType: aType [
	"Annotates aType according to my comments used for casting and setting parameters."

	<typPraResult: 'TypType'>
	<typPraArguments: 'TypType'>
	^ self comments inject: aType into: [ :r :e | e typInfType: r ]
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfAstNode [

	^ TypInfAstNode node: self
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfInvalidate [

	properties ifNotNil: [ 
		(properties keys select: [ :e | e beginsWith: 'typ' ]) do: [ :e | 
			self removeProperty: e ] ].
	self children reject: #isNil thenDo: #typInfInvalidate
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfNil [

	^ self typInfAstNode addDependent: TypNilType new label: #typInfNil
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfType [

	<typPraResult: 'TypType'>
	| identifier |
	identifier := TypInfSelf value hash asString.
	^ self
		  propertyAt: 'typInfType-' , identifier
		  ifAbsent: [ "need to set property to default to unknown on recursive calls"
			  self
				  propertyAt: 'typInfType-' , identifier put: self typInfUnknown;
				  propertyAt: 'typInfType-' , identifier
				  put: (self typInfAnnotateType: (self typInfAstNode
								    addDependent: self typInfTypeRecursive
								    label: #typInfTypeRecursive)) ]
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
RBProgramNode >> typInfUnknown [

	^ self typInfAstNode
		  addDependent: TypUnknownType new
		  label: #typInfUnknown
]
