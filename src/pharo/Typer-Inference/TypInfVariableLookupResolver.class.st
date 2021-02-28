Class {
	#name : #TypInfVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfVariableLookupResolver >> resolveBasic: aLookup [
	| classDescription selector |
	aLookup receiver isNamed
		ifFalse: [ ^ #() ].
	aLookup receiver hasClassDescription
		ifFalse: [ ^ #() ].
	classDescription := aLookup receiver classDescription.
	selector := aLookup selector.
	classDescription allSlots
		detect: [ :e | e name = selector ]
		ifFound: [ :e | 
			^ {((e assignmentNodes collect: #typType) typAsType
				origin: aLookup asOrigin;
				yourself)} ].
	self flag: '...or we just take the type of the value?'.
	classDescription isInstanceSide
		ifTrue: [ classDescription allClassVariables
				detect: [ :e | e name = selector ]
				ifFound: [ :e | 
					^ {((e assignmentNodes collect: #typType) typAsType
						origin: aLookup asOrigin;
						yourself)} ] ].
	^ #()
]
