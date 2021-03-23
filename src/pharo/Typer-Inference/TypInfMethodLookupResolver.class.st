Class {
	#name : #TypInfMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfMethodLookupResolver >> resolveBasic: aLookup [
	| classDescription selector |
	aLookup receiver isNamed
		ifFalse: [ ^ #() ].
	aLookup receiver hasClassDescription
		ifFalse: [ ^ #() ].
	classDescription := aLookup receiver classDescription.
	selector := aLookup selector.
	(classDescription lookupSelector: selector)
		ifNil: [ ^ #() ]
		ifNotNil: [ :e | 
			^ {(e typInfType
				addOrigin: aLookup asOrigin;
				yourself)} ]
]
