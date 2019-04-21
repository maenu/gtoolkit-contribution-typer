Extension { #name : #ClassDescription }

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaMethodResolverIndex [
	^ self typShaShadows flatCollect: #methodResolverIndex
]

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaShadows [
	self subclassResponsibility
]

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaTypeResolverIndex [
	^ self typShaShadows flatCollect: #typeResolverIndex
]

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaVariableResolverIndex [
	^ self typShaShadows flatCollect: #variableResolverIndex
]
