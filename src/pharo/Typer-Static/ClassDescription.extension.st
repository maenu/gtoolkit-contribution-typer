Extension { #name : #ClassDescription }

{ #category : #'*Typer-Static' }
ClassDescription >> typStaClassInstanceVariableResolver [
	self flag: 'TODO'
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaClassMethodResolver [
	self flag: 'TODO'
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaClassVariableResolver [
	self flag: 'TODO'
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaInstanceMethodResolver [
	self flag: 'TODO'
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaInstanceVariableResolver [
	self flag: 'TODO'
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaResolvesClassInstanceVariable: anAssociation [
	^ self typStaClassVariableResolver resolves: anAssociation
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaResolvesClassMethod: anAssociation [
	^ self typStaClassMethodResolver resolves: anAssociation
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaResolvesClassVariable: anAssociation [
	^ self typStaClassVariableResolver resolves: anAssociation
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaResolvesInstanceMethod: anAssociation [
	^ self typStaInstanceMethodResolver resolves: anAssociation
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaResolvesInstanceVariable: anAssociation [
	^ self typStaInstanceVariableResolver resolves: anAssociation
]
