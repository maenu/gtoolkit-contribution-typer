Extension { #name : #ClassDescription }

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaMethodResolverIndex [
	self flag: 'FIXME need to merge in case of multiple'.
	^ (self typShaShadows collect: #methodResolverIndex) ifEmpty: [ IdentityDictionary new ] ifNotEmpty: #first
]

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaShadows [
	self subclassResponsibility
]

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaTypeResolverIndex [
	self flag: 'FIXME need to merge in case of multiple'.
	^ (self typShaShadows collect: #typeResolverIndex)
		ifEmpty: [ TypTypeResolver new
				type: [ TypUnknownType instance ];
				yourself ]
		ifNotEmpty: #first
]

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaVariableResolverIndex [
	self flag: 'FIXME need to merge in case of multiple'.
	^ (self typShaShadows collect: #variableResolverIndex) ifEmpty: [ IdentityDictionary new ] ifNotEmpty: #first
]
