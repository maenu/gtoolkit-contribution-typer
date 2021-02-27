Class {
	#name : #TypInfVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfVariableLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	| classDescription selector |
	aLookup push: self.
	aLookup receiver isNamed
		ifFalse: [ ^ #() ].
	aLookup receiver hasClassDescription
		ifFalse: [ ^ #() ].
	classDescription := aLookup receiver classDescription.
	selector := aLookup selector.
	classDescription allSlots
		detect: [ :e | e name = selector ]
		ifFound: [ :e | ^ (e assignmentNodes collect: #typType) typAsType ].
	self flag: '...or we just take the type of the value?'.
	classDescription isInstanceSide
		ifTrue: [ classDescription allClassVariables
				detect: [ :e | e name = selector ]
				ifFound: [ :e | ^ (e assignmentNodes collect: #typType) typAsType ] ].
	^ #()
]
