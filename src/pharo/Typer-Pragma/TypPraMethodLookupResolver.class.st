Class {
	#name : #TypPraMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraMethodLookupResolver >> canResolve: aLookup [
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription ]
]

{ #category : #accessing }
TypPraMethodLookupResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	^ (aLookup receiver classDescription >> aLookup selector) typPraType
]
