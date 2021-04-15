Class {
	#name : #TypInfMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfMethodLookupResolver >> canResolve: aLookup [
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription
				and:
					[ aLookup receiver classDescription includesSelector: aLookup selector ] ]
]

{ #category : #accessing }
TypInfMethodLookupResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	^ aLookup receiver classDescription >> aLookup selector
		typInfTypeIn: aLookup root receiver
]
