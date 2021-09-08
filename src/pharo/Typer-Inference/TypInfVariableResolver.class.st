Class {
	#name : #TypInfVariableResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfVariableResolver >> canResolve: aLookup [
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription
				and: [ (aLookup receiver classDescription hasSlotNamed: aLookup selector)
						or: [ aLookup receiver classDescription instanceSide allClassVariables
								anySatisfy: [ :e | e name = aLookup selector ] ] ] ]
]

{ #category : #accessing }
TypInfVariableResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	(aLookup receiver classDescription hasSlotNamed: aLookup selector)
		ifTrue: [ ^ ((aLookup receiver classDescription slotNamed: aLookup selector)
				assignmentNodes collect: [ :e | e typInfTypeIn: aLookup receiver ]) typAsType ].
	self flag: '...or we just take the type of the value?'.
	^ ((aLookup receiver classDescription instanceSide allClassVariables
		detect: [ :e | e name = aLookup selector ]) assignmentNodes
		collect: #typInfType) typAsType
]
