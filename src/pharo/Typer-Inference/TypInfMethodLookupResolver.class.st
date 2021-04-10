Class {
	#name : #TypInfMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfMethodLookupResolver >> resolve: aLookup [
	| classDescription selector |
	aLookup push: self.
	aLookup receiver isNamed
		ifFalse: [ ^ self unknown ].
	aLookup receiver hasClassDescription
		ifFalse: [ ^ self unknown ].
	classDescription := aLookup receiver classDescription.
	selector := aLookup selector.
	(classDescription lookupSelector: selector)
		ifNil: [ ^ self unknown ]
		ifNotNil: [ :e | 
			^ (e typInfTypeIn: aLookup root receiver)
				addOrigin: aLookup asOrigin;
				yourself ]
]
