Class {
	#name : #TypShaResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaResolver >> reduce: aCollection [

	aCollection ifEmpty: [ 
		^ TypUnknownType origin:
			  (TypLookupAlternativeOrigin alternatives: #(  )) ].
	aCollection sort.
	^ aCollection first copyWithOrigins:
		  { (TypLookupAlternativeOrigin alternatives:
			   aCollection copyWithoutFirst) }
]
