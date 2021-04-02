Class {
	#name : #TypInfVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfVariableLookupResolver >> resolve: aLookup [
	| classDescription selector |
	aLookup push: self.
	aLookup receiver isNamed
		ifFalse: [ ^ self unknown ].
	aLookup receiver hasClassDescription
		ifFalse: [ ^ self unknown ].
	classDescription := aLookup receiver classDescription.
	selector := aLookup selector.
	classDescription allSlots
		detect: [ :e | e name = selector ]
		ifFound: [ :e | 
			^ (e assignmentNodes collect: #typInfType) typAsType
				addOrigin: aLookup asOrigin;
				yourself ].
	self flag: '...or we just take the type of the value?'.
	classDescription isInstanceSide
		ifTrue: [ classDescription allClassVariables
				detect: [ :e | e name = selector ]
				ifFound: [ :e | 
					^ (e assignmentNodes collect: #typInfType) typAsType
						addOrigin: aLookup asOrigin;
						yourself ] ].
	^ self unknown
]
