Extension { #name : #ClassDescription }

{ #category : #'*Typer-Static' }
ClassDescription >> typStaClassInstanceVariableResolver [
	<typTypeResultAs: 'TypVariableResolver'>
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
	<typTypeResultAs: 'TypMethodResolver'>
	^ TypMethodResolvers new
		resolvers: self typStaClassMethodResolvers;
		yourself
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaClassMethodResolvers [
	<typTypeResultAs: 'OrderedCollection<TypMethodResolver>'>
	^ OrderedCollection new
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaClassVariableResolver [
	<typTypeResultAs: 'TypVariableResolver'>
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
	<typTypeResultAs: 'TypMethodResolver'>
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
	<typTypeResultAs: 'TypVariableResolver'>
	^ TypVariableResolvers new
		resolvers: self typStaInstanceVariableResolvers;
		yourself
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaInstanceVariableResolvers [
	^ OrderedCollection new
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaResolvesClassInstanceVariable: aVariableLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'Boolean'>
	^ self typStaClassVariableResolver resolves: aVariableLookup
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaResolvesClassMethod: aMethodLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'Boolean'>
	^ self typStaClassMethodResolver resolves: aMethodLookup
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaResolvesClassVariable: anAssociation [
	^ self typStaClassVariableResolver resolves: anAssociation
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaResolvesInstanceMethod: aMethodLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'Boolean'>
	^ self typStaInstanceMethodResolver resolves: aMethodLookup
]

{ #category : #'*Typer-Static' }
ClassDescription >> typStaResolvesInstanceVariable: aVariableLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'Boolean'>
	^ self typStaInstanceVariableResolver resolves: aVariableLookup
]
