Class {
	#name : 'TypResolver',
	#superclass : 'TypNode',
	#category : 'Typer-Core-Lookup'
}

{ #category : 'resolving' }
TypResolver >> canResolve: aLookup [

	<typPraArguments: 'TypLookup'>
	<typPraResult: 'Boolean'>
	self subclassResponsibility
]

{ #category : 'invalidation' }
TypResolver >> invalidateOn: aClassOrMethodAnnouncement [

	
]

{ #category : 'resetting' }
TypResolver >> reset [
	
]

{ #category : 'resolving' }
TypResolver >> resolve: aLookup [
	self subclassResponsibility
]
