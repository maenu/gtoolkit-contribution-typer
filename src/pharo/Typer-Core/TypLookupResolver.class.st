Class {
	#name : #TypLookupResolver,
	#superclass : #Object,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookupResolver >> canResolve: aLookup [

	<typPraArguments: 'TypLookup'>
	<typPraResult: 'Boolean'>
	self subclassResponsibility
]

{ #category : #accessing }
TypLookupResolver >> reduce: aCollection [

	aCollection ifEmpty: [ 
		^ TypUnknownType new copyWithOrigins:
			  { (TypLookupAlternativeOrigin alternatives: #(  )) } ].
	aCollection sort.
	^ aCollection first copyWithOrigins:
		  { (TypLookupAlternativeOrigin alternatives:
			   aCollection copyWithoutFirst) }
]

{ #category : #initialization }
TypLookupResolver >> reset [
	
]

{ #category : #accessing }
TypLookupResolver >> resolve: aLookup [
	self subclassResponsibility
]
