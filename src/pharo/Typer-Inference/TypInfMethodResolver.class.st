Class {
	#name : #TypInfMethodResolver,
	#superclass : #TypResolver,
	#category : 'Typer-Inference'
}

{ #category : #accessing }
TypInfMethodResolver >> canResolve: aLookup [
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription
				and:
					[ aLookup receiver classDescription includesSelector: aLookup selector ] ]
]

{ #category : #accessing }
TypInfMethodResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	^ aLookup receiver classDescription >> aLookup selector
		typInfTypeIn: aLookup root receiver
]
