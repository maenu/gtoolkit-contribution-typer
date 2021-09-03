Class {
	#name : #TypShaLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaLookupResolver >> reduce: aCollection [

	aCollection ifEmpty: [ 
		^ TypUnknownType origin:
			  (TypLookupAlternativeOrigin alternatives: #(  )) ].
	aCollection sort.
	^ aCollection first copyWithOrigins:
		  { (TypLookupAlternativeOrigin alternatives:
			   aCollection copyWithoutFirst) }
]
