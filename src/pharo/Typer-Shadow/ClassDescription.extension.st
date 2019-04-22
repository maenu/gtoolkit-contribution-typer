Extension { #name : #ClassDescription }

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaMethodResolverIndex [
	self flag: 'FIXME need to merge in case of multiple'.
	^ (self typShaShadows collect: #methodResolverIndex) first
]

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaShadows [
	self subclassResponsibility
]

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaTypeResolverIndex [
	self flag: 'FIXME need to merge in case of multiple'.
	^ (self typShaShadows collect: #typeResolverIndex) first
]

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaVariableResolverIndex [
	self flag: 'FIXME need to merge in case of multiple'.
	^ (self typShaShadows collect: #variableResolverIndex) first
]
