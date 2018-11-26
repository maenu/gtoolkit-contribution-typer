Extension { #name : #ClassDescription }

{ #category : #'*Typer-Static' }
ClassDescription >> typStaClassInstanceVariableResolver [
	^ TypVariableResolvers new
		resolvers: self typStaClassInstanceVariableResolvers;
		yourself
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaClassInstanceVariableResolvers [
	^ OrderedCollection new
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaClassMethodResolver [
	^ TypMethodResolvers new
		resolvers: self typStaClassMethodResolvers;
		yourself
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaClassMethodResolvers [
	^ OrderedCollection new
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaClassVariableResolver [
	^ TypVariableResolvers new
		resolvers: self typStaClassVariableResolvers;
		yourself
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaClassVariableResolvers [
	^ OrderedCollection new
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaInstanceMethodResolver [
	^ TypMethodResolvers new
		resolvers: self typStaInstanceMethodResolvers;
		yourself
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaInstanceMethodResolvers [
	^ OrderedCollection new
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaInstanceVariableResolver [
	^ TypVariableResolvers new
		resolvers: self typStaInstanceVariableResolvers;
		yourself
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaInstanceVariableResolvers [
	^ OrderedCollection new
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
