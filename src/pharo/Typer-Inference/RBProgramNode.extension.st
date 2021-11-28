Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfAnnotateType: aType [
	"Annotates aType according to my comments used for casting and setting parameters."

	<typPraResult: 'TypType'>
	<typPraArguments: 'TypType'>
	^ self comments inject: aType into: [ :r :e | e typInfType: r ]
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfAstNodeSelf: aType [

	^ TypInfAstNode node: self self: aType
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfInvalidateSelf: aType [

	| prefix |
	prefix := 'typInf-' , aType hash asString , '-'.
	properties ifNotNil: [ 
		(properties keys select: [ :e | e beginsWith: prefix ]) do: [ :e | 
			self removeProperty: e ] ].
	self children
		reject: #isNil
		thenDo: [ :e | e typInfInvalidateSelf: aType ]
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfNilSelf: aType [

	^ (self typInfAstNodeSelf: aType)
		  addDependent: TypNilType new
		  label: #typInfNil
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfSelf [

	parent ifNotNil: [ ^ parent typInfSelf ].
	^ self typInfUnknownSelf: nil
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfType [

	^ self typInfTypeSelf: self typInfSelf
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfTypeRecursiveSelf: aType [

	<typPraResult: 'TypType'>
	^ self typInfUnknownSelf: aType
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfTypeSelf: aType [

	<typPraResult: 'TypType'>
	| prefix |
	prefix := 'typInf-' , aType hash asString , '-type'.
	^ self
		  propertyAt: prefix
		  ifAbsent: [ "need to set property to default to unknown on recursive calls"
			  self
				  propertyAt: prefix put: (self typInfUnknownSelf: aType);
				  propertyAt: prefix
				  put: (self typInfAnnotateType: ((self typInfAstNodeSelf: aType)
								    addDependent: (self typInfTypeRecursiveSelf: aType)
								    label: #typInfTypeRecursive)) ]
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfUnknownSelf: aType [

	^ (self typInfAstNodeSelf: aType)
		  addDependent: TypUnknownType new
		  label: #typInfUnknown
]
