Class {
	#name : #TypLookupResolver,
	#superclass : #Object,
	#category : #'Typer-Core-Lookup'
}

{ #category : #resolving }
TypLookupResolver >> canResolve: aLookup [

	<typPraArguments: 'TypLookup'>
	<typPraResult: 'Boolean'>
	self subclassResponsibility
]

{ #category : #invalidation }
TypLookupResolver >> invalidateOn: aClassOrMethodAnnouncement [

	
]

{ #category : #resetting }
TypLookupResolver >> reset [
	
]

{ #category : #resolving }
TypLookupResolver >> resolve: aLookup [
	self subclassResponsibility
]
